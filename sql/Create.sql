
/*
* DENOMINACION
*Fecha de Creacion: Mayo 16 
*/

CREATE TABLE IF NOT EXISTS DENOMINACION (
  Den_ID serial NOT NULL, 
  Den_Creacion date NOT NULL, 
  Den_Nombre varchar(50) NOT NULL, 
  Den_Descripcion text, 
  Den_Categoria varchar(50)
);

/*
* COSECHA
* Fecha de creacion: Mayo 16 
*/

CREATE TABLE IF NOT EXISTS COSECHA (
  Cos_ID serial NOT NULL, 
  Cos_Ano integer NOT NULL, 
  Cos_Evaluacion varchar(2) NOT NULL, 
  FK_Vinedo integer NOT NULL, 
  FK_Bodega integer NOT NULL, 
  FK_Pais integer NOT NULL, 
  FK_Region integer NOT NULL, 
  FK_Variedad integer NOT NULL, 
  FK_Denominacion integer NOT NULL
);

/*
* CONSUMIDOR
* Fecha de creacion: Mayo 16 
*/

CREATE TABLE IF NOT EXISTS CONSUMIDOR (
  Con_ID serial NOT NULL, 
  Con_Nombre varchar(50) NOT NULL, 
  Con_Apellido varchar(50) NOT NULL, 
  Con_Genero char NOT NULL, 
  Con_Fecha_Nac date NOT NULL, 
  FK_Lugar integer NOT NULL, 
  Con_Direccion varchar(200) NOT NULL
);

/*
* COMIDA
* Fecha de creacion: Mayo 16 
*/

CREATE TABLE IF NOT EXISTS COMIDA (
  Com_ID serial NOT NULL,
  Com_Nombre varchar(50) NOT NULL,
  Com_Tipo varchar(10) NOT NULL,
  Com_Descripcion text
); 

/*
* CONCURSO
* Fecha de creacion: Mayo 17 
*/

CREATE TABLE IF NOT EXISTS CONCURSO (
  Con_ID serial NOT NULL, 
  Con_Nombre varchar(50) NOT NULL, 
  Con_Email varchar(50) NOT NULL, 
  Con_Tipo varchar(11) NOT NULL,
  Con_Nivel varchar(15) NOT NULL,
  Con_Condicion_Pago text NOT NULL, 
  Con_Premios Premio ARRAY NOT NULL, 
  Con_Costos Costo ARRAY NOT NULL, 
  FK_Escala integer NOT NULL
); 

/*
* CATA_PARTICIPANTE
* Fecha de creacion: Mayo 16 
*/

CREATE TABLE IF NOT EXISTS CATA_PARTICIPANTE (
  CP_ID serial NOT NULL, 
  CP_FaseVisual integer NOT NULL, 
  CP_FaseOlfativa_i integer NOT NULL, 
  CP_FaseOlfativa_c integer NOT NULL, 
  CP_FaseGustativa_i integer NOT NULL, 
  CP_FaseGustativa_c integer NOT NULL, 
  CP_Armonia integer NOT NULL, 
  CP_Total integer NOT NULL, 
  CP_Observacion text, 
  FK_Cata_Experta integer NOT NULL,
  FK_Marca integer NOT NULL,
  FK_Catador_Consultor integer NOT NULL,
  FK_Calendario integer NOT NULL,
  FK_Concurso integer NOT NULL,
  FK_Inscripcion integer NOT NULL
);

/*
* CATA_VINO
*Fecha de creacion: Mayo 16 
*/

CREATE TABLE IF NOT EXISTS CATA_VINO (
  CV_ID serial NOT NULL, 
  CV_FaseVisual integer NOT NULL, 
  CV_FaseOlfativa_i integer NOT NULL, 
  CV_FaseOlfativa_c integer NOT NULL, 
  CV_FaseGustativa_i integer NOT NULL, 
  CV_FaseGustativa_c integer NOT NULL, 
  CV_Armonia integer NOT NULL, 
  CV_Total integer NOT NULL, 
  CV_Observacion text, 
  FK_Catador_Consultor integer NOT NULL,
  FK_Calendario integer NOT NULL,
  FK_Concurso integer NOT NULL,
  FK_Muestra integer NOT NULL,
  FK_Marca integer NOT NULL,
  FK_Inscripcion integer NOT NULL
);

/*
* CATA_EXPERTA
* Fecha de creacion: Mayo 16 
*/

