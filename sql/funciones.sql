/* validar_mayor_edad
 * A partir de una fecha calcula si es mayor de edad
 */
CREATE OR REPLACE FUNCTION validar_mayor_edad (
  f_nac date,
  c_date date = current_date
) RETURNS boolean AS
$BODY$
BEGIN
  RETURN (age(f_nac) >= interval '18 years');
END;
$BODY$
LANGUAGE plpgsql;


/* validar_anada
 * A partir de id marca y un año
 * valida que  para año-mar_maduracion
 * existan cosechas con solo E y MB de
 * Valoración
 */
CREATE OR REPLACE FUNCTION validar_anada(
  id_marca integer,
  ano integer
) RETURNS boolean AS
$BODY$
DECLARE
	valoraciones record;
	salida boolean;
BEGIN
  salida = FALSE;
  FOR valoraciones IN (
    select
      cc.cos_evaluacion
    from
      composicion as c,
      vinedo as v,
      marca as m,
      variedad as va,
      denominacion as d,
      cosecha as cc
    where
      id_marca = m.Mar_id
      and c.fk_vinedo = v.vin_id
      and c.fk_variedad = va.var_id
      and c.fk_denominacion = d.den_id
      and c.fk_marca = m.Mar_id
      and v.vin_id = cc.fk_vinedo
      and cc.cos_ano = (ano-m.Mar_Maduracion))
    LOOP
      IF (valoraciones.cos_evaluacion = 'E' OR valoraciones.cos_evaluacion = 'MB' OR valoraciones.cos_evaluacion = 'M') THEN
      	salida = TRUE;
      ELSE
      	salida = FALSE;
      	EXIT;
      END IF;
    END LOOP;
    RETURN salida;
END;
$BODY$
LANGUAGE plpgsql;