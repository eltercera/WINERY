
/* suelo
 * Constructor tipo Suelo.
 */
CREATE OR REPLACE FUNCTION suelo (
  nombre varchar(25) ,
  ubicacion varchar(50)
) RETURNS suelo AS
$BODY$
DECLARE
  newdata suelo;
BEGIN
  newdata = null;
  IF nombre <> '' AND ubicacion <> '' THEN
    newdata=(nombre,ubicacion);
  ELSE
    RAISE 'suelo -> Datos incompletos.';
  END IF;
  RETURN newdata;
END;
$BODY$
LANGUAGE plpgsql;


/* exportacion
 * Constructor tipo exportacion
 */
CREATE OR REPLACE FUNCTION exportacion (
  cantidadbotella integer,
  pais varchar(50)
) RETURNS exportacion AS
$BODY$
DECLARE
  newdata exportacion;
BEGIN
  newdata = null;
  IF cantidadbotella IS NOT null AND pais <> '' THEN
    newdata=(cantidadbotella,pais);
  ELSE
    RAISE 'exportacion -> Datos incompletos.';
  END IF;
  RETURN newdata;
END;
$BODY$
LANGUAGE plpgsql;

/* add_exportacion
 * A partir de un año, id_marca, pais y botellas exportadas
 * agrega su respectivo registro
 */
CREATE OR REPLACE FUNCTION add_exportacion (
  id_marca integer,
  ano integer,
  pais_n varchar(50),
  botellas integer
) RETURNS void AS
$BODY$
DECLARE
  exs exportacion[];
BEGIN
  IF botellas > 0 THEN
    SELECT INTO exs pm_exportaciones FROM PRO_MAR WHERE pm_ano=ano AND fk_marca=id_marca;
    IF FOUND THEN
      IF NOT EXISTS ( SELECT pais from table_exportacion(exs) WHERE UPPER(pais_n)=UPPER(pais)) THEN
        IF pais_valido(pais_n) THEN
          exs = array_append(exs,exportacion(botellas,pais_n));
          UPDATE PRO_MAR SET pm_exportaciones = exs WHERE pm_ano=ano AND fk_marca=id_marca;
        ELSE
          RAISE 'Pais % no es Valido', pais_n;
        END IF;
      ELSE
        RAISE 'Pais % ya aparece', pais_n;
      END IF;
    ELSE
      RAISE 'Producción par el año % no existe de la marca ID %', ano, id_marca;
    END IF;
  END IF;
END;
$BODY$
LANGUAGE plpgsql;

/* del_legislacion
 * elimina la informacion de ina legislacion a un pais
 */
CREATE OR REPLACE FUNCTION del_legislacion (
  id_pais integer,
  ind integer
) RETURNS void AS
$BODY$
DECLARE
  legs legislacion[];
BEGIN
  SELECT INTO legs Pai_Legislaciones FROM PAIS WHERE Pai_ID = id_pais;
  IF NOT FOUND THEN
    RAISE NOTICE 'IDENTIFICADOR % de pais no encontrado',id_pais;
  ELSE
    legs = array_remove(legs,legs[ind]);
    UPDATE PAIS SET Pai_Legislaciones = legs WHERE Pai_ID = id_pais;
  END IF;
END;
$BODY$
LANGUAGE plpgsql;


/* legislacion
 * Constructor de el tipo legislacion
 */
CREATE OR REPLACE FUNCTION legislacion (
  nombre varchar(50),
  ano integer,
  tipo tipolegislacion,
  descripcion text = '',
  documento oid = null
) RETURNS legislacion AS
$BODY$
DECLARE
  newdata legislacion;
BEGIN
  newdata = null;
  IF nombre <> '' AND ano IS NOT null AND descripcion IS NOT null THEN
    newdata=(nombre,ano,tipo,descripcion,documento);
  ELSE
    RAISE 'legislacion -> Datos incompletos.';
  END IF;
  RETURN newdata;
END;
$BODY$
LANGUAGE plpgsql;