CREATE TABLE IF NOT EXISTS CATA_EXPERTA (
  CE_ID serial NOT NULL, 
  CE_Anada integer NOT NULL, 
  CE_Valoracion integer NOT NULL, 
  FK_Marca integer NOT NULL, 
  FK_Catador_Consultor integer NOT NULL,
  FK_Calendario integer NOT NULL,
  FK_Concurso integer NOT NULL
);

/*
* CATADOR_CONSULTOR
* Fecha de creacion: Mayo 16 
*/

CREATE TABLE IF NOT EXISTS CATADOR_CONSULTOR (
  CC_ID serial NOT NULL, 
  CC_Nivel varchar(50) NOT NULL, 
  CC_Nombre varchar(50) NOT NULL, 
  CC_Telefonos Telefono ARRAY NOT NULL, 
  CC_Email varchar(50) NOT NULL, 
  CC_Genero char NOT NULL, 
  CC_Fecha_Nacimiento date NOT NULL
);

/*
* CALENDARIO
* Fecha de creacion: Mayo 16 
*/

CREATE TABLE IF NOT EXISTS CALENDARIO (
  Cal_ID serial NOT NULL, 
  Cal_FechaInicio date NOT NULL, 
  Cal_FechaFinal date NOT NULL, 
  Cal_FechaLimiteInscripcion date NOT NULL, 
  Cal_Direccion DireccionGeneral NOT NULL, 
  Cal_F_Lim_Envio_Muestras date, 
  Cal_Edicion varchar(5), 
  FK_Concurso integer NOT NULL
);

/*
* BODEGA
* Fecha de creacion: Mayo 16 
*/

CREATE TABLE IF NOT EXISTS BODEGA (
  Bod_ID serial NOT NULL, 
  Bod_Nombre varchar(50) NOT NULL, 
  Bod_Direccion text NOT NULL, 
  Bod_Fundacion date, 
  Bod_Dir_Tecnico varchar(50) NOT NULL, 
  Bod_Historia HistoriaBodega ARRAY, 
  Bod_Descripcion text NOT NULL, 
  FK_Pais integer NOT NULL, 
  FK_Bodega integer, 
  FK_Productor integer NOT NULL
);

/*
* COMPOSICION
* Fecha de Creacion: Mayo 17
*/

CREATE TABLE IF NOT EXISTS COMPOSICION (
  Com_Porcentaje integer NOT NULL,
  FK_Vinedo integer NOT NULL,
  FK_Pais integer NOT NULL,
  FK_Bodega integer NOT NULL,
  FK_Region integer NOT NULL,
  FK_Variedad integer NOT NULL,
  FK_Denominacion integer NOT NULL,
  FK_Marca integer NOT NULL
);


/*
* CLASIFICACION
* Fecha de Creacion: Mayo 17
*/

CREATE TABLE IF NOT EXISTS CLASIFICACION (
  Cla_ID serial NOT NULL,
  Cla_Nombre varchar(50) NOT NULL,
  Cla_Nivel char(1) NOT NULL,
  Cla_Volumen integer[2],
  FK_Clasificacion integer
);

/*
* DEN_VAR_CLA
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS DEN_VAR (
  FK_Denominacion integer NOT NULL,
  FK_Variedad integer NOT NULL
);


/*
* DEN_VAR_CLA
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS DEN_VAR_CLA (
  FK_Denominacion integer NOT NULL,
  FK_Variedad integer NOT NULL,
  FK_Clasificacion integer NOT NULL
);

/*
* DV_PR
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS DV_PR (
  FK_Region integer NOT NULL,
  FK_Pais integer NOT NULL,
  FK_Denominacion integer NOT NULL,
  FK_Variedad integer NOT NULL
);

/*
* ESCALA
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS ESCALA (
  Esc_ID serial NOT NULL,
  Esc_Tipo varchar(10) NOT NULL,
  Esc_Lista_Valoracion Valoracion ARRAY
);

/*
* ESPECIALISTA
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS ESPECIALISTA (
  FK_Region integer NOT NULL,
  FK_Catador_Consultor integer NOT NULL
);

/*
* HIS_PRESENTACION
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS HIS_PRESENTACION (
  HP_Ano integer NOT NULL,
  HP_Precio float,
  FK_Presentacion integer NOT NULL,
  FK_Marca integer NOT NULL
);

/*
* INSCRIPCION_VINO
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS INSCRIPCION_VINO (
  IV_ID serial NOT NULL,
  IV_Costo_Total float NOT NULL,
  IV_Fecha_Inscripcion date NOT NULL,
  IV_FechaPago date,
  IV_Num_Muestras integer,
  FK_Bodega integer,
  FK_Catador_Consultor integer,
  FK_Concurso integer NOT NULL,
  FK_Calendario integer NOT NULL
);

/*
* JUEZ
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS JUEZ (
  FK_Catador_Consultor integer NOT NULL,
  FK_Calendario integer NOT NULL,
  FK_Concurso integer NOT NULL
);

/*
* LUGAR
* Fecha de Creacion: Mayo 16
*/
CREATE TABLE IF NOT EXISTS LUGAR (
  Lug_ID serial NOT NULL,
  Lug_Nombre varchar(50) NOT NULL,
  Lug_Tipo varchar(6) NOT NULL,
  Lug_Continente varchar(10),
  Lug_Moneda varchar(10),
  Lug_unidad_cambio float,
  FK_Lugar integer
);

