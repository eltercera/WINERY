select pai_id as id_pais from pais where upper(pai_nombre) = 'ITALIA' \gset
\lo_import ../imagenes/toscana.gif
insert into region (reg_nombre,reg_ano_creacion,reg_latitud,reg_descripcion_general,reg_mapa,fk_region) values
  (
  'Toscana',
  null,
  medida('°',43,'Latitud norte'),
  des_gen_region(),
  :LASTOID,
  null
  )
  returning reg_id as id_region_p \gset

update region set reg_descripcion_general.altitud = medida('m',322,'Sobre el nivel del mar',564)  where reg_id = :id_region_p;
select add_temperatura(:id_region_p,medida('°C',17.2,' Media Anual',31.1));

select pai_id as id_pais from pais where upper(pai_nombre) = 'ITALIA' \gset
\lo_import ../imagenes/sardegna.jpg
insert into region (reg_nombre,reg_ano_creacion,reg_latitud,reg_descripcion_general,reg_mapa,fk_region) values
  (
  'Sardegna',
  null,
  medida('°',40,'Latitud norte'),
  des_gen_region(),
  :LASTOID,
  null
  )
  returning reg_id as id_region_p \gset

update region set reg_descripcion_general.altitud = medida('m',572,'Sobre el nivel del mar')  where reg_id = :id_region_p;
select add_temperatura(:id_region_p,medida('°C',16.4 ,' Media Anual'));

select pai_id as id_pais from pais where upper(pai_nombre) = 'ITALIA' \gset
\lo_import ../imagenes/liguria.jpg
insert into region (reg_nombre,reg_ano_creacion,reg_latitud,reg_descripcion_general,reg_mapa,fk_region) values
  (
  'Liguria',
  null,
  medida('°',44,'Latitud norte y 8° Latitud este'),
  des_gen_region(),
  :LASTOID,
  null
  )
  returning reg_id as id_region_p \gset

update region set reg_descripcion_general.altitud = medida('m',400,'Sobre el nivel del mar', 516)  where reg_id = :id_region_p;
select add_temperatura(:id_region_p,medida('°C',16,' Media Anual', 22));

select pai_id as id_pais from pais where upper(pai_nombre) = 'ITALIA' \gset
\lo_import ../imagenes/emilia-romagna.jpg
insert into region (reg_nombre,reg_ano_creacion,reg_latitud,reg_descripcion_general,reg_mapa,fk_region) values
  (
  'Emilia Romagna',
  06-07-1970,
  medida('°',44.59,'Latitud norte'),
  des_gen_region(),
  :LASTOID,
  null
  )
  returning reg_id as id_region_p \gset

update region set reg_descripcion_general.altitud = medida('m',142,'Sobre el nivel del mar')  where reg_id = :id_region_p;
select add_temperatura(:id_region_p,medida('°C',21,' Media Anual'));

select pai_id as id_pais from pais where upper(pai_nombre) = 'ITALIA' \gset
\lo_import ../imagenes/piemonte.jpg
insert into region (reg_nombre,reg_ano_creacion,reg_latitud,reg_descripcion_general,reg_mapa,fk_region) values
  (
  'Piamonte',
  06-07-1970,
  medida('°',44.78,'Latitud norte'),
  des_gen_region(),
  :LASTOID,
  null
  )
  returning reg_id as id_region_p \gset

update region set reg_descripcion_general.altitud = medida('m',645,'Sobre el nivel del mar',2035)  where reg_id = :id_region_p;
select add_temperatura(:id_region_p,medida('°C',12.2,' Media Anual'));