/* add_legislacion
 * agrega Una legislacion a un pais
 */
CREATE OR REPLACE FUNCTION add_legislacion (
  id_pais integer,
  leg legislacion
) RETURNS void AS
$BODY$
  UPDATE PAIS SET Pai_Legislaciones = array_append(Pai_Legislaciones,leg) WHERE Pai_ID = id_pais;
$BODY$
LANGUAGE sql;

/* del_legislacion
 * elimina la informacion de ina legislacion a un pais
 */
CREATE OR REPLACE FUNCTION del_legislacion (
  id_pais integer,
  ind integer
) RETURNS void AS
$BODY$
DECLARE
  legs legislacion[];
BEGIN
  SELECT INTO legs Pai_Legislaciones FROM PAIS WHERE Pai_ID = id_pais;
  IF NOT FOUND THEN
    RAISE NOTICE 'IDENTIFICADOR % de pais no encontrado',id_pais;
  ELSE
    legs = array_remove(legs,legs[ind]);
    UPDATE PAIS SET Pai_Legislaciones = legs WHERE Pai_ID = id_pais;
  END IF;
END;
$BODY$
LANGUAGE plpgsql;


/* ingrediente
 * Constructor de el tipo ingrediente
 */
CREATE OR REPLACE FUNCTION ingrediente(
  nombre varchar(50),
  cantidad varchar(10),
  unidad varchar(10) = null
) RETURNS ingrediente AS
$BODY$
DECLARE
  newdata ingrediente;
BEGIN
  newdata = null;
  IF nombre <> '' AND cantidad <> '' THEN
    newdata=(nombre,unidad,cantidad);
  ELSE
    RAISE 'ingrediente -> Datos incompletos.';
  END IF;
  RETURN newdata;
END;
$BODY$
LANGUAGE plpgsql;

/* add_ingrediente
 * Agrega un ingredinete a una receta apartir
 * del id de la marca y el indice de la receta
 */
CREATE OR REPLACE FUNCTION add_ingrediente(
  id_marca integer,
  indice integer,
  ing ingrediente
) RETURNS void AS
$BODY$
  UPDATE MARCA SET mar_recetas[indice].ingredientes = array_append(mar_recetas[indice].ingredientes,ing) WHERE Mar_ID = id_marca;
$BODY$
LANGUAGE sql;

/* del_ingrediente
 * Elimina un ingredinete a de receta apartir
 * del id de la marca, el indice de la receta
 * y el incie el ingrediente
 */
CREATE OR REPLACE FUNCTION del_ingrediente(
  id_marca integer,
  i_rec integer,
  i_ing integer
) RETURNS void AS
$BODY$
  UPDATE MARCA SET mar_recetas[i_rec].ingredientes = array_remove(mar_recetas[i_rec].ingredientes,mar_recetas[i_rec].ingredientes[i_ing]) WHERE Mar_ID = id_marca;
$BODY$
LANGUAGE sql;

/* receta
 * Constructor de el tipo receta
 */
CREATE OR REPLACE FUNCTION receta (
  nombre varchar(50),
  t_preparacion integer,
  t_coccion integer,
  preparacion text,
  descripcion text,
  imagen oid = null
) RETURNS receta AS
$BODY$
DECLARE
  newdata receta;
BEGIN
  newdata = null;
  IF nombre <> '' AND preparacion <> '' AND descripcion <> '' AND t_preparacion IS NOT NULL and t_coccion IS NOT NULL THEN
    IF t_preparacion >= 0 and t_coccion >= 0 THEN
      newdata=(nombre,t_preparacion,t_coccion,preparacion,descripcion,imagen,ARRAY[]::ingrediente[]);
    ELSE
      RAISE 'receta -> t_preparacion y t_coccion debe de ser positivos.';
    END IF;
  ELSE
    RAISE 'ingrediente -> Datos incompletos.';
  END IF;
  RETURN newdata;
END;
$BODY$
LANGUAGE plpgsql;

/* add_receta
 * Apartir de in ud de marca agreda una receta
 */
