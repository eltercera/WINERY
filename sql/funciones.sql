
/* pais_valido
 * Valida si el pais se encuentra en la tabla lugar
 */

CREATE OR REPLACE FUNCTION pais_valido (
  nombre varchar(50)
) RETURNS boolean AS
$BODY$
BEGIN
  RETURN (EXISTS(SELECT Lug_ID FROM Lugar WHERE UPPER(Lug_Nombre) = UPPER(nombre)));
END;
$BODY$
LANGUAGE plpgsql;

/* validar_mayor_edad
 * A partir de una fecha calcula si es mayor de edad
 
CREATE OR REPLACE FUNCTION validar_mayor_edad (
  f_nac date,
  c_date date = current_date
) RETURNS boolean AS
$BODY$
BEGIN
  RETURN (age(f_nac) >= interval '18 years');
END;
$BODY$
LANGUAGE plpgsql;*/


/* validar_anada
 * A partir de id marca y un año
 * valida que  para año-mar_maduracion
 * existan cosechas con solo E y MB de
 * Valoración
 * res: True -> Valida con ventana
 */
CREATE OR REPLACE FUNCTION validar_anada(
  id_marca integer,
  ano integer,
  res boolean
) RETURNS boolean AS
$BODY$
DECLARE
	Vin record;
	cali char;
	salida boolean;
	mad int;
BEGIN
  IF res THEN
	SELECT INTO mad mar_maduracion FROM MARCA WHERE Mar_ID = id_marca;
  ELSE
	mad = 0;
  end IF;
  salida = TRUE;
  FOR Vin IN (SELECT fk_vinedo FROM COMPOSICION WHERE FK_MARCA = id_marca)
  LOOP
    SELECT INTO cali c.cos_evaluacion FROM COSECHA as c
      WHERE FK_Vinedo = Vin.fk_vinedo AND c.cos_ano = (ano-mad) AND
      (cos_evaluacion = 'E' OR cos_evaluacion = 'MB' OR cos_evaluacion = 'B');
    IF NOT FOUND THEN
      salida = FALSE;
      EXIT;
    END IF;
  END LOOP;
  RETURN salida;
END;
$BODY$
LANGUAGE plpgsql;




CREATE OR REPLACE FUNCTION validar_anada_p(
  id_marca integer,
  ano integer,
  res boolean
) RETURNS float AS
$BODY$
DECLARE
	Vin record;
	cali char(2);
	salida float;
	can integer;
	mad int;
BEGIN
  IF res THEN
	SELECT INTO mad mar_maduracion FROM MARCA WHERE Mar_ID = id_marca;
  ELSE
	mad = 0;
  end IF;
  salida = 0;
  can = 0;
  FOR Vin IN (SELECT fk_vinedo FROM COMPOSICION WHERE FK_MARCA = id_marca)
  LOOP
    SELECT INTO cali cos_evaluacion FROM COSECHA WHERE FK_Vinedo = Vin.fk_vinedo AND cos_ano = (ano-mad) AND (cos_evaluacion = 'E' OR cos_evaluacion = 'MB' OR cos_evaluacion = 'B');
    IF NOT FOUND THEN
      RETURN NULL;
    ELSE
	  can = can + 1;
      IF cali = 'E' THEN
        salida = salida + 0.20;
      ELSIF cali = 'MB' THEN
        salida = salida + 0.10;
      END IF;
    END IF;
  END LOOP;
  salida = salida / can;
  RETURN salida;
END;
$BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION set_lugar(
  pais varchar(50),
  ciudad varchar(50)
) RETURNS integer AS
$BODY$
DECLARE
  id_pais integer;
  id_ciudad integer;
BEGIN
  SELECT INTO id_pais Lug_ID FROM LUGAR WHERE UPPER(Lug_Nombre) = UPPER(pais) AND  lug_Tipo = 'PAÍS';
  IF FOUND THEN
    SELECT INTO id_ciudad Lug_ID FROM LUGAR WHERE UPPER(Lug_Nombre) = UPPER(ciudad) AND  Lug_Tipo = 'CIUDAD';
    IF NOT FOUND THEN
	  INSERT INTO LUGAR (lug_nombre,lug_tipo,fk_lugar) VALUES (ciudad,'CIUDAD',id_pais) RETURNING Lug_ID into id_ciudad;
    END IF;
    RETURN id_ciudad;
  ELSE
    RAISE 'País % invalido.',pais;
  END IF; 
END;
$BODY$
LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION get_Lug_p_name(
  i_id integer,
  OUT nombre varchar(50),
  OUT cambio float
) RETURNS setof record AS
$BODY$
DECLARE
  id_pai integer;
  nombre varchar(50);
