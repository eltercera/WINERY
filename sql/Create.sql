/*
* DEN_VAR
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE DEN_VAR (
  FK_Denominacion integer NOT NULL,
  FK_Variedad integer NOT NULL,
  FK_Clasificacion integer NOT NULL
);

/*
* DV_PR_V
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE DV_PR_V (
  FK_Region integer NOT NULL,
  FK_Pais integer NOT NULL,
  FK_Vinedo integer NOT NULL,
  FK_Denominacion integer NOT NULL,
  FK_Variedad integer NOT NULL
);

/*
* ESCALA
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE ESCALA (
  Esc_ID serial NOT NULL,
  Esc_Tipo varchar(10) NOT NULL,
  Esc_Lista_Valoracion Valoracion ARRAY
);

/*
* ESPECIALISTA
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE ESPECIALISTA (
  FK_Region integer NOT NULL,
  FK_Catador_Consultor integer NOT NULL
);

/*
* HIS_PRESENTACION
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE HIS_PRESENTACION (
  HP_Ano integer NOT NULL,
  HP_Precio float,
  FK_Presentacion integer NOT NULL,
  FK_Marca integer NOT NULL
);

/*
* INSCRIPCION_VINO
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE INSCRIPCION_VINO (
  IV_ID serial NOT NULL,
  IV_Costo_Total float NOT NULL,
  IV_Fecha_Inscripcion date NOT NULL,
  IV_FechaPago date,
  IV_Num_Muestras integer,
  FK_Bodega integer,
  FK_Catador_Consultor integer,
  FK_Catador_Consultor integer,
  FK_Calendario integer NOT NULL
);

/*
* JUEZ
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE JUEZ (
  FK_Catador_Consultor integer NOT NULL,
  FK_Calendario integer NOT NULL
);

/*
* LUGAR
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE LUGAR (
  Lug_ID serial NOT NULL,
  Lug_Nombre varchar(50) NOT NULL,
  Lug_Tipo varchar(6) NOT NULL,
  Lug_Continente varchar(10) NOT NULL,
  Lug_Moneda varchar(10) NOT NULL,
  FK_Lugar integer
);

/*
* MARCA 
* Fecha de Creacion: Mayo 16
* OBS: FALTAN TIPO DE DATO des_cata
*/

CREATE TABLE MARCA (
  Mar_ID serial NOT NULL,
  Mar_Descripcion text NOT NULL,
  Mar_Nombre varchar(50) NOT NULL,
  /* Mar_Des_Cata des_cata ARRAY NOT NULL,*/
  Mar_Elaboracion fase_elaboracion_vino ARRAY,
  Mar_Temp_Servicio float NOT NULL,
  Mar_Maduracion integer NOT NULL,
  Mar_Ventana integer NOT NULL,
  Mar_G_Alcohol float NOT NULL,
  Mar_Acidez_Total float NOT NULL,
  Mar_PH float NOT NULL,
  Mar_Imagen oid,
  Mar_Tipo_Tapa varchar(10) NOT NULL,
  Mar_Recetas receta ARRAY,
  Mar_Calificaciones calificacion_vino ARRAY,
  FK_Clasificacion integer,
  FK_Bodega integer
);


/*
* MARIDAJE
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE MARIDAJE (
  Mar_Descripcion text NOT NULL,
  FK_Comida integer NOT NULL,
  FK_Marca integer NOT NULL
);

/*
* MUESTRA
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE MUESTRA (
  Mus_ID serial NOT NULL,
  Mus_Numero integer NOT NULL,
  Mus_Anada integer NOT NULL,
  Mus_Posicion integer,
  Mus_Fecha_Recibo date,
  FK_Marca integer NOT NULL
);

/*
* OREV
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE OREV (
  Ore_ID serial NOT NULL,
  Ore_Nombre varchar(50) NOT NULL,
  Ore_Dir_Gen direcciongeneral NOT NULL,
  FK_Region integer NOT NULL
);

/*
* ORE_CON
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE ORE_CON (
  FK_OREV integer NOT NULL,
  FK_Concurso integer NOT NULL
);

/*
* PAIS 
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE PAIS (
  Pai_ID serial NOT NULL,
  Pai_Nombre varchar(50) NOT NULL,
  Pai_Continente varchar(10) NOT NULL,
  Pai_Moneda varchar(10),
  Pai_Legislaciones legislacion ARRAY,
  Pai_Mapa oid,
  Pai_Union_Superior varchar(10)
);

/*
* PAI_REG
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE PAI_REG (
  FK_Pais integer NOT NULL,
  FK_Region integer NOT NULL
);

/*
* PRESENTACION
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE PRESENTACION (
  Pre_ID serial NOT NULL,
  Pre_Tipo varchar(10) NOT NULL,
  Pre_Cantidad integer,
  FK_Marca integer NOT NULL
);

/*
* PRODUCTOR
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE PRODUCTOR (
  Pro_ID serial NOT NULL,
  Pro_Nombre varchar(50) NOT NULL,
  Pro_Dir_General direcciongeneral NOT NULL
);

/*
* Pro_Mar
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE PRO_MAR (
  PM_Ano integer NOT NULL,
  PM_Botellas integer NOT NULL,
  PM_Consumo_Int float NOT NULL,
  PM_Exportaciones exportacion ARRAY NOT NULL,
  PM_Marca integer NOT NULL
);

/*
* Region 
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE REGION (
  Reg_ID serial NOT NULL,
  Reg_Nombre varchar(50) NOT NULL,
  Reg_Ano_Creacion integer,
  Reg_Latitud medida NOT NULL,
  Reg_Descripcion_General des_gen_region NOT NULL,
  Rep_Mapa oid,
  FK_Region integer
);

/*
* SOLICITUD
* Fecha de Creacion: Mayo 15
*/

CREATE TABLE SOLICITUD (
  Sol_ID serial NOT NULL,
  Sol_Fecha date NOT NULL,
  Sol_Resultados res_solicitud ARRAY[3] NOT NULL,
  Sol_Precio_Min float,
  Sol_Precio_Max float,
  Sol_Fecha_Valoracion date,
  FK_Catador_Consultor integer,
  FK_Consumidor	integer NOT NULL,
  FK_Comida integer
);

/*
* VARIEDAD
* Fecha de Creacion: Mayo 15
*/

CREATE TABLE VARIEDAD (
  Var_ID serial NOT NULL,
  Var_Nombres varchar(50) ARRAY NOT NULL,
  Var_Tipo_Uva varchar(10) NOT NULL
);

/*
* VINEDO
* Fecha de Creacion: Mayo 15
*/

CREATE TABLE VINEDO (
  Vin_ID serial NOT NULL,
  Vin_Nombre varchar(50) NOT NULL,
  Vin_Hect_Cult cultivo ARRAY,
  FK_Pais integer NOT NULL,
  FK_Bodega integer NOT NULL,
  FK_Region integer NOT NULL,
  FK_Variedad integer NOT NULL,
  FK_Denominacion integer NOT NULL
);

/*
*  VISITA
*  Fecha de Creacion: Mayo 15
*/

CREATE TABLE VISITA (
	Vis_Fecha date NOT NULL,
	Vis_Beneficio text,
	FK_Bodega integer NOT NULL,
	fk_Solicitud integer NOT NULL
);