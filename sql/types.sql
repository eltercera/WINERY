/* Suelo
 * Fecha de Creacion: 14/05/2015
 */
CREATE TYPE suelo as (
  nombre varchar(25),
  ubicacion varchar(50)
);

/* Exportacion
 * Fecha de Creacion: 14/05/2015
 */
CREATE TYPE exportacion as (
  cantidadbotella integer,
  pais varchar(50)
);

/* Legislacion
 * Fecha de Creacion: 14/05/2015
 */
CREATE TYPE tipolegislacion AS ENUM ('ley', 'norma', 'decreto');
CREATE TYPE legislacion as (
  nombre varchar(50),
  ano integer,
  tipo tipolegislacion,
  descripcion text,
  documento oid
);

/* Ingrediente
 * Fecha de Creacion: 14/05/2015
 */
CREATE TYPE ingrediente as (
  nombre varchar(50),
  unidad varchar(10),
  cantidad varchar(10)
);

/* Receta
 * Fecha de Creacion: 14/05/2015
 */
CREATE TYPE receta as (
  nombre varchar(50),
  t_preparacion integer,
  t_coccion integer,
  preparacion text,
  descripcion text,
  imagen oid,
  ingredientes ingrediente[]
);

/* Medida
 * Fecha de Creacion: 14/05/2015
 */
CREATE TYPE medida as (
  unidad varchar(5),
  descripcion varchar(50),
  valor float,
  valormin float
);

/* Des_Gen_Region
 * Fecha de Creacion: 14/05/2015
 */
CREATE TYPE des_gen_region as (
  altitud medida,
  temperaturas medida[],
  presipitaciones medida[],
  riesgos_vina varchar(100)[],
  suelos suelo[]
);

/* Telefono
 * Fecha de Creacion: 14/05/2015
 */
CREATE TYPE tipotelefono AS ENUM ('local', 'movil', 'oficina');
CREATE TYPE telefono as (
  codinternacional integer,
  numero varchar(10),
  tipo tipotelefono,
  codarea integer
);

/* Res_Solicitud
 * Fecha de Creacion: 15/05/2015
 */
CREATE TYPE res_solicitud as (
  idvino integer,
  valoracion integer
);

/* DireccionGeneral
 * Fecha de Creacion: 15/05/2015
 */
CREATE TYPE direcciongeneral as (
  direccion varchar(200),
  telefonos telefono[],
  web varchar(200),
  email varchar(20)
);

/* NombrePersona
 * Fecha de Creacion: 15/05/2015
 */
CREATE TYPE nombrepersona as (
  nombre varchar(25),
  snombre varchar(25),
  apellido varchar(25),
  sapellido varchar(25)
);

/* Cultivo
 * Fecha de Creacion: 15/05/2015
 */
CREATE TYPE cultivo as (
  ano integer,
  hectareascultivadas float
);

/* HistoriaBodega
 * Fecha de Creacion: 15/05/2015
 */
CREATE TYPE historiabodega as (
  ano integer,
  echo text
);

/* Calificacion_Vino
 * Fecha de Creacion: 15/05/2015
 */
CREATE TYPE calificacion_vino as (
  nombre varchar(50),
  valor integer,
  ano integer
);

/* Costo
 * Fecha de Creacion: 15/05/2015
 */
CREATE TYPE costo as (
  cant_muestas integer,
  precio float,
  pais varchar(50)
);

/* Fase_Elaboracion_Vino
 * Fecha de Creacion: 15/05/2015
 */
CREATE TYPE fas_ela_vin AS ENUM ('plantación', 'espera', 'vendimia', 'prensado','fermentación','maruración','filtrado','embotellamiento');
CREATE TYPE fase_elaboracion_vino as (
  secuencia fas_ela_vin,
  detalles text
);

/* Valoriacion
 * Fecha de Creacion: 15/05/2015
 */
CREATE TYPE val_fase AS ENUM ('olfativa ', 'gustativa');
CREATE TYPE val_elemento AS ENUM ('intensidad', 'calidad');
CREATE TYPE val_clasificacion AS ENUM ('catador', 'vino');
CREATE TYPE Valoriacion as (
  fase val_fase,
  elemento val_elemento,
  rango_inicial integer,
  rango_final integer,
  clasificacion val_clasificacion
);

/* Premio
 * Fecha de Creacion: 14/05/2015
 */
CREATE TYPE pro_reco AS ENUM ('medalla ', 'trofeo', 'diploma', 'liston');
CREATE TYPE premio as (
  cant_dinero float,
  posicion integer,
  reconocimiento pro_reco,
  valor_reco integer,
  descripcion text
);