CREATE OR REPLACE FUNCTION add_receta(
  id_marca integer,
  m receta
) RETURNS void AS
$BODY$
  UPDATE MARCA SET mar_recetas = array_append(mar_recetas,m) WHERE Mar_ID = id_marca;
$BODY$
LANGUAGE sql;

CREATE OR REPLACE FUNCTION del_receta(
  id_marca integer,
  ind integer
) RETURNS void 	AS
$BODY$
  UPDATE MARCA SET mar_recetas = array_remove(mar_recetas,mar_recetas[ind]) WHERE Mar_ID = id_marca;
$BODY$
LANGUAGE sql;

/* Medida
 * Constructor de el tipo Medida
 */
CREATE OR REPLACE FUNCTION medida (
  unidad varchar(5),
  valor float,
  descripcion varchar(50) = null,
  valormin float = null
) RETURNS medida AS
$BODY$
DECLARE
  newdata Medida;
BEGIN
  newdata = null;
  IF unidad <> '' AND valor IS NOT NULL THEN
    newdata=(unidad,descripcion,valor,valormin);
  ELSE
    RAISE 'medida-> Datos incompletos.';
  END IF;
  RETURN newdata;
END;
$BODY$
LANGUAGE plpgsql;

/* des_gen_region
 * Constructor de el tipo des_gen_region
 */
CREATE OR REPLACE FUNCTION des_gen_region (
  altitud float = null
) RETURNS des_gen_region AS
$BODY$
DECLARE
  newdata des_gen_region;
BEGIN
  IF altitud IS NULL THEN
    newdata=(altitud,ARRAY[]::medida[],ARRAY[]::medida[],ARRAY[]::varchar(100)[],ARRAY[]::suelo[]);
  ELSE
    newdata=((medida('m',altitud)),ARRAY[]::medida[],ARRAY[]::medida[],ARRAY[]::varchar(100)[],ARRAY[]::suelo[]);
  END IF;
  RETURN newdata;
END;
$BODY$
LANGUAGE plpgsql;
/* add_temperatura
 * Agrega una medida temperatura a una region
 */
CREATE OR REPLACE FUNCTION add_temperatura(
  id_region integer,
  m medida
) RETURNS void AS
$BODY$
  UPDATE REGION SET reg_descripcion_general.temperaturas = array_append((reg_descripcion_general).temperaturas,m) WHERE Reg_ID = id_region;
$BODY$
LANGUAGE sql;

/* del_temperatura
 * Elimina una medida temperatura a una region
 */
CREATE OR REPLACE FUNCTION del_temperatura(
  id_region integer,
  ind integer
) RETURNS void 	AS
$BODY$
  UPDATE REGION SET reg_descripcion_general.temperaturas = array_remove((reg_descripcion_general).temperaturas,(reg_descripcion_general).temperaturas[ind]) WHERE Reg_ID = id_region;
$BODY$
LANGUAGE sql;

/* add_presipitaciones
 * Agrega una medida presipitacion a una region
 */
CREATE OR REPLACE FUNCTION add_presipitaciones(
  id_region integer,
  m medida
) RETURNS void AS
$BODY$
  UPDATE REGION SET reg_descripcion_general.presipitaciones = array_append((reg_descripcion_general).presipitaciones,m) WHERE Reg_ID = id_region;
$BODY$
LANGUAGE sql;

/* del_presipitaciones
 * Elimina una medida presipitacion a una region
 */
CREATE OR REPLACE FUNCTION del_presipitaciones(
  id_region integer,
  ind integer
) RETURNS void 	AS
$BODY$
  UPDATE REGION SET reg_descripcion_general.presipitaciones = array_remove((reg_descripcion_general).presipitaciones,(reg_descripcion_general).presipitaciones[ind]) WHERE Reg_ID = id_region;
$BODY$
LANGUAGE sql;

/* add_riesgo
 * Agrega un riesgo de viña a region
 */
