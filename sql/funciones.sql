
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
