/* tgg_pro_mar_cal_interno
 * Table: pro_mar
 * Columna:
 * Cuando: Despues.
 * ON: INSERT UPDATE
 * EACH: ROW
 * Calcula las botellas de consumo interno.
 */
CREATE OR REPLACE FUNCTION tgg_pro_mar_cal_interno ()
RETURNS trigger AS
$tgg_pro_mar_cal_interno$
DECLARE
  sum_exp integer;
BEGIN
  SELECT INTO sum_exp SUM(botellas) FROM table_exportacion (NEW.pm_exportaciones);
  IF sum_exp > 0 THEN
    NEW.pm_consumo_int = NEW.pm_botellas - sum_exp;
    if NEW.pm_consumo_int < 0 THEN
      RAISE NOTICE 'Exportacion exede a la Producción';
      RETURN NULL;
    END IF;
  ELSE
    NEW.pm_consumo_int = NEW.pm_botellas;
  END IF;
  RETURN NEW;
END;
$tgg_pro_mar_cal_interno$
LANGUAGE plpgsql;

CREATE TRIGGER tgg_pro_mar_cal_interno
BEFORE INSERT OR UPDATE
ON PRO_MAR
FOR EACH ROW EXECUTE PROCEDURE tgg_pro_mar_cal_interno();




/* tgg_solicitud_experto
 * Tabla: SOLICITUD
 * Columna: FK_Catador_Consultor
 * Cuando: Antes
 * ON: INSERT UPDATE
 * EACH: ROW
 * Validar el nivel experto del especialista.
 */
CREATE OR REPLACE FUNCTION tgg_solicitud_experto ()
RETURNS trigger AS
$tgg_solicitud_experto$
DECLARE
  n_catador character varying(50);
BEGIN
  IF NEW.FK_Catador_Consultor IS NOT NULL THEN
    SELECT INTO n_catador CC_Nivel FROM CATADOR_CONSULTOR WHERE CC_ID = NEW.FK_Catador_Consultor;
    IF n_catador <> 'Experto' THEN
      RAISE NOTICE 'El Nivel del Catador es %',n_catador;
      RAISE NOTICE 'El nive nesecacion es Experto';
      RETURN NULL;
    END IF;
  END IF;
  RETURN NEW;
END;
$tgg_solicitud_experto$
LANGUAGE plpgsql;

CREATE TRIGGER tgg_solicitud_experto
BEFORE INSERT OR UPDATE OF FK_Catador_Consultor
ON SOLICITUD
FOR EACH ROW EXECUTE PROCEDURE tgg_solicitud_experto();


/* tgg_especialista_experto
 * Tabla: ESPECIALISTA
 * Columna:
 * Cuando: Antes
 * ON: INSERT UPDATE
 * EACH: ROW
 * Validar que el especialista sea experto.
 */
CREATE OR REPLACE FUNCTION tgg_especialista_experto ()
RETURNS trigger AS
$tgg_especialista_experto$
DECLARE
  n_catador character varying(50);
BEGIN
  SELECT INTO n_catador CC_Nivel FROM CATADOR_CONSULTOR WHERE CC_ID = NEW.FK_Catador_Consultor;
  IF n_catador <> 'Experto' THEN
    RAISE NOTICE 'El Nivel del Catador es %',n_catador;
    RAISE NOTICE 'El nive nesecacion es Experto';
    RETURN NULL;
  END IF;
  RETURN NULL;
END;
$tgg_especialista_experto$
LANGUAGE plpgsql;

CREATE TRIGGER tgg_especialista_experto
BEFORE INSERT OR UPDATE
ON ESPECIALISTA
FOR EACH ROW EXECUTE PROCEDURE tgg_especialista_experto();



/* tgg_composicion_porsentaje
 * Tabla: COMPOSICION
 * Columna: Com_Porcentaje
 * Cuando: Antes
 * ON: INSERT UPDATE Com porcentaje
 * EACH: ROW
 * Validar que la suma de los porsentaje de una marca no sea mayor a 100
 */
