﻿/*----------------------------------- CONSTRAINT UNIQUE ------------------------------*/

/*
* CONCURSO
* Con_Email
* Fecha de Creacion: Mayo 17
* UQ_CON_EMAIL
*/

ALTER TABLE CONCURSO ADD CONSTRAINT UQ_CON_EMAIL UNIQUE (Con_Email);

/*
* CONCURSO
* Con_Nombre
* Fecha de Creacion: Mayo 17
* UQ_CON_NOMBRE
*/

ALTER TABLE CONCURSO ADD CONSTRAINT UQ_CON_NOMBRE UNIQUE (Con_Nombre);

/*
* PRESENTACION
* Pre_ID
* Fecha de Creacion: Mayo 16
* UQ_PRE_ID
*/

ALTER TABLE PRESENTACION ADD CONSTRAINT UQ_PRE_ID UNIQUE (Pre_ID);

/*
* VINEDO
* Vin_ID
* Fecha de Creacion: Mayo 16
* UQ_Vin_ID
*/

ALTER TABLE VINEDO ADD CONSTRAINT UQ_VIN_ID UNIQUE (Vin_ID);

/*----------------------------------- CONSTRAINT CHECK ------------------------------*/

/*
* COMIDA
* Com_Tipo
* Fecha de Creacion: Mayo 17
* CH_COM_TIPO
*/

ALTER TABLE COMIDA ADD CONSTRAINT CH_COM_TIPO CHECK (Com_Tipo IN ('ENTRADA', 'POSTRE', 'PRINCIPAL'));

/*
* CONCURSO
* Con_Nivel
* Fecha de Creacion: Mayo 17
* CH_CON_NIVEL
*/

ALTER TABLE CONCURSO ADD CONSTRAINT CH_CON_NIVEL CHECK (Con_Nivel IN ('NACIONAL', 'INTERNACIONAL'));

/*
* CONCURSO
* Con_Tipo
* Fecha de Creacion: Mayo 17
* CH_CON_TIPO
*/

ALTER TABLE CONCURSO ADD CONSTRAINT CH_CON_TIPO CHECK (Con_Tipo IN ('VINO', 'CATADOR'));

/*
* CONSUMIDOR
* Con_Genero
* Fecha de Creacion: Mayo 17
* CH_CON_GENERO
*/

ALTER TABLE CONSUMIDOR ADD CONSTRAINT CH_CON_GENERO CHECK (Con_Genero IN ('M', 'F'));

/*
* COSECHA
* Cos_Evaluacion
* Fecha de Creacion: Mayo 17
* CH_COS_EVALUACION
*/

ALTER TABLE COSECHA ADD CONSTRAINT CH_COS_EVALUACION CHECK (Cos_Evaluacion IN ('E','MB', 'B', 'R','D'));

/*
* ESCALA
* Esc_Tipo
* Fecha de Creacion: Mayo 17
* CH_ESC_TIPO
*/

ALTER TABLE ESCALA ADD CONSTRAINT CH_ESC_TIPO CHECK (Esc_Tipo IN ('VINO', 'CATADOR'));

/*
* LUGAR
* Lug_Tipo
* Fecha de Creacion: Mayo 17
* CH_LUG_TIPO
*/

ALTER TABLE LUGAR ADD CONSTRAINT CH_LUG_CONTINENTE CHECK (Lug_Tipo IN ('PAIS', 'CIUDAD'));


/*
* LUGAR
* Lug_Continente
* Fecha de Creacion: Mayo 17
* CH_LUG_CONTINENTE
*/

ALTER TABLE LUGAR ADD CONSTRAINT CH_LUG_CONTINENTE CHECK (Lug_Continente IN ('AMERICA','ASIA','OCEANIA','EUROPA','AFRICA'));


/*
* MARCA
* Mar_Tipo_Tapa
* Fecha de Creacion: Mayo 17
* CH_MAR_TIPO_TAPA
*/

ALTER TABLE MARCA ADD CONSTRAINT CH_MAR_TIPO_TAPA CHECK (Mar_Tipo_Tapa IN ('CORCHO', 'PLASTICO'));


/*
* PAIS
* Pai_Continente
* Fecha de Creacion: Mayo 16
* CH_PAI_CONTINENTE
*/

ALTER TABLE PAIS ADD CONSTRAINT CH_PAI_CONTINENTE CHECK (Pai_Continente IN ('AMERICA','ASIA','OCEANIA','EUROPA','AFRICA'));

/*
* PRESENTACION
* Pre_Tipo
* Fecha de Creacion: Mayo 16
* CH_PRE_TIPO
*/

ALTER TABLE PRESENTACION ADD CONSTRAINT CH_PRE_TIPO CHECK (Pre_Tipo IN ('BOTELLA','CAJA_CARTON','CAJA_MADERA'));

