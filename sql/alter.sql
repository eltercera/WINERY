ALTER TABLE <NombreTable> ADD CONSTRAINT <NombreConstraint> PRIMARY KEY (<NombreAtributo>);

PK_NombreTabla
FK_NombreTablaInd_NombreTablaDep.
UQ_NombreAtributo
CH_NombreAtributo


/*
* BODEGA
* Bod_ID
* Fecha de Creacion: Mayo 16
*/

ALTER TABLE BODEGA ADD CONSTRAINT PK_Bodega PRIMARY KEY Bod_ID;

/*
* BODEGA
* Bod_ID
* Fecha de Creacion: Mayo 16
*/

ALTER TABLE BODEGA ADD CONSTRAINT UQ_Bod_ID UNIQUE Bod_ID;

/*
* PAIS -> BODEGA
* BODEGA
* FK_Pais
* Fecha de Creacion: Mayo 16
*/

ALTER TABLE BODEGA ADD CONSTRAINT FK_Pais_Bodega FOREIGN KEY FK_Pais REFERENCES PAIS (Pais_ID);

/*
* BODEGA -> BODEGA
* BODEGA
* FK_Bodega
* Fecha de Creacion: Mayo 16
*/

ALTER TABLE BODEGA ADD CONSTRAINT FK_Bodega_Bodega FOREIGN KEY FK_Bodega REFERENCES BODEGA (Bod_ID);

/*
* PRODUCTOR -> BODEGA
* BODEGA
* FK_Productor
* Fecha de Creacion: Mayo 16
*/

ALTER TABLE BODEGA ADD CONSTRAINT FK_Productor_Bodega FOREIGN KEY FK_Productor REFERENCES PRODUCTOR (Pro_ID);



ALTER TABLE CALENDARIO ADD CONSTRAINT PK_Bodega PRIMARY KEY Cal_ID;



ALTER TABLE CALENDARIO ADD CONSTRAINT UQ_Cal_ID UNIQUE Cal_ID;



ALTER TABLE CALENDARIO ADD CONSTRAINT FK_Concurso_Calendario FOREIGN KEY FK_Concurso REFERENCES CONCURSO (Con_ID);



ALTER TABLE CATADOR_CONSULTOR ADD CONSTRAINT PK_Catador_Consultor PRIMARY KEY CC_ID;



ALTER TABLE CATADOR_CONSULTOR ADD CONSTRAINT CH_CC_Nivel CHECK CC_Nivel IN ('Experto', 'Principiante', 'Intermedio');



ALTER TABLE CATADOR_CONSULTOR ADD CONSTRAINT CH_CC_Genero CHECK CC_Genero IN ('M','F');



ALTER TABLE CATA_EXPERTA ADD CONSTRAINT PK_CE_ID PRIMARY KEY CE_ID;



ALTER TABLE CATA_EXPERTA ADD CONSTRAINT UQ_CE_ID UNIQUE CE_ID;



ALTER TABLE CATA EXPERTA ADD CONSTRAINT FK_Marca_Cata_Experta FOREIGN KEY FK_Marca REFERENCES MARCA (Mar_ID);



ALTER TABLE CATA_EXPERTA ADD CONSTRAINT FK_Juez_Cata_Experta FOREIGN KEY FK_Juez REFERENCES JUEZ (FK_Catador_Consultor);



ALTER TABLE CATA_VINO ADD CONSTRAINT PK_Cata_Vino PRIMARY KEY CV_ID;



ALTER TABLE CATA_VINO ADD CONSTRAINT UQ_CV_ID UNIQUE CV_ID;



ALTER TABLE CATA_VINO ADD CONSTRAINT FK_Juez_Cata_Vino FOREIGN KEY FK_Juez REFERENCES JUEZ (FK_Catador_Consultor);



ALTER TABLE CATA_VINO ADD CONSTRAINT FK_Muestra_Cata_Vino FOREIGN KEY FK_Muestra REFERENCES MUESTRA (Mus_ID);



ALTER TABLE CATA_PARTICIPANTE ADD CONSTRAINT PK_Cata_Participante PRIMARY KEY CP_ID;



