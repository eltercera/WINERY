/*
* DENOMINACION
*Fecha de Creacion: Mayo 16 
*/

<<<<<<< HEAD
CREATE TABLE IF NOT EXISTS DENOMINACION (
  Den_ID serial NOT NULL, 
  Den_Creacion date, 
  Den_Nombre varchar(50) NOT NULL, 
  Den_Descricion text, 
  Den_Categoria varchar(50)
);
=======
CREATE TABLE IF NOT EXISTS DENOMINACION (Den_ID serial NOT NULL, Den_Creacion date, Den_Nombre varchar(50) NOT NULL, Den_Descricion text, Den_Categoria varchar(50));
>>>>>>> 33eab8e3ea0c51f1497b163e32dbed99882b87e0

/*
* COSECHA
* Fecha de creacion: Mayo 16 
*/

<<<<<<< HEAD
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
=======
CREATE TABLE IF NOT EXISTS COSECHA (Cos_ID serial NOT NULL, Cos_Ano integer NOT NULL, Cos_Evaluacion varchar(2) NOT NULL, FK_Vinedo integer NOT NULL, FK_Bodega integer NOT NULL, FK_Pais integer NOT NULL, FK_Region integer NOT NULL, FK_Variedad integer NOT NULL, FK_Denominacion integer NOT NULL);
>>>>>>> 33eab8e3ea0c51f1497b163e32dbed99882b87e0

/*
* CONSUMIDOR
* Fecha de creacion: Mayo 16 
*/

<<<<<<< HEAD
CREATE TABLE IF NOT EXISTS CONSUMIDOR (
  Con_ID serial NOT NULL, 
  Con_Nombre varchar(50) NOT NULL, 
  Con_Apellido varchar(50) NOT NULL, 
  Con_Genero char NOT NULL, 
  Con_Fecha_Nac date NOT NULL, 
  FK_Lugar integer NOT NULL, 
  Con_Direccion varchar(200) NOT NULL
);
=======
CREATE TABLE IF NOT EXISTS CONSUMIDOR (Con_ID serial NOT NULL, Con_Nombre varchar(50) NOT NULL, Con_Apellido varchar(50) NOT NULL, Con_Genero char NOT NULL, Con_Fecha_Nac date NOT NULL, FK_Lugar integer NOT NULL, Con_Direccion varchar(200) NOT NULL);
>>>>>>> 33eab8e3ea0c51f1497b163e32dbed99882b87e0

/*
* CONCURSO
* Fecha de creacion: Mayo 16 
*/

<<<<<<< HEAD
CREATE TABLE IF NOT EXISTS CONCURSO (
  Con_ID serial NOT NULL, 
  Con_Nombre varchar(50) NOT NULL, 
  Con_Email varchar(50) NOT NULL, 
  Con_Tipo varchar(11) NOT NULL, 
  Con_Condicion_Pago text NOT NULL, 
  Con_Premios Premio ARRAY NOT NULL, 
  Con_Costos Costo ARRAY NOT NULL, 
  FK_Escala integer NOT NULL
); 
=======
CREATE TABLE IF NOT EXISTS CONCURSO (Con_ID serial NOT NULL, Con_Nombre varchar(50) NOT NULL, Con_Email varchar(50) NOT NULL, Con_Tipo varchar(11) NOT NULL, Con_Condicion_Pago text NOT NULL, Con_Premios Premio ARRAY NOT NULL, Con_Costos Costo ARRAY NOT NULL, FK_Escala integer NOT NULL); 
>>>>>>> 33eab8e3ea0c51f1497b163e32dbed99882b87e0

/*
* CATA_PARTICIPANTE
* Fecha de creacion: Mayo 16 
*/

<<<<<<< HEAD
CREATE TABLE IF NOT EXISTS CATA_PARTICIPANTE (
  CP_ID serial NOT NULL, 
  CP_FaseVisual integer NOT NULL, 
  CP_FaseOlfativa_i integer NOT NULL, 
  CP_Fase Olfativa_c integer NOT NULL, 
  CP_FaseGustativa_i integer NOT NULL, 
  CP_FaseGustativa_c integer NOT NULL, 
  CP_Armonia integer NOT NULL, 
  CP_Total integer NOT NULL, 
  CP_Observacion text, 
  FK_Cata_Experta integer NOT NULL, 
  FK_Calendario integer, 
  FK_Inscripcion integer NOT NULL
);
=======
CREATE TABLE IF NOT EXISTS CATA_PARTICIPANTE (CP_ID serial NOT NULL, CP_FaseVisual integer NOT NULL, CP_FaseOlfativa_i integer NOT NULL, CP_Fase_Olfativa_c integer NOT NULL, CP_FaseGustativa_i integer NOT NULL, CP_FaseGustativa_c integer NOT NULL, CP_Armonia integer NOT NULL, CP_Total integer NOT NULL, CP_Observacion text, FK_Cata_Experta integer NOT NULL, FK_Calendario integer, FK_Inscripcion integer NOT NULL);
>>>>>>> 33eab8e3ea0c51f1497b163e32dbed99882b87e0

/*
* CATA_VINO
*Fecha de creacion: Mayo 16 
*/