/*
* VARIEDAD
* Var_Tipo
* Fecha de Creacion: Mayo 16
* CH_VAR_TIPO_UVA
*/

ALTER TABLE VARIEDAD ADD CONSTRAINT CH_VAR_TIPO_UVA CHECK (Var_Tipo_Uva IN ('BLANCA', 'TINTA'));

/*----------------------------------- CONSTRAINT PRIMARY KEY ------------------------*/

/*
* CATA_VINO
* CV_ID
* Fecha de Creacion: May 17
* PK_CATA_VINO
*/

ALTER TABLE CATA_VINO ADD CONSTRAINT PK_CATA_VINO PRIMARY KEY (CV_ID);

/*
* CATA_PARTICIPANTE
* CP_ID
* Fecha de Creacion: May 17
* PK_CATA_PARTICIPANTE
*/

ALTER TABLE CATA_PARTICIPANTE ADD CONSTRAINT PK_CATA_PARTICIPANTE PRIMARY KEY (CP_ID);

/*
* CLASIFICACION
* Cla_ID
* Fecha de Creacion: May 17
* PK_CLASIFICACION
*/

ALTER TABLE CLASIFICACION ADD CONSTRAINT PK_CLASIFICACION PRIMARY KEY (Cla_ID);

/*
* COMIDA
* Com_ID
* Fecha de Creacion: May 17
* PK_COMIDA
*/

ALTER TABLE COMIDA ADD CONSTRAINT PK_COMIDA PRIMARY KEY (Com_ID);

/*
* COMPOSICION
* FK_Vinedo, FK_Pais, FK_Bodega, FK_Region, FK_Variedad, FK_Denominacion
* Fecha de Creacion: May 17
* PK_COMPOSICION
*/

ALTER TABLE COMPOSICION ADD CONSTRAINT PK_COMPOSICION PRIMARY KEY (FK_Vinedo, FK_Pais, FK_Bodega, FK_Region, FK_Variedad, FK_Denominacion);

/*
* CONCURSO
* Con_ID
* Fecha de Creacion: May 17
* PK_CONCURSO
*/

ALTER TABLE CONCURSO ADD CONSTRAINT PK_CONCURSO PRIMARY KEY (Con_ID);

/*
* CONSUMIDOR
* Con_ID
* Fecha de Creacion: May 17
* PK_CONSUMIDOR
*/

ALTER TABLE CONSUMIDOR ADD CONSTRAINT PK_CONSUMIDOR PRIMARY KEY (Con_ID);

/*
* COSECHA
* Cos_ID
* Fecha de Creacion: May 17
* PK_COSECHA
*/

ALTER TABLE COSECHA ADD CONSTRAINT PK_COSECHA PRIMARY KEY (Cos_ID);

/*
* DENOMINACION
* Den_ID
* Fecha de Creacion: May 17
* PK_DENOMINACION
*/

ALTER TABLE DENOMINACION ADD CONSTRAINT PK_DENOMINACION PRIMARY KEY (Den_ID);

/*
* DEN_VAR
* FK_Denominacion, FK_Variedad, FK_Clasificacion
* Fecha de Creacion: May 17
* PK_DEN_VAR
*/

ALTER TABLE DEN_VAR ADD CONSTRAINT PK_DEN_VAR PRIMARY KEY (FK_Denominacion, FK_Variedad, FK_Clasificacion);

/*
* DV_PR_V
* FK_Region, FK_Pais, FK_Vinedo, FK_Denominacion, FK_Variedad
* Fecha de Creacion: May 17
* PK_DV_PR_V
*/

ALTER TABLE DV_PR_V ADD CONSTRAINT PK_DV_PR_V PRIMARY KEY (FK_Region, FK_Pais, FK_Vinedo, FK_Denominacion, FK_Variedad);

/*
* ESCALA
* Esc_ID
* Fecha de Creacion: May 17
* PK_ESCALA
*/

ALTER TABLE ESCALA ADD CONSTRAINT PK_ESCALA PRIMARY KEY (Esc_ID);

/*
* ESPECIALISTA
* FK_Region, FK_Catador_Consultor
* Fecha de Creacion: May 17
* PK_ESPECIALISTA
*/

ALTER TABLE ESPECIALISTA ADD CONSTRAINT PK_ESPECIALISTA PRIMARY KEY (FK_Region, FK_Catador_Consultor);

/*
* HIS_PRESENTACION
* HP_Ano, FK_Presentacion, FK_Marca
* Fecha de Creacion: May 17
* PK_HIS_PRESENTACION
*/

ALTER TABLE HIS_PRESENTACION ADD CONSTRAINT PK_HIS_PRESENTACION PRIMARY KEY (HP_Ano, FK_Presentacion, FK_Marca);