CREATE OR REPLACE FUNCTION add_riesgo(
  id_region integer,
  r varchar(100)
) RETURNS void AS
$BODY$
  UPDATE REGION SET reg_descripcion_general.riesgos_vina = array_append((reg_descripcion_general).riesgos_vina,r) WHERE Reg_ID = id_region;
$BODY$
LANGUAGE sql;

/* del_riesgo
 * elinin a un riesgo de viña a region
 */
CREATE OR REPLACE FUNCTION del_riesgo(
  id_region integer,
  ind integer
) RETURNS void 	AS
$BODY$
  UPDATE REGION SET Reg_Descripcion_General.riesgos_vina = array_remove((reg_descripcion_general).riesgos_vina,(reg_descripcion_general).riesgos_vina[ind]) WHERE Reg_ID = id_region;
$BODY$
LANGUAGE sql;

/* add_suelo
 * Agrega a un suelo a region
 */
CREATE OR REPLACE FUNCTION add_suelo(
  id_region integer,
  s suelo
) RETURNS void AS
$BODY$
  UPDATE REGION SET reg_descripcion_general.suelos = array_append((reg_descripcion_general).suelos,s) WHERE Reg_ID = id_region;
$BODY$
LANGUAGE sql;

/* del_suelo
 * Elimina un suelo de region
 */
CREATE OR REPLACE FUNCTION del_suelo(
  id_region integer,
  ind integer
) RETURNS void 	AS
$BODY$
  UPDATE REGION SET Reg_Descripcion_General.suelos = array_remove((reg_descripcion_general).suelos,(reg_descripcion_general).suelos[ind]) WHERE Reg_ID = id_region;
$BODY$
LANGUAGE sql;

/* telefono
 * Constructor de el tipo telefono
 */
CREATE OR REPLACE FUNCTION telefono (
  codinternacional integer,
  codarea varchar(5),
  numero varchar(10),
  tipo tipotelefono = 'local'
) RETURNS telefono AS
$BODY$
DECLARE
  newdata telefono;
BEGIN
  newdata = NULL;
  IF codinternacional IS NOT NULL AND codarea IS NOT NULL AND codarea IS NOT NULL AND numero <> '' THEN
    newdata=(codinternacional,numero,tipo,codarea);
  ELSE
    RAISE 'telefono -> Datos incompletos.';
  END IF;
  RETURN newdata;
END;
$BODY$
LANGUAGE plpgsql;

/* res_solicitud
 * Constructor de el tipo res_solicitud
 */
CREATE OR REPLACE FUNCTION res_solicitud (
  idvino integer,
  valoracion integer
) RETURNS res_solicitud as
$BODY$
DECLARE
  newdata res_solicitud;
BEGIN
  newdata = NULL;
  IF idvino IS NOT NULL AND valoracion IS NOT NULL THEN
    IF valoracion >= 0 AND valoracion <= 100 THEN
      IF EXISTS(select Mar_ID from marca where Mar_ID = idvino) THEN
        newdata=(idvino,valoracion);
      ELSE
        RAISE 'res_solicitud -> No existe marca con identificador %', idvino;
      END IF;
    ELSE
      RAISE 'res_solicitud -> Valoracion invalida.';
    END IF;
  ELSE
    RAISE 'res_solicitud -> Datos incompletos.';
  END IF;
  RETURN newdata;
END;
$BODY$
LANGUAGE plpgsql;


/* direcciongeneral
 * Constructor de el tipo direcciongeneral
 */
CREATE OR REPLACE FUNCTION direcciongeneral (
  direccion varchar(200) = NULL,
  web varchar(200) = NULL,
  email varchar(50) = NULL
) RETURNS direcciongeneral AS
$BODY$
BEGIN
  RETURN (direccion,ARRAY[]::telefono[],web,email)::direcciongeneral;
END;
$BODY$
LANGUAGE plpgsql;

/* nombrepersona
 * Constructor de el tipo nombrepersona
 */
