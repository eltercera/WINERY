/* table_ingrediente
 * A partir de un id de marca y el indice de la receta
 * obtiene la tabla de los ingredientes de la receta
 * Fecha de Creacion: 15/05/2015
 */
CREATE OR REPLACE FUNCTION table_ingrediente (
  id_marca integer,
  indice integer
) RETURNS TABLE(
  index bigint,
  nombre varchar(50),
  cantidad varchar(10),
  unidad varchar(10)
) AS
$BODY$
  SELECT row_number() OVER () as index,nombre,cantidad,unidad 
  FROM unnest((SELECT mar_recetas[indice].ingredientes FROM marca WHERE mar_id = id_marca));
$BODY$
LANGUAGE sql;

/* table_receta
 * A partir de un id de marca obtiene la tabla de sus recetas con su indice
 * Fecha de Creacion: 15/05/2015
 */
CREATE OR REPLACE FUNCTION table_receta (
  id_marca integer
) RETURNS TABLE(
  index bigint,
  nombre varchar(50),
  t_preparacion integer,
  t_coccion integer,
  preparacion text,
  descripcion text,
  imagen oid
) AS
$BODY$
  SELECT row_number() OVER () as index,nombre,t_preparacion,t_coccion,preparacion,descripcion,imagen 
  FROM unnest((SELECT mar_recetas FROM marca WHERE mar_id = id_marca));
$BODY$
LANGUAGE sql;


/* table_exportacion
 * A partir de un id de marca y un año obtiene la tabla de exportaciones
 * Fecha de Creacion: 19/05/2015
 */
CREATE OR REPLACE FUNCTION table_exportacion (
  id_marca integer,
  ano_e integer
) RETURNS TABLE(
  index bigint,
  pais varchar(50),
  botellas integer
) AS
$BODY$
  SELECT row_number() OVER () as index, pais, cantidadbotella as botellas 
  FROM unnest((SELECT PM_Exportaciones FROM pro_mar WHERE fk_marca = id_marca and PM_ano = ano_e));
$BODY$
LANGUAGE sql;

/* table_exportacion
 * A partir de un array de exportaciones obtiene la tabla de exportaciones
 * Fecha de Creacion: 19/05/2015
 */
CREATE OR REPLACE FUNCTION table_exportacion (
  expor exportacion[]
) RETURNS TABLE(
  index bigint,
  pais varchar(50),
  botellas integer
) AS
$BODY$
  SELECT row_number() OVER () as index, pais, cantidadbotella as botellas 
  FROM unnest(expor);
$BODY$
LANGUAGE sql;

/* table_legislacion
 * A partir de un id de pais obtiene la tabla de legislaciones
 * Fecha de Creacion: 19/05/2015
 */
CREATE OR REPLACE FUNCTION table_legislacion (
  id_pais integer
) RETURNS TABLE(
  index bigint,
  nombre varchar(50),
  ano integer,
  tipo tipolegislacion,
  descripcion text,
  documento oid
) AS
$BODY$
  SELECT row_number() OVER () as index, nombre, ano, tipo, descripcion, documento
  FROM unnest((SELECT Pai_Legislaciones FROM PAIS WHERE Pai_ID = id_pais));
$BODY$
LANGUAGE sql;

/* table_temperatura
 * A partir de un id de region obtiene la tabla de sis temperaturas
 * Fecha de Creacion: 20/05/2015
 */
CREATE OR REPLACE FUNCTION table_temperatura (
  id_region integer
) RETURNS TABLE(
  index bigint,
  unidad varchar(5),
  descripcion varchar(50),
  valor float,
  valormin float
) AS
$BODY$
  SELECT row_number() OVER () as index, unidad, descripcion, valor, valormin
  FROM unnest((SELECT (reg_descripcion_general).temperaturas FROM REGION WHERE Reg_ID = id_region));
$BODY$
LANGUAGE sql;

/* table_presipitacion
 * A partir de un id de region obtiene la tabla de sus presipitaciones
 * Fecha de Creacion: 20/05/2015
 */
CREATE OR REPLACE FUNCTION table_presipitacion (
  id_region integer
) RETURNS TABLE(
  index bigint,
  unidad varchar(5),
  descripcion varchar(50),
  valor float,
  valormin float
) AS
$BODY$
  SELECT row_number() OVER () as index, unidad, descripcion, valor, valormin
  FROM unnest((SELECT (reg_descripcion_general).presipitaciones FROM REGION WHERE Reg_ID = id_region));
$BODY$
LANGUAGE sql;

/* table_suelos
 * A partir de un id de region obtiene la tabla de sus presipitaciones
 * Fecha de Creacion: 20/05/2015
 */
CREATE OR REPLACE FUNCTION table_suelos (
  id_region integer
) RETURNS TABLE(
  index bigint,
  nombre varchar(25),
  ubicacion varchar(50)
) AS
$BODY$
  SELECT row_number() OVER () as index, nombre, ubicacion
  FROM unnest((SELECT (reg_descripcion_general).suelos FROM REGION WHERE Reg_ID = id_region));
$BODY$
LANGUAGE sql;

/* table_cultivo
 * A partir de un id de vinedo obtiene la tabla de sus coltivos
 * Fecha de Creacion: 20/05/2015
 */
CREATE OR REPLACE FUNCTION table_cultivo (
  id_vinedo integer
) RETURNS TABLE(
  index bigint,
  ano integer,
  hectareascultivadas float
) AS
$BODY$
  SELECT row_number() OVER () as index, ano, hectareascultivadas
  FROM unnest((SELECT Vin_Hect_Cult FROM VINEDO WHERE Vin_ID = id_vinedo));
$BODY$
LANGUAGE sql;

/* table_resultado_s
 * A partir de un id de Solicitud obtiene los resultados
 * Fecha de Creacion: 20/05/2015
 */
CREATE OR REPLACE FUNCTION table_resultado_s (
  id_sol integer
) RETURNS TABLE(
  index bigint,
  idvino integer,
  valoracion integer
) AS
$BODY$
  SELECT row_number() OVER () as index, idvino, valoracion
  FROM unnest((SELECT Sol_Resultados FROM SOLICITUD WHERE sOL_ID = id_sol));
$BODY$
LANGUAGE sql;

/* table_calificacion
 * A partir de un id de marca obtiene sus calificaciones
 * Fecha de Creacion: 20/05/2015
 */
CREATE OR REPLACE FUNCTION table_calificacion (
  id_mar integer
) RETURNS TABLE(
  index bigint,
  nombre varchar(50),
  valor integer,
  ano integer
) AS
$BODY$
  SELECT row_number() OVER () as index, nombre, valor, ano
  FROM unnest((SELECT Mar_Calificaciones FROM MARCA WHERE Mar_ID = id_mar));
$BODY$
LANGUAGE sql;
