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