/*
* INSCRIPCION_VINO
* IV_ID, FK_Calendario
* Fecha de Creacion: May 17
* PK_INSCRIPCION_VINO
*/

ALTER TABLE INSCRIPCION_VINO ADD CONSTRAINT PK_INSCRIPCION_VINO PRIMARY KEY (IV_ID, FK_Calendario);

/*
* JUEZ
* FK_Catador_Consultor, FK_Calendario
* Fecha de Creacion: May 17
* PK_JUEZ
*/

ALTER TABLE JUEZ ADD CONSTRAINT PK_JUEZ PRIMARY KEY (FK_Catador_Consultor, FK_Calendario);

/*
* LUGAR
* Lug_ID
* Fecha de Creacion: May 17
* PK_LUGAR
*/

ALTER TABLE LUGAR ADD CONSTRAINT PK_LUGAR PRIMARY KEY (Lug_ID);

/*
* MARCA
* MAR_ID
* Fecha de Creacion: May 17
* PK_MARCA
*/

ALTER TABLE MARCA ADD CONSTRAINT PK_MARCA PRIMARY KEY (Mar_ID);

/*
* MARIDAJE
* FK_Comida, FK_Marca
* Fecha de Creacion: May 17
* PK_MARIDAJE
*/

ALTER TABLE MARIDAJE ADD CONSTRAINT PK_MARIDAJE PRIMARY KEY (FK_Comida, FK_Marca);

/*
* MUESTRA
* Mue_ID, FK_Marca
* Fecha de Creacion: May 17
* PK_MUESTRA
*/

ALTER TABLE MUESTRA ADD CONSTRAINT PK_MUESTRA PRIMARY KEY (Mue_ID, FK_Marca);

/*
* OREV
* Ore_ID
* Fecha de Creacion: May 16
* PK_OREV
*/

ALTER TABLE OREV ADD CONSTRAINT PK_OREV PRIMARY KEY (Ore_ID);

/*
* ORE_CON
* FK_OREV , FK_Concurso
* Fecha de Creacion: May 16
* PK_ORE_CON
*/

ALTER TABLE ORE_CON ADD CONSTRAINT PK_ORE_CON PRIMARY KEY (FK_OREV, FK_Concurso);

/*
* PAIS
* Pai_ID
* Fecha de Creacion: May 16
* PK_PAIS
*/

ALTER TABLE PAIS ADD CONSTRAINT PK_PAIS PRIMARY KEY (Pai_ID);

/*
* PAI_REG
* FK_Pais, FK_Region
* Fecha de Creacion: May 16
* PK_PAI_REG
*/

ALTER TABLE PAI_REG ADD CONSTRAINT PK_PAI_REG PRIMARY KEY (FK_Pais, FK_Region);

/*
* PRESENTACION
* Pre_ID, FK_Marca
* Fecha de Creacion: May 16
* PK_PRESENTACION
*/

ALTER TABLE PRESENTACION ADD CONSTRAINT PK_PRESENTACION PRIMARY KEY (Pre_ID, FK_Marca);

/*
* PRODUCTOR
* Pro_ID
* Fecha de Creacion: May 16
* PK_PRODUCTOR
*/

ALTER TABLE PRODUCTOR ADD CONSTRAINT PK_PRODUCTOR PRIMARY KEY (Pro_ID);

/*
* PRO_MAR
* PM_Ano
* Fecha de Creacion: May 16
* PK_PRO_MAR
*/

ALTER TABLE PRO_MAR ADD CONSTRAINT PK_PRO_MAR PRIMARY KEY (PM_Ano);

/*
* REGION
* Reg_ID
* Fecha de Creacion: May 16
* PK_REGION
*/

ALTER TABLE REGION ADD CONSTRAINT PK_REGION PRIMARY KEY (Reg_ID);

/*
* SOLICITUD
* Sol_ID
* Fecha de Creacion: May 16
* PK_SOLICITUD
*/

ALTER TABLE SOLICITUD ADD CONSTRAINT PK_SOLICITUD PRIMARY KEY (Sol_ID);

/*
* VARIEDAD
* Var_ID
* Fecha de Creacion: May 16
* PK_VARIEDAD
*/

ALTER TABLE VARIEDAD ADD CONSTRAINT PK_VARIEDAD PRIMARY KEY (Var_ID);

/*
* VINEDO
* Vin_ID, FK_Pais, FK_Bodega, FK_Region, FK_Variedad, FK_Denominacion
* Fecha de Creacion: May 16
* PK_VINEDO
*/

ALTER TABLE VINEDO ADD CONSTRAINT PK_VINEDO PRIMARY KEY (Vin_ID, FK_Pais, FK_Bodega, FK_Region, FK_Variedad, FK_Denominacion);