ALTER TABLE CATA_PARTICIPANTE ADD CONSTRAINT UQ_CP_ID UNQIUE CP_ID;



ALTER TABLE CATA_PARTICIPANTE ADD CONSTRAINT FK_Cata_Experta_Cata_Participante FOREIGN KEY FK_Cata_Experta REFERENCES CATA_EXPERTA (CE_ID);



ALTER TABLE CATA_PARTICIPANTE ADD CONSTRAINT FK_Calendario_Cata_Participante FOREIGN KEY FK_Calendario REFERENCES CALENDARIO (Cal_ID);



ALTER TABLE CATA_PARTICIPANTE ADD CONSTRAINT FK_Inscripcion_Cata_Participante FOREIGN KEY FK_Inscripcion REFERENCES INSCRIPCION_VINO (IV_ID);



ALTER TABLE CLASIFICACION ADD CONSTRAINT PK_Clasificacion PRIMARY KEY Cla_ID;



ALTER TABLE CLASIFICACION ADD CONSTRAINT UQ_Cla_ID UNIQUE Cla_ID;



ALTER TABLE CLASIFICACION ADD CONSTRAINT FK_Clasificacion_Clasificacion FOREIGN KEY Cla_Clasificacion REFERENCES CLASIFICACION (Cla_ID);



ALTER TABLE COMIDA ADD CONSTRAINT PK_Comida PRIMARY KEY Com_ID;



ALTER TABLE COMIDA ADD CONSTRAINT UQ_Com_ID UNIQUE Com_ID;



ALTER TABLE CONCURSO ADD CONSTRAINT PK_Concurso PRIMARY KEY Con_ID;



ALTER TABLE CONCURSO ADD CONSTRAINT UQ_Con_ID UNIQUE Con_ID;



ALTER TABLE CONCURSO ADD CONSTRAINT UQ_Con_Nombre UNIQUE Con_Nombre;



ALTER TABLE CONCURSO ADD CONSTRAINT UQ_Con_Email UNIQUE Con_Email;



ALTER TABLE CONCURSO ADD CONSTRAINT CH_Con_Tipo CHECK Con_Tipo IN ('Vino','Catador');



ALTER TABLE CONCURSO ADD CONSTRAINT CH_Con_Nivel CHECK Con_Nivel IN ('Nacional','Internacional');



ALTER TABLE CONCURSO ADD CONSTRAINT FK_Escala_Concurso FOREIGN KEY FK_Escala REFERENCES ESCALA (Esc_ID);



ALTER TABLE CONSUMIDOR ADD CONSTRAINT PK_Consumidor PRIMARY KEY Con_ID;



ALTER TABLE CONSUMIDOR ADD CONSTRAINT UQ_Cons_ID UNIQUE Con_ID;



ALTER TABLE CONSUMIDOR ADD CONSTRAINT CH_Con_Genero CHECK Con_Genero IN ('M','F');



ALTER TABLE CONSUMIDOR ADD CONSTRAINT FK_Lugar_Consumidor FOREIGN KEY FK_Lugar REFERENCES LUGAR (Lug_ID);



ALTER TABLE COSECHA ADD CONSTRAINT PK_Cosecha PRIMARY KEY Cos_ID;



ALTER TABLE COSECHA ADD CONSTRAINT UQ_Cos_ID UNIQUE Cos_ID;



ALTER TABLE COSECHA ADD CONSTRAINT FK_Vinedo_Cosecha FOREIGN KEY FK_Vinedo REFERENCES VINEDO (Vin_ID);



ALTER TABLE COSECHA ADD CONSTRAINT FK_Bodega_Cosecha FOREIGN KEY FK_Bodega REFERENCES BODEGA (Bod_ID);



ALTER TABLE COSECHA ADD CONSTRAINT FK_Pais_Cosecha FOREIGN KEY FK_Pais REFERENCES PAIS (Pai_ID);


ALTER TABLE COSECHA ADD CONSTRAINT FK_Region_Cosecha FOREIGN KEY FK_Region REFERENCES REGION (Reg_ID);



ALTER TABLE COSECHA ADD CONSTRAINT FK_Variedad_Cosecha FOREIGN KEY FK_Variedad REFERENCES VARIEDAD (Var_ID);