/*
* MARCA 
* Fecha de Creacion: Mayo 16
* OBS: FALTAN TIPO DE DATO des_cata
*/

CREATE TABLE IF NOT EXISTS MARCA (
  Mar_ID serial NOT NULL,
  Mar_Descripcion text NOT NULL,
  Mar_Nombre varchar(50) NOT NULL,
  Mar_Des_Cata des_cata NOT NULL,
  Mar_Elaboracion fase_elaboracion_vino,
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
  FK_Clasificacion integer NOT NULL,
  FK_Bodega integer NOT NULL
);


/*
* MARIDAJE
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS MARIDAJE (
  Mar_Descripcion text NOT NULL,
  FK_Comida integer NOT NULL,
  FK_Marca integer NOT NULL
);

/*
* MUESTRA
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS MUESTRA (
  Mue_ID serial NOT NULL,
  Mue_Numero integer NOT NULL,
  Mue_Anada integer NOT NULL,
  Mue_Posicion integer,
  Mue_Fecha_Recibo date,
  FK_Inscripcion integer NOT NULL,
  FK_Marca integer NOT NULL
);

/*
* OREV
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS OREV (
  Ore_ID serial NOT NULL,
  Ore_Nombre varchar(50) NOT NULL,
  Ore_Dir_Gen direcciongeneral NOT NULL,
  FK_Region integer NOT NULL
);

/*
* ORE_CON
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS ORE_CON (
  FK_OREV integer NOT NULL,
  FK_Concurso integer NOT NULL
);

/*
* PAIS 
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS PAIS (
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

CREATE TABLE IF NOT EXISTS PAI_REG (
  FK_Pais integer NOT NULL,
  FK_Region integer NOT NULL
);

/*
* PRESENTACION
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS PRESENTACION (
  Pre_ID serial NOT NULL,
  Pre_Tipo varchar(10) NOT NULL,
  Pre_Cantidad integer,
  Pre_precio_base float NOT NULL,
  FK_Marca integer NOT NULL
);

/*
* PRODUCTOR
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS PRODUCTOR (
  Pro_ID serial NOT NULL,
  Pro_Nombre varchar(50) NOT NULL,
  Pro_Dir_General direcciongeneral NOT NULL
);

/*
* Pro_Mar
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS PRO_MAR (
  PM_Ano integer NOT NULL,
  PM_Botellas integer NOT NULL,
  PM_Consumo_Int float NOT NULL,
  PM_Exportaciones exportacion ARRAY NOT NULL,
  FK_Marca integer NOT NULL
);

/*
* Region 
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS REGION (
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

CREATE TABLE IF NOT EXISTS SOLICITUD (
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

CREATE TABLE IF NOT EXISTS VARIEDAD (
  Var_ID serial NOT NULL,
  Var_Nombres varchar(50) ARRAY NOT NULL,
  Var_Tipo_Uva varchar(10) NOT NULL
);

/*
* VINEDO
* Fecha de Creacion: Mayo 15
*/

CREATE TABLE IF NOT EXISTS VINEDO (
  Vin_ID serial NOT NULL,
  Vin_Nombre varchar(50) NOT NULL,
  Vin_Hect_Cult cultivo ARRAY,
  FK_Pais integer NOT NULL,
  FK_Region integer NOT NULL,
  FK_Bodega integer NOT NULL,
  FK_Variedad integer NOT NULL,
  FK_Denominacion integer NOT NULL
);

/*
*  VISITA
*  Fecha de Creacion: Mayo 15
*/

CREATE TABLE IF NOT EXISTS VISITA (
	Vis_Fecha date NOT NULL,
	Vis_Beneficio text,
	FK_Bodega integer NOT NULL,
	FK_Solicitud integer NOT NULL
);