CREATE OR REPLACE FUNCTION nombrepersona (
  nombre varchar(25),
  apellido varchar(25),
  snombre varchar(25) = NULL,
  sapellido varchar(25) = NULL
) RETURNS nombrepersona AS
$BODY$
DECLARE
  newdata nombrepersona;
BEGIN
  newdata = NULL;
  IF nombre <> '' AND apellido <> '' THEN
    newdata = (nombre,snombre,apellido,sapellido);
  ELSE
    RAISE 'nombrepersona -> Datos incompletos.';
  END IF;
  RETURN newdata;
END;
$BODY$
LANGUAGE plpgsql;

/* cultivo
 * Constructor de el tipo cultivo
 */
CREATE OR REPLACE FUNCTION cultivo (
  ano integer,
  hectareascultivadas float
) RETURNS cultivo AS
$BODY$
DECLARE
  newdata cultivo;
BEGIN
  newdata = NULL;
  IF ano IS NOT NULL AND hectareascultivadas IS NOT NULL THEN
    IF hectareascultivadas >= 0 THEN
      newdata = (ano,hectareascultivadas);
    ELSE
      RAISE 'cultivo -> Hectareas cultivadas no pueden ser negativas.';
    END IF;
  ELSE
    RAISE 'cultivo -> Datos incompletos.';
  END IF;
  RETURN newdata;
END;
$BODY$
LANGUAGE plpgsql;

/* add_cultivo
 * Agrega un cultivo a un viñedo
 */
CREATE OR REPLACE FUNCTION add_cultivo (
  id_vinedo integer,
  c cultivo
) RETURNS void AS
$BODY$
  UPDATE VINEDO SET Vin_Hect_Cult = array_append(Vin_Hect_Cult,c) WHERE Vin_ID = id_vinedo;
$BODY$
LANGUAGE sql;

/* del_cultivo
 * Elimina un cultivo a un viñedo
 */
CREATE OR REPLACE FUNCTION del_cultivo(
  id_vinedo integer,
  ind integer
) RETURNS void 	AS
$BODY$
  UPDATE VINEDO SET Vin_Hect_Cult = array_remove(Vin_Hect_Cult,Vin_Hect_Cult[ind])  WHERE Vin_ID = id_vinedo;
$BODY$
LANGUAGE sql;

/* historiabodega
 * Constructor de el tipo historiabodega
 */
CREATE OR REPLACE FUNCTION historiabodega (
  ano integer,
  echo text
) RETURNS historiabodega AS
$BODY$
DECLARE
  newdata historiabodega;
BEGIN
  newdata = NULL;
  IF ano IS NOT NULL AND echo <> '' THEN
    newdata = (ano,echo);
  ELSE
    RAISE 'historiabodega -> Datos incompletos.';
  END IF;
  RETURN newdata;
END;
$BODY$
LANGUAGE plpgsql;

/* add_historia
 * Agrege Historia a bodega
 */
CREATE OR REPLACE FUNCTION add_historia (
  id_bodega integer,
  h historiabodega
) RETURNS void AS
$BODY$
    UPDATE BODEGA SET Bod_Historia = array_append(Bod_Historia,h) WHERE Bod_ID = id_bodega;
$BODY$
LANGUAGE sql;

/* del_historia
 * Elimina historia a bodega
 */
CREATE OR REPLACE FUNCTION del_historia(
  id_bodega integer,
  ind integer
) RETURNS void 	AS
$BODY$
  UPDATE BODEGA SET Bod_Historia = array_remove(Bod_Historia,Bod_Historia[ind])  WHERE Bod_ID = id_bodega;
$BODY$
LANGUAGE sql;

/* calificacion_vino
 * Constructor de el tipo calificacion_vino
 */
CREATE OR REPLACE FUNCTION calificacion_vino (
  nombre varchar(50),
  valor integer,
  ano integer
) RETURNS calificacion_vino AS
$BODY$
DECLARE
  newdata calificacion_vino;