BEGIN
  SELECT INTO id_pai,nombre FK_lugar,lug_nombre FROM LUGAR WHERE lug_id = i_id AND lug_tipo = 'CIUDAD';
  IF NOT FOUND THEN
    RETURN QUERY SELECT lug_nombre as nombre,lug_unidad_cambio as cambio FROM LUGAR WHERE lug_id = i_id AND lug_tipo = 'PAÍS';
  ELSE
    RETURN QUERY SELECT lug_nombre as nombre,lug_unidad_cambio as cambio FROM LUGAR WHERE lug_id = id_pai AND lug_tipo = 'PAÍS';
  END IF;
END;
$BODY$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION cambio(
  moneda varchar(10),
  cantidad float
) RETURNS float AS
$BODY$
  SELECT cantidad/(SELECT DISTINCT(lug_unidad_cambio) FROM LUGAR WHERE moneda = lug_moneda);
$BODY$
LANGUAGE sql;



CREATE OR REPLACE FUNCTION filtro(
  id_consumidor integer,
  maridaje varchar(50) = NULL,
  p_min float = NULL,
  p_max float = NULL,
  experto varchar(50) = NULL
) RETURNS TABLE (
    Mar_id integer,
    calificacion float
) AS
$BODY$
DECLARE
  rec record;
  pais varchar(50);
  curr_con float;
  curr_mar varchar(10);
BEGIN
  SELECT INTO pais,curr_con nombre,cambio from get_lug_p_name((SELECT FK_LUGAR FROM CONSUMIDOR WHERE Con_ID = id_consumidor));
  FOR rec IN SELECT m.Mar_ID, m.Mar_ventana, m.FK_Bodega FROM MARCA as m LOOP
    calificacion = 0;
    IF NOT EXISTS(SELECT pm.PM_Botellas FROM PRO_MAR AS pm WHERE pm.FK_Marca = rec.Mar_ID AND pm.PM_botellas > 0 AND pm.PM_ano >= (EXTRACT(ISOYEAR FROM CURRENT_DATE)-rec.Mar_ventana)) THEN
      CONTINUE;
    END IF;
    IF maridaje <> '' THEN
      IF NOT EXISTS(SELECT com.Com_ID FROM MARIDAJE AS mar, COMIDA AS com WHERE mar.FK_Marca = rec.Mar_ID AND com.Com_ID = mar.FK_Comida AND (UPPER(com.Com_Tipo) = UPPER(maridaje) OR UPPER(com.Com_Nombre) = UPPER(maridaje))) THEN
        CONTINUE;
      END IF;
    END IF;
    SELECT INTO curr_mar Pai_moneda FROM PAIS,BODEGA WHERE Bod_ID = rec.FK_Bodega AND FK_Pais = Pai_ID;
    IF p_min IS NOT NULL THEN
      IF NOT EXISTS(SELECT hp.hp_precio FROM HIS_PRESENTACION AS hp WHERE hp.FK_Marca = rec.Mar_ID AND cambio(curr_mar,hp.hp_precio) >= (p_min/curr_con) AND hp.hp_ano >= (EXTRACT(ISOYEAR FROM CURRENT_DATE)-rec.Mar_ventana)) THEN
        CONTINUE;
      END IF;
    END IF;
    IF p_max IS NOT NULL THEN
      IF NOT EXISTS(SELECT hp.hp_precio FROM HIS_PRESENTACION AS hp WHERE hp.FK_Marca = rec.Mar_ID AND cambio(curr_mar,hp.hp_precio) <= (p_max/curr_con) AND hp.hp_ano >= (EXTRACT(ISOYEAR FROM CURRENT_DATE)-rec.Mar_ventana)) THEN
        CONTINUE;
      END IF;
    END IF;
    IF UPPER(pais) = (SELECT UPPER(Pai_nombre) FROM BODEGA, PAIS WHERE Bod_ID = rec.FK_bodega AND Pai_ID = FK_Pais) THEN
      calificacion = calificacion + 1;
    ELSE
	  calificacion = calificacion + 0.5;
    END IF;
    calificacion = calificacion + (SELECT (AVG(valor)/100) from table_calificacion(rec.Mar_ID) WHERE ano >= (EXTRACT(ISOYEAR FROM CURRENT_DATE)-rec.Mar_ventana));
    Mar_id = rec.Mar_id;
    RETURN NEXT;
  END LOOP;
END;
$BODY$
LANGUAGE plpgsql;