/*
* VISITA
* Vis_Fecha, FK_Bodega, FK_solicitud
* Fecha de Creacion: May 16
* PK_VISISTA
*/

ALTER TABLE VISITA ADD CONSTRAINT PK_VISITA PRIMARY KEY (Vis_Fecha, FK_Bodega, FK_Solicitud);


/*----------------------------------- CONSTRAINT FOREING KEY -------------------------*/

/*
* MUESTRA -> CATA_VINO
* CATA_VINO
* FK_Muestra
* Fecha de Creacion: May 17
* FK_MUESTRA_CATA_VINO
*/

ALTER TABLE CATA_VINO ADD CONSTRAINT FK_MUESTRA_CATA_VINO FOREING KEY (FK_MUESTRA) REFERENCES MUESTRA (Mue_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* JUEZ -> CATA_VINO
* CATA_VINO
* FK_Juez
* Fecha de Creacion: May 17
* FK_JUEZ_CATA_VINO
*/

ALTER TABLE CATA_VINO ADD CONSTRAINT FK_JUEZ_CATA_VINO FOREING KEY (FK_JUEZ) REFERENCES JUEZ (FK_Catador_Consultor, FK_Calendario) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* INSCRIPCION -> CATA_PARTICIPANTE
* CATA_PARTICIPANTE
* FK_Cata_Experta
* Fecha de Creacion: May 17
* FK_CATA_INSCRIPCION_CATA_PARTICIPANTE
*/

ALTER TABLE CATA_PARTICIPANTE ADD CONSTRAINT FK_INSCRIPCION_CATA_PARTICIPANTE FOREING KEY (FK_Inscripcion) REFERENCES INSCRIPCION_VINO (IV_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* CALENDARIO -> CATA_PARTICIPANTE
* CATA_PARTICIPANTE
* FK_Calendario
* Fecha de Creacion: May 17
* FK_CATA_CALENDARIO_CATA_PARTICIPANTE
*/

ALTER TABLE CATA_PARTICIPANTE ADD CONSTRAINT FK_CALENDARIO_CATA_PARTICIPANTE FOREING KEY (FK_Calendario) REFERENCES CALENDARIO (Cal_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* CATA_EXPERTA -> CATA_PARTICIPANTE
* CATA_PARTICIPANTE
* FK_Cata_Experta
* Fecha de Creacion: May 17
* FK_CATA_EXPERTA_CATA_PARTICIPANTE
*/

ALTER TABLE CATA_PARTICIPANTE ADD CONSTRAINT FK_CATA_EXPERTA_CATA_PARTICIPANTE FOREING KEY (FK_Cata_Experta) REFERENCES CATA_EXPERTA (CE_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* CLASIFICACION->CLASIFICACION
* CLASIFICACION
* FK_Clasificacion
* Fecha de Creacion: May 17
* FK_CLASIFICACION_CLASIFICACION
*/

ALTER TABLE CLASIFICACION ADD CONSTRAINT FK_CLASIFICACION_CLASIFICACION FOREING KEY (FK_Clasificacion) REFERENCES CLASIFICACION (Cla_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* DENOMINACION -> COMPOSICION
* COMPOSICION
* FK_Denominacion
* Fecha de Creacion: May 17
* FK_DENOMINACION_COMPOSICION
*/

ALTER TABLE COMPOSICION ADD CONSTRAINT FK_DENOMINACION_COMPOSICION FOREING KEY (FK_Denominacion) REFERENCES DENOMINACION (Den_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* VARIEDAD -> COMPOSICION
* COMPOSICION
* FK_Variedad
* Fecha de Creacion: May 17
* FK_VARIEDAD_COMPOSICION
*/

ALTER TABLE COMPOSICION ADD CONSTRAINT FK_VARIEDAD_COMPOSICION FOREING KEY (FK_Variedad) REFERENCES VARIEDAD (Var_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* REGION -> COMPOSICION
* COMPOSICION
* FK_Region
* Fecha de Creacion: May 17
* FK_REGION_COMPOSICION
*/

ALTER TABLE COMPOSICION ADD CONSTRAINT FK_REGION_COMPOSICION FOREING KEY (FK_Region) REFERENCES REGION (Reg_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* BODEGA -> COMPOSICION
* COMPOSICION
* FK_Bodega
* Fecha de Creacion: May 17
* FK_BODEGA_COMPOSICION
*/

ALTER TABLE COMPOSICION ADD CONSTRAINT FK_BODEGA_COMPOSICION FOREING KEY (FK_Bodega) REFERENCES BODEGA (Bod_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* PAIS -> COMPOSICION
* COMPOSICION
* FK_Pais
* Fecha de Creacion: May 17
* FK_PAIS_COMPOSICION
*/

ALTER TABLE COMPOSICION ADD CONSTRAINT FK_PAIS_COMPOSICION FOREING KEY (FK_PAIS) REFERENCES PAIS (Pai_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* VINEDO -> COMPOSICION
* COMPOSICION
* FK_Vinedo
* Fecha de Creacion: May 17
* FK_VINEDO_COMPOSICION
*/

ALTER TABLE COMPOSICION ADD CONSTRAINT FK_VINEDO_COMPOSICION FOREING KEY (FK_Vinedo) REFERENCES VINEDO (Vin_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* ESCALA -> CONCURSO
* CONCURSO
* FK_Escala
* Fecha de Creacion: May 17
* FK_ESCALA_CONCURSO
*/

ALTER TABLE CONCURSO ADD CONSTRAINT FK_ESCALA_CONCURSO FOREING KEY (FK_Escala) REFERENCES ESCALA (Esc_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* LUGAR -> CONSUMIDOR
* CONSUMIDOR
* FK_Consumidor
* Fecha de Creacion: May 17
* FK_LUGAR_CONSUMIDOR
*/

ALTER TABLE CONSUMIDOR ADD CONSTRAINT FK_LUGAR_CONSUMIDOR FOREING KEY (FK_Lugar) REFERENCES LUGAR (Lug_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* DENOMINACION -> COSECHA
* COSECHA
* FK_DENOMINACION
* Fecha de Creacion: May 17
* FK_DENOMINACION_COSECHA
*/

ALTER TABLE COSECHA ADD CONSTRAINT FK_DENOMINACION_COSECHA FOREING KEY (FK_Denominacion) REFERENCES DENOMINACION (Den_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* VARIEDAD -> COSECHA
* COSECHA
* FK_Variedad
* Fecha de Creacion: May 17
* FK_VARIEDAD_COSECHA
*/

ALTER TABLE COSECHA ADD CONSTRAINT FK_VARIEDAD_COSECHA FOREING KEY (FK_Variedad) REFERENCES VARIEDAD (Var_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* REGION -> COSECHA
* COSECHA
* FK_Region
* Fecha de Creacion: May 17
* FK_REGION_COSECHA
*/

ALTER TABLE COSECHA ADD CONSTRAINT FK_REGION_COSECHA FOREING KEY (FK_Region) REFERENCES REGION (Reg_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* PAIS -> COSECHA
* COSECHA
* FK_Pais
* Fecha de Creacion: May 17
* FK_PAIS_COSECHA
*/

ALTER TABLE COSECHA ADD CONSTRAINT FK_PAIS_COSECHA FOREING KEY (FK_Pais) REFERENCES PAIS (Pai_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* BODEGA -> COSECHA
* COSECHA
* FK_BODEGA
* Fecha de Creacion: May 17
* FK_BODEGA_COSECHA
*/

ALTER TABLE COSECHA ADD CONSTRAINT FK_BODEGA_COSECHA FOREING KEY (FK_Bodega) REFERENCES BODEGA (Bod_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* VINEDO -> COSECHA
* COSECHA
* FK_VINEDO
* Fecha de Creacion: May 17
* FK_VINEDO_COSECHA
*/

ALTER TABLE COSECHA ADD CONSTRAINT FK_VINEDO_COSECHA FOREING KEY (FK_Vinedo) REFERENCES VINEDO (Vin_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* CLASIFICACION -> DEN_VAR
* DEN_VAR
* FK_Denominacion
* Fecha de Creacion: May 17
* FK_CLASIFICACION_DEN_VAR
*/

ALTER TABLE DEN_VAR ADD CONSTRAINT FK_CLASIFICACION_DEN_VAR FOREING KEY (FK_Clasificacion) REFERENCES CLASIFICACION (Cla_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* VARIEDAD -> DEN_VAR
* DEN_VAR
* FK_Variedad
* Fecha de Creacion: May 17
* FK_VARIEDAD_DEN_VAR
*/

ALTER TABLE DEN_VAR ADD CONSTRAINT FK_VARIEDAD_DEN_VAR FOREING KEY (FK_Variedad) REFERENCES VARIEDAD (Var_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* DENOMINACION -> DEN_VAR
* DEN_VAR
* FK_Denominacion
* Fecha de Creacion: May 17
* FK_DENOMINACION_DEN_VAR
*/

ALTER TABLE DEN_VAR ADD CONSTRAINT FK_DENOMINACION_DEN_VAR FOREING KEY (FK_Denominacion) REFERENCES DENOMINACION (Den_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* VARIEDAD -> DV_PR_V
* DV_PR_V
* FK_Variedad
* Fecha de Creacion: May 17
* FK_VARIEDAD_DV_PR_V
*/

ALTER TABLE DV_PR_V ADD CONSTRAINT FK_VARIEDAD_DV_PR_V FOREING KEY (FK_Variedad) REFERENCES VARIEDAD (Var_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* DENOMINACION -> DV_PR_V
* DV_PR_V
* FK_Denominacion
* Fecha de Creacion: May 17
* FK_DENOMINACION_DV_PR_V
*/

ALTER TABLE DV_PR_V ADD CONSTRAINT FK_DENOMINACION_DV_PR_V FOREING KEY (FK_Denominacion) REFERENCES DENOMINACION (Den_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* VINEDO -> DV_PR_V
* DV_PR_V
* FK_VINEDO
* Fecha de Creacion: May 17
* FK_VINEDO_DV_PR_V
*/

ALTER TABLE DV_PR_V ADD CONSTRAINT FK_VINEDO_DV_PR_V FOREING KEY (FK_VINEDO) REFERENCES VINEDO (Vin_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* PAIS -> DV_PR_V
* DV_PR_V
* FK_PAIS
* Fecha de Creacion: May 17
* FK_PAIS_DV_PR_V
*/

ALTER TABLE DV_PR_V ADD CONSTRAINT FK_PAIS_DV_PR_V FOREING KEY (FK_Pais) REFERENCES PAIS (Pai_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* REGION -> DV_PR_V
* DV_PR_V
* FK_Region
* Fecha de Creacion: May 17
* FK_REGION_DV_PR_V
*/

ALTER TABLE DV_PR_V ADD CONSTRAINT FK_REGION_DV_PR_V FOREING KEY (FK_Region) REFERENCES REGION (Reg_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* CATADOR_CONSULTOR-> ESPECIALISTA
* ESPECIALISTA
* FK_Catador_Consultor
* Fecha de Creacion: May 17
* FK_CATADOR_CONSULTOR_ESPECIALISTA
*/

ALTER TABLE ESPECIALISTA ADD CONSTRAINT FK_CATADOR_CONSULTOR_ESPECIALISTA FOREING KEY (FK_Catador_Consultor) REFERENCES CATADOR_CONSULTOR (CC_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* REGION -> ESPECIALISTA
* ESPECIALISTA
* FK_Region
* Fecha de Creacion: May 17
* FK_REGION_ESPECIALISTA
*/

ALTER TABLE ESPECIALISTA ADD CONSTRAINT FK_REGION_ESPECIALISTA FOREING KEY (FK_Region) REFERENCES REGION (Reg_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* MARCA -> HIS_PRESENTACION
* HIS_PRESENTACION
* FK_Marca
* Fecha de Creacion: May 17
* FK_MARCA_HIS_PRESENTACION
*/

ALTER TABLE HIS_PRESENTACION ADD CONSTRAINT FK_MARCA_HIS_PRESENTACION FOREING KEY (FK_Marca) REFERENCES MARCA (Mar_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* PRESENTACION -> HIS_PRESENTACION
* HIS_PRESENTACION
* FK_Presentacion
* Fecha de Creacion: May 17
* FK_PRESENTACION_HIS_PRESENTACION
*/

ALTER TABLE HIS_PRESENTACION ADD CONSTRAINT FK_PRESENTACION_HIS_PRESENTACION FOREING KEY (FK_Presentacion) REFERENCES PRESENTACION (Pre_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* CALENDARIO -> INSCRIPCION_VINO
* INSCRIPCION_VINO
* FK_Calendario
* Fecha de Creacion: May 17
* FK_CALENDARIO_INSCRIPCION_VINO
*/

ALTER TABLE INSCRIPCION_VINO ADD CONSTRAINT FK_CALENDARIO_INSCRIPCION_VINO FOREING KEY (FK_Calendario) REFERENCES CALENDARIO (Cal_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* CATADOR_CONSULTOR -> INSCRIPCION_VINO
* INSCRIPCION_VINO
* FK_Catador_Consultor
* Fecha de Creacion: May 17
* FK_CATADOR_CONSULTOR_INSCRIPCION_VINO
*/

ALTER TABLE INSCRIPCION_VINO ADD CONSTRAINT FK_CATADOR_CONSULTOR_INSCRIPCION_VINO FOREING KEY (FK_Catador_Consultor) REFERENCES CATADOR_CONSULTOR (CC_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* BODEGA -> INSCRIPCION_VINO
* INSCRIPCION_VINO
* FK_Bodega
* Fecha de Creacion: May 17
* FK_BODEGA_INSCRIPCION_VINO
*/

ALTER TABLE INSCRIPCION_VINO ADD CONSTRAINT FK_BODEGA_INSCRIPCION_VINO FOREING KEY (FK_Bodega) REFERENCES BODEGA (Bod_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* CALENDARIO -> JUEZ
* JUEZ
* FK_Calendario
* Fecha de Creacion: May 17
* FK_CALENDARIO_JUEZ
*/

ALTER TABLE JUEZ ADD CONSTRAINT FK_CALENDARIO_JUEZ FOREING KEY (FK_Calendario) REFERENCES CALENDARIO (Cal_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* CATADOR_CONSULTOR -> JUEZ
* JUEZ
* FK_CATADOR_CONSULTOR
* Fecha de Creacion: May 17
* FK_CATADOR_CONSULTOR_JUEZ
*/

ALTER TABLE JUEZ ADD CONSTRAINT FK_CATADOR_CONSULTOR_JUEZ FOREING KEY (FK_Catador_Consultor) REFERENCES CATADOR_CONSULTOR (CC_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* LUGAR -> LUGAR
* LUGAR
* FK_Lugar
* Fecha de Creacion: May 17
* FK_LUGAR_LUGAR
*/

ALTER TABLE LUGAR ADD CONSTRAINT FK_LUGAR_LUGAR FOREING KEY (FK_Lugar) REFERENCES LUGAR (Lug_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* BODEGA -> MARCA
* MARCA
* FK_Bodega
* Fecha de Creacion: May 17
* FK_BODEGA_MARCA
*/

ALTER TABLE MARCA ADD CONSTRAINT FK_BODEGA_MARCA FOREING KEY (FK_Bodega) REFERENCES BODEGA (Bod_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* CLASIFICACION -> MARCA
* MARCA
* FK_Clasificacion
* Fecha de Creacion: May 17
* FK_CLASIFICACION_MARCA
*/

ALTER TABLE MARCA ADD CONSTRAINT FK_CLASIFICACION_MARCA FOREING KEY (FK_Clasificacion) REFERENCES CLASIFICACION (Cla_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* MARCA -> MARIDAJE
* MARIDAJE
* FK_Comida
* Fecha de Creacion: May 17
* FK_MARCA_MARIDAJE
*/

ALTER TABLE MARIDAJE ADD CONSTRAINT FK_MARCA_MARIDAJE FOREING KEY (FK_Marca) REFERENCES MARCA (Mar_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* COMIDA -> MARIDAJE
* MARIDAJE
* FK_Comida
* Fecha de Creacion: May 17
* FK_COMIDA_MARIDAJE
*/

ALTER TABLE MARIDAJE ADD CONSTRAINT FK_COMIDA_MARIDAJE FOREING KEY (FK_Comida) REFERENCES COMIDA (Com_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* MARCA -> MUESTRA
* MUESTRA
* FK_Marca
* Fecha de Creacion: May 17
* FK_MARCA_MUESTRA
*/

ALTER TABLE MUESTRA ADD CONSTRAINT FK_MARCA_MUESTRA FOREING KEY (FK_Marca) REFERENCES MARCA (Mar_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* REGION -> OREV
* OREV
* FK_Region
* Fecha de Creacion: May 16
* FK_REGION_OREV
*/

ALTER TABLE OREV ADD CONSTRAINT FK_REGION_OREV FOREING KEY (FK_Region) REFERENCES REGION (Reg_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* CONCURSO -> ORE_CON
* ORE_CON
* FK_Concurso
* Fecha de Creacion: May 16
* FK_CONCURSO_ORE_CON
*/

ALTER TABLE ORE_CON ADD CONSTRAINT FK_CONCURSO_ORE_CON FOREING KEY (FK_Concurso) REFERENCES CONCURSO (Con_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* OREV -> ORE_CON
* ORE_CON
* FK_OREV
* Fecha de Creacion: May 16
* FK_OREV_ORE_CON
*/

ALTER TABLE ORE_CON ADD CONSTRAINT FK_OREV_ORE_CON FOREING KEY (FK_OREV) REFERENCES OREV (Ore_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* REGION -> PAI_REG
* PAI_REG
* FK_Region
* Fecha de Creacion: May 16
* FK_REGION_PAI_REG
*/

ALTER TABLE PAI_REG ADD CONSTRAINT FK_REGION_PAI_REG FOREING KEY (FK_Region) REFERENCES REGION (Reg_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* PAIS -> PAI_REG
* PAI_REG
* FK_Pais
* Fecha de Creacion: May 16
* FK_PAIS_PAI_REG
*/

ALTER TABLE PAI_REG ADD CONSTRAINT FK_PAIS_PAI_REG FOREING KEY (FK_Pais) REFERENCES PAIS (Pai_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* MARCA -> PRESENTACION
* PRESENTACION
* FK_Marca
* Fecha de Creacion: May 16
* FK_MARCA_PRESENTACION
*/

ALTER TABLE PRESENTACION ADD CONSTRAINT FK_MARCA_PRESENTACION FOREING KEY (FK_Marca) REFERENCES MARCA (Mar_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* MARCA -> PRO_MAR
* PRO_MAR
* FK_Marca
* Fecha de Creacion: May 16
* FK_MARCA_PRO_MAR
*/

ALTER TABLE PRO_MAR ADD CONSTRAINT FK_MARCA_PRO_MAR FOREING KEY (FK_Marca) REFERENCES MARCA (Mar_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* REGION -> REGION
* REGION
* FK_Region
* Fecha de Creacion: May 16
* FK_REGION_REGION
*/

ALTER TABLE REGION ADD CONSTRAINT FK_REGION_REGION FOREING KEY (FK_Region) REFERENCES REGION (Reg_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* COMIDA -> SOLICITUD
* SOLICITUD
* FK_Comida
* Fecha de Creacion: May 16
* FK_COMIDA_SOLICITUD
*/

ALTER TABLE SOLICITUD ADD CONSTRAINT FK_COMIDA_SOLICITUD FOREING KEY (FK_Comida) REFERENCES COMIDA (Com_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* CONSUMIDOR -> SOLICITUD
* SOLICITUD
* FK_Consumidor
* Fecha de Creacion: May 16
* FK_CONSUMIDOR_SOLICITUD
*/

ALTER TABLE SOLICITUD ADD CONSTRAINT FK_CONSUMIDOR_SOLICITUD FOREING KEY (FK_Consumidor) REFERENCES CONSUMIDOR (Con_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* CATADOR_CONSULTOR -> SOLICITUD
* SOLICITUD
* FK_CATADOR_CONSULTOR
* Fecha de Creacion: May 16
* FK_CATADOR_CONSULTOR_SOLICITUD
*/

ALTER TABLE SOLICITUD ADD CONSTRAINT FK_CATADOR_CONSULTOR_SOLICITUD FOREING KEY (FK_Catador_Consultor) REFERENCES CATADOR_CONSULTOR (CC_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* BODEGA -> VISITA
* VISITA
* FK_Bodega
* Fecha de Creacion: May 16
* FK_BODEGA_VISITA
*/

ALTER TABLE VISITA ADD CONSTRAINT FK_BODEGA_VISITA FOREING KEY (FK_Bodega) REFERENCES BODEGA (Bod_ID) ON DELETE SET NULL ON UPDATE CASCADE; 

/*
* PAIS -> VINEDO
* VINEDO
* FK_Pais
* Fecha de Creacion: May 16
* FK_PAIS_VINEDO
*/

ALTER TABLE VINEDO ADD CONSTRAINT FK_PAIS_VINEDO FOREING KEY (FK_Pais) REFERENCES PAIS (Pai_ID) ON DELETE SET NULL ON UPDATE CASCADE;

/*
* BODEGA -> VINEDO
* VINEDO
* FK_Bodega
* Fecha de Creacion: May 16
* FK_BODEGA_VINEDO
*/

ALTER TABLE VINEDO ADD CONSTRAINT FK_BODEGA_VINEDO FOREING KEY (FK_Bodega) REFERENCES BODEGA (Bod_ID) ON DELETE SET NULL ON UPDATE CASCADE;

/*
* REGION -> VINEDO
* VINEDO
* FK_Region
* Fecha de Creacion: May 16
* FK_REGION_VINEDO
*/

ALTER TABLE VINEDO ADD CONSTRAINT FK_REGION_VINEDO FOREING KEY (FK_Region) REFERENCES REGION (Reg_ID) ON DELETE SET NULL ON UPDATE CASCADE;

/*
* VARIEDAD -> VINEDO
* VINEDO
* FK_Variedad
* Fecha de Creacion: May 16
* FK_VARIEDAD_VINEDO
*/

ALTER TABLE VINEDO ADD CONSTRAINT FK_VARIEDAD_VINEDO FOREING KEY (FK_Variedad) REFERENCES VARIEDAD (Var_ID) ON DELETE SET NULL ON UPDATE CASCADE;

/*
* DENOMINACION -> VINEDO
* VINEDO
* FK_Denominacion
* Fecha de Creacion: May 16
* FK_DENOMINACION_VINEDO
*/

ALTER TABLE VINEDO ADD CONSTRAINT FK_DENOMINACION_VINEDO FOREING KEY (FK_Denominacion) REFERENCES DENOMINACION (Den_ID) ON DELETE SET NULL ON UPDATE CASCADE;

/*
* SOLICITUD -> VISITA
* VISITA
* FK_Solicitud
* Fecha de Creacion: May 16
* FK_SOLICITUD_VISITA
*/

ALTER TABLE VISITA ADD CONSTRAINT FK_SOLICITUD_VISITA FOREING KEY (FK_Solicitud) REFERENCES SOLICITUD (Sol_ID) ON DELETE SET NULL ON UPDATE CASCADE;