BEGIN
  newdata = NULL;
  IF valor IS NOT NULL AND ano IS NOT NULL AND nombre <> '' THEN
    IF ano > 0 and valor >=  0 AND valor <= 100THEN
      newdata = (nombre,valor,ano);
    ELSE
      RAISE 'calificacion_vino -> Año Invalido.';
    END IF;
  ELSE
    RAISE 'calificacion_vino -> Datos incompletos.';
  END IF;
  RETURN newdata;
END;
$BODY$
LANGUAGE plpgsql;

/* add_calificacion
 * Agrega calificacion a una marca
 */
CREATE OR REPLACE FUNCTION add_calificacion (
  id_marca integer,
  h calificacion_vino
) RETURNS void AS
$BODY$
BEGIN
  IF EXISTS (SELECT * FROM PRO_MAR WHERE FK_MARCA = id_marca and PM_Ano = h.ano) THEN
    UPDATE MARCA SET Mar_Calificaciones = array_append(Mar_Calificaciones,h) WHERE Mar_ID = id_marca;
  ELSE
     RAISE 'NO existe una Produccion para el año %',h.ano;
  END IF;
END;
$BODY$
LANGUAGE plpgsql;

/* del_calificacion
 * Elimina calificacion a una marca
 */
CREATE OR REPLACE FUNCTION del_calificacion(
  id_marca integer,
  ind integer
) RETURNS void 	AS
$BODY$
  UPDATE MARCA SET Mar_Calificaciones = array_remove(Mar_Calificaciones,Mar_Calificaciones[ind]) WHERE Mar_ID = id_marca;
$BODY$
LANGUAGE sql;

/* costo
 * Constructor de el tipo costo
 */
CREATE OR REPLACE FUNCTION costo (
  cant_muestas integer,
  precio float,
  "Pais" varchar(50)
) RETURNS costo AS
$BODY$
DECLARE
  newdata costo;
BEGIN
  newdata = NULL;
  IF cant_muestas IS NOT NULL AND precio IS NOT NULL AND "Pais" <> '' THEN
    IF EXISTS( SELECT Pai_ID FROM PAIS WHERE UPPER(Pai_Nombre) = UPPER("Pais") ) THEN
      newdata = (cant_muestas,precio,"Pais");
    ELSE
      RAISE 'costo -> Pais no se encuentra como Productor.';
    END IF;
  ELSE
    RAISE 'costo -> Datos incompletos.';
  END IF;
  RETURN newdata;
END;
$BODY$
LANGUAGE plpgsql;

/* Valoracion
 * Constructor de el tipo Valoracion
 */
CREATE OR REPLACE FUNCTION Valoracion (
  fase val_fase,
  elemento val_elemento,
  rango_inicial integer,
  rango_final integer,
  clasificacion val_clasificacion
) RETURNS Valoracion AS
$BODY$
DECLARE
  newdata Valoracion;
BEGIN
  newdata = NULL;
  IF fase IS NOT NULL AND elemento IS NOT NULL AND rango_inicial IS NOT NULL AND rango_final IS NOT NULL AND clasificacion IS NOT NULL THEN
    newdata = (fase,elemento,rango_inicial,rango_final,clasificacion);
  ELSE
    RAISE 'Valoriacion -> Datos incompletos.';
  END IF;
  RETURN newdata;
END;
$BODY$
LANGUAGE plpgsql;

/* premio
 * Constructor de el tipo premio
 */
CREATE OR REPLACE FUNCTION premio (
  cant_dinero float,
  posicion integer,
  reconocimiento pro_reco,
  valor_reco integer,
  descripcion text = NULL
) RETURNS premio as 
$BODY$
DECLARE
  newdata premio;
BEGIN
  newdata = NULL;
  IF cant_dinero IS NOT NULL AND posicion IS NOT NULL AND reconocimiento IS NOT NULL AND valor_reco IS NOT NULL THEN
    newdata = (cant_dinero,posicion,reconocimiento,valor_reco,descripcion);
  ELSE
    RAISE 'Valoriacion -> Datos incompletos.';
  END IF;
  RETURN newdata;
END;
$BODY$
LANGUAGE plpgsql;