<<<<<<< HEAD
CREATE TABLE IF NOT EXISTS CATA_VINO (
  CV_ID serial NOT NULL, 
  CV_FaseVisual integer NOT NULL, 
  CV__FaseOlfativa_i integer NOT NULL, 
  CV_Fase Olfativa_c integer NOT NULL, 
  CV_FaseGustativa_i integer NOT NULL, 
  CV_FaseGustativa_c integer NOT NULL, 
  CV_Armonia integer NOT NULL, 
  CV_Total integer NOT NULL, 
  CV_Observacion text, 
  FK_Juez integer NOT NULL, 
  FK_Muestra integer NOT NULL
);
=======
CREATE TABLE IF NOT EXISTS CATA_VINO (CV_ID serial NOT NULL, CV_FaseVisual integer NOT NULL, CV__FaseOlfativa_i integer NOT NULL, CV_Fase_Olfativa_c integer NOT NULL, CV_FaseGustativa_i integer NOT NULL, CV_FaseGustativa_c integer NOT NULL, CV_Armonia integer NOT NULL, CV_Total integer NOT NULL, CV_Observacion text, FK_Juez integer NOT NULL, FK_Muestra integer NOT NULL);
>>>>>>> 33eab8e3ea0c51f1497b163e32dbed99882b87e0

/*
* CATA_EXPERTA
* Fecha de creacion: Mayo 16 
*/

<<<<<<< HEAD
CREATE TABLE IF NOT EXISTS CATA_EXPERTA (
  CE_ID serial NOT NULL, 
  CE_Anada integer NOT NULL, 
  CE_Valoracion integer NOT NULL, 
  FK_Marca number NOT NULL, 
  FK_Juez number NOT NULL
);
=======
CREATE TABLE IF NOT EXISTS CATA_EXPERTA (CE_ID serial NOT NULL, CE_Anada integer NOT NULL, CE_Valoracion integer NOT NULL, FK_Marca integer NOT NULL, FK_Juez integer NOT NULL);
>>>>>>> 33eab8e3ea0c51f1497b163e32dbed99882b87e0

/*
* CATADOR_CONSULTOR
* Fecha de creacion: Mayo 16 
*/

<<<<<<< HEAD
CREATE TABLE IF NOT EXISTS CATADOR_CONSULTOR (
  CC_ID serial NOT NULL, 
  CC_Nivel varchar(50) NOT NULL, 
  CC_Nombre varchar(50) NOT NULL, 
  CC_Telefonos Telefono ARRAY NOT NULL, 
  CC_Email varchar(50) NOT NULL, 
  CC_Genero char NOT NULL, 
  CC_Fecha_Nacimiento date NOT NULL
);
=======
CREATE TABLE IF NOT EXISTS CATADOR_CONSULTOR (CC_ID serial NOT NULL, CC_Nivel varchar(50) NOT NULL, CC_Nombre varchar(50) NOT NULL, CC_Telefonos Telefono ARRAY NOT NULL, CC_Email varchar(50) NOT NULL, CC_Genero char NOT NULL, CC_Fecha_Nacimiento date NOT NULL);
>>>>>>> 33eab8e3ea0c51f1497b163e32dbed99882b87e0

/*
* CALENDARIO
* Fecha de creacion: Mayo 16 
*/

<<<<<<< HEAD
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
=======
CREATE TABLE IF NOT EXISTS CALENDARIO (Cal_ID serial NOT NULL, Cal_FechaInicio date NOT NULL, Cal_FechaFinal date NOT NULL, Cal_FechaLimiteInscripcion date NOT NULL, Cal_Direccion DireccionGeneral NOT NULL, Cal_F_Lim_Envio_Muestras date, Cal_Edicion varchar(5), FK_Concurso integer NOT NULL);
>>>>>>> 33eab8e3ea0c51f1497b163e32dbed99882b87e0

/*
* BODEGA
* Fecha de creacion: Mayo 16 
*/

<<<<<<< HEAD
CREATE TABLE IF NOT EXISTS BODEGA (
  Bod_ID serial NOT NULL, 
  Bod_Direccion text NOT NULL, 
  Bod_Fundacion date, 
  Bod_Dir_Tecnico varchar(50) NOT NULL, 
  Bod_Historia HistoriaBodega, 
  Bod_Descripcion text NOT NULL, 
  FK_Pais integer, 
  FK_Bodega intger, 
  FK_Productor integer
);
=======
CREATE TABLE IF NOT EXISTS BODEGA (Bod_ID serial NOT NULL, Bod_Direccion text NOT NULL, Bod_Fundacion date, Bod_Dir_Tecnico varchar(50) NOT NULL, Bod_Historia HistoriaBodega, Bod_Descripcion text NOT NULL, FK_Pais integer, FK_Bodega integer, FK_Productor integer);
>>>>>>> 33eab8e3ea0c51f1497b163e32dbed99882b87e0

/*
* DEN_VAR
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS DEN_VAR (
  FK_Denominacion integer NOT NULL,
  FK_Variedad integer NOT NULL,
  FK_Clasificacion integer NOT NULL
);

/*
* DV_PR_V
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS DV_PR_V (
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

CREATE TABLE IF NOT EXISTS ESCALA (
  Esc_ID serial NOT NULL,
  Esc_Tipo varchar(10) NOT NULL,
  Esc_Lista_Valoracion Valoriacion ARRAY
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
  FK_Calendario integer NOT NULL
);

/*
* JUEZ
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS JUEZ (
  FK_Catador_Consultor integer NOT NULL,
  FK_Calendario integer NOT NULL
);

/*
* LUGAR
* Fecha de Creacion: Mayo 16
*/

CREATE TABLE IF NOT EXISTS LUGAR (
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

CREATE TABLE IF NOT EXISTS MARCA (
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
  PM_Marca integer NOT NULL
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
  FK_Bodega integer NOT NULL,
  FK_Region integer NOT NULL,
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
	fk_Solicitud integer NOT NULL
);