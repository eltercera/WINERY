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
  catidadbotella integer,
  pais varchar(50)
);

/* Legislacion
 * Fecha de Creacion: 14/05/2015
 */
CREATE TYPE tipolegislacion AS ENUM ('ley', 'norma', 'decreto');
CREATE TYPE legislacion as (
  nombre varchar(50),
  ano smallint,
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
  codinternacional smallint,
  numero varchar(10),
  tipo tipotelefono,
  codarea smaillint
);