CREATE OR REPLACE FUNCTION tgg_composicion_porsentaje ()
RETURNS trigger AS
$tgg_composicion_porsentaje$
DECLARE
  total integer;
BEGIN
  SELECT INTO total SUM(Com_Porcentaje) FROM COMPOSICION WHERE FK_Marca = NEW.FK_Marca;
  IF total+NEW.Com_Porcentaje > 100 THEN
    RAISE NOTICE 'La suma de porcentaje actual es de: %',total;
    RAISE NOTICE 'La suma de porcentaje Nuevo exede el 100 Porciento.';
    RETURN NULL;
  END IF;
  RETURN NEW;
END;
$tgg_composicion_porsentaje$
LANGUAGE plpgsql;

CREATE TRIGGER tgg_composicion_porsentaje
BEFORE INSERT OR UPDATE OF Com_Porcentaje
ON COMPOSICION
FOR EACH ROW EXECUTE PROCEDURE tgg_composicion_porsentaje();


/* tgg_visita_Validar_fecha  <------------------- Puede que este de mas
 * Tabla: VISITA
 * Columna: Con_fecha_Nac
 * Cuando: Antes
 * ON: INSERT UPDATE Con_fecha_Nac
 * EACH: ROW
 * Valida que la fecha es mayor a la de la solicitud
 */
CREATE OR REPLACE FUNCTION tgg_visita_Validar_fecha ()
RETURNS trigger AS
$tgg_visita_Validar_fecha$
DECLARE
  f_sol date;
BEGIN
  SELECT INTO f_sol Sol_Fecha from SOLICITUD WHERE Sol_ID = NEW.FK_Solicitud;
  IF NEW.Vis_fecha < f_sol THEN
    RAISE NOTICE 'Fecha de Visita invalida.';
    RETURN NULL;
  END IF;
  RETURN NEW;
END;
$tgg_visita_Validar_fecha$
LANGUAGE plpgsql;

CREATE TRIGGER tgg_visita_Validar_fecha
BEFORE INSERT OR UPDATE OF Vis_Fecha
ON VISITA
FOR EACH ROW EXECUTE PROCEDURE tgg_visita_Validar_fecha();



/* tgg_consumidor_mayoredad <------------------- Puede que este de mas
 * Valida que el consumidor sea mayor de edad 
 * Tabla: CONSUMIDOR
 * Columna: Con_fecha_Nac
 * Cuando: Antes
 * ON: INSERT UPDATE Con_fecha_Nac
 * EACH: ROW
 * Valida que el consumidor sea mayor de edad 
 
CREATE OR REPLACE FUNCTION tgg_consumidor_fecha_Nac ()
RETURNS trigger AS
$tgg_consumidor_fecha_Nac$
BEGIN
  IF NOT validar_mayor_edad(NEW.Con_fecha_Nac) THEN
    RAISE NOTICE 'Consumidor Es menor de edad.';
    RETURN NULL;
  END IF;
  RETURN NEW;
END;
$tgg_consumidor_fecha_Nac$
LANGUAGE plpgsql;

CREATE TRIGGER tgg_consumidor_fecha_Nac
BEFORE INSERT OR UPDATE OF Con_Fecha_Nac
ON CONSUMIDOR
FOR EACH ROW EXECUTE PROCEDURE tgg_consumidor_fecha_Nac();*/



/* tgg_catador_consultor_mayoredad  <------------------- Puede que este de mas
 * Valida que el catador sea mayor de edad 
 * Tabla: CONSUMIDOR
 * Columna: Con_fecha_Nac
 * Cuando: Antes
 * ON: INSERT UPDATE CC_Fecha_Nacimiento
 * EACH: ROW
 * Valida que el Catador sea mayor de edad 
 
CREATE OR REPLACE FUNCTION tgg_catador_consultor_fecha_nacimiento ()
RETURNS trigger AS
$tgg_catador_consultor_fecha_nacimiento$
BEGIN
  IF NOT validar_mayor_edad(NEW.CC_fecha_Nacimiento) THEN
    RAISE NOTICE 'Catador Es menor de edad.';
    RETURN NULL;
  END IF;
  RETURN NEW;
END;
$tgg_catador_consultor_fecha_nacimiento$
LANGUAGE plpgsql;

CREATE TRIGGER tgg_catador_consultor_fecha_nacimiento
BEFORE INSERT OR UPDATE OF CC_Fecha_Nacimiento
ON CATADOR_CONSULTOR
FOR EACH ROW EXECUTE PROCEDURE tgg_catador_consultor_fecha_nacimiento();*/
 
 
/* tgg_presentacion_f_valoracion
 * Valida la fecha de valoracion insertada no sea menor a la
 * de la valoracion
 */
CREATE OR REPLACE FUNCTION tgg_presentacion_f_valoracion ()
RETURNS trigger AS
$tgg_presentacion_f_valoracion$
BEGIN
  IF NEW.Sol_Fecha_Valoracion IS NOT NULL THEN
    IF NEW.Sol_Fecha_Valoracion >= NEW.Sol_Fecha THEN
      RETURN NEW;
    ELSE
      RAISE NOTICE 'Fecha de la Valoració invalida. Menor a la de Solicitud';
      RETURN NULL;
    END IF;
  END IF;
  RETURN NEW;
END;
$tgg_presentacion_f_valoracion$
LANGUAGE plpgsql;

CREATE TRIGGER tgg_presentacion_f_valoracion
BEFORE INSERT OR UPDATE OF Sol_Fecha_Valoracion
ON SOLICITUD
FOR EACH ROW EXECUTE PROCEDURE tgg_presentacion_f_valoracion();



/* tgg_his_presentacion_validar_anada
 * Tabla: HIS_PRESENTACION
 * Columna: ano  ---> falta
 * Cuando: Antes
 * ON: INSERT UPDATE
 * EACH: ROW
 * Valida que la añada sea valida  
 */
CREATE OR REPLACE FUNCTION tgg_his_presentacion_validar_anada ()
RETURNS trigger AS
$tgg_his_presentacion_validar_anada$
BEGIN
  IF validar_anada(NEW.FK_Marca,NEW.HP_ano) THEN
    RETURN NEW;
  END IF;
  RAISE NOTICE 'Añada invalida.';
  RETURN NULL;
END;
$tgg_his_presentacion_validar_anada$
LANGUAGE plpgsql;

CREATE TRIGGER tgg_his_presentacion_validar_anada
BEFORE INSERT OR UPDATE OF HP_Ano
ON HIS_PRESENTACION
FOR EACH ROW EXECUTE PROCEDURE tgg_his_presentacion_validar_anada();



/* tgg_pro_mar_validar_anada
 * Tabla: PRO_MAR
 * Columna: ano  ---> falta
 * Cuando: Antes
 * ON: INSERT UPDATE
 * EACH: ROW
 * Valida que la añada sea valida  
 */
CREATE OR REPLACE FUNCTION tgg_pro_mar_validar_anada ()
RETURNS trigger AS
$tgg_pro_mar_validar_anada$
BEGIN
  IF validar_anada(NEW.FK_Marca,NEW.PM_ano) THEN
    RETURN NEW;
  END IF;
  RAISE NOTICE 'Añada invalida.';
  RETURN NULL;
END;
$tgg_pro_mar_validar_anada$
LANGUAGE plpgsql;

CREATE TRIGGER tgg_pro_mar_validar_anada
BEFORE INSERT OR UPDATE OF PM_Ano
ON PRO_MAR
FOR EACH ROW EXECUTE PROCEDURE tgg_pro_mar_validar_anada();

