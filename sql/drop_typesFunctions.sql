
DROP FUNCTION suelo (
  nombre varchar(25) ,
  ubicacion varchar(50)
);

DROP FUNCTION exportacion (
  cantidadbotella integer,
  pais varchar(50)
);

DROP FUNCTION legislacion (
  nombre varchar(50),
  ano integer,
  tipo tipolegislacion,
  descripcion text,
  documento oid
);

DROP FUNCTION ingrediente(
  nombre varchar(50),
  cantidad varchar(10),
  unidad varchar(10)
);

DROP FUNCTION add_ingrediente(
  id_marca integer,
  indice integer,
  ing ingrediente
);

DROP FUNCTION del_ingrediente(
  id_marca integer,
  i_rec integer,
  i_ing integer
);

DROP FUNCTION table_ingrediente (
  id_marca integer,
  indice integer
);

DROP FUNCTION receta (
  nombre varchar(50),
  t_preparacion integer,
  t_coccion integer,
  preparacion text,
  descripcion text,
  imagen oid
);

DROP FUNCTION table_receta (
  id_marca integer
);

DROP FUNCTION medida (
  unidad varchar(5),
  valor float,
  descripcion varchar(50),
  valormin float
);

DROP FUNCTION des_gen_region (
  altitud float
);

DROP FUNCTION  telefono (
  codinternacional integer,
  codarea varchar(5),
  numero varchar(10),
  tipo tipotelefono
);

DROP FUNCTION  res_solicitud (
  idvino integer,
  valoracion integer
);

DROP FUNCTION direcciongeneral (
  direccion varchar(200),
  web varchar(200),
  email varchar(50)
);

DROP FUNCTION nombrepersona (
  nombre varchar(25),
  apellido varchar(25),
  snombre varchar(25),
  sapellido varchar(25)
);

DROP FUNCTION  cultivo (
  ano integer,
  hectareascultivadas float
);

DROP FUNCTION historiabodega (
  ano integer,
  echo text
);

DROP FUNCTION calificacion_vino (
  nombre varchar(50),
  valor integer,
  ano integer
);

DROP FUNCTION  costo (
  cant_muestas integer,
  precio float,
  "Pais" varchar(50)
);


DROP FUNCTION fase_elaboracion_vino (
  secuencia fas_ela_vin,
  detalles text
);

DROP FUNCTION Valoracion (
  fase val_fase,
  elemento val_elemento,
  rango_inicial integer,
  rango_final integer,
  clasificacion val_clasificacion
);


DROP FUNCTION premio (
  cant_dinero float,
  posicion integer,
  reconocimiento pro_reco,
  valor_reco integer,
  descripcion text
);