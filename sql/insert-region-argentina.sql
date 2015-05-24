select pai_id as id_pais from pais where upper(pai_nombre) = 'ARGENTINA' \gset
\lo_import ../imagenes/cuyo.gif
insert into region (reg_nombre,reg_ano_creacion,reg_latitud,reg_descripcion_general,rep_mapa,fk_region) values
  (
  'Cuyo',
  null,
  medida('°',31,'Latitud sur'),
  des_gen_region(),
  :LASTOID,
  null
  )
  returning reg_id as id_region_p \gset

update region set reg_descripcion_general.altitud = medida('m',700,'Sobre el nivel del mar',1700)  where reg_id = :id_region_p;
select add_temperatura(:id_region_p,medida('°C',15,' Media Anual'));

\lo_import ../imagenes/mendoza.jpg
insert into region (reg_nombre,reg_ano_creacion,reg_latitud,reg_descripcion_general,rep_mapa,fk_region) values
  (
  'Mendoza',
  1820,
  medida('°',32,'Latitud sur',37),
  des_gen_region(),
  :LASTOID,
  :id_region_p
  )
  returning reg_id as id_region \gset
update region set reg_descripcion_general.altitud = medida('m',457,'Sobre el nivel del mar',1700)  where reg_id = :id_region;
select add_temperatura(:id_region,medida('°C',15,' Media Anual',19));
select add_presipitaciones(:id_region,medida('mm',200,'por año'));
select add_suelo(:id_region,suelo('Entisoles',' '));
select add_suelo(:id_region,suelo('Aridisoles',' '));
select add_suelo(:id_region,suelo('Inceptisoles',' '));
select add_suelo(:id_region,suelo('Molisoles',' '));
select add_suelo(:id_region,suelo('Histosoles',' '));


\lo_import ../imagenes/sanjuan.jpg
insert into region (reg_nombre,reg_ano_creacion,reg_latitud,reg_descripcion_general,rep_mapa,fk_region) values
  (
  'San Juan',
  1551,
  medida('°',34,'Latitud sur',36),
  des_gen_region(),
  :LASTOID,
  :id_region_p
  )
  returning reg_id as id_region \gset
update region set reg_descripcion_general.altitud = medida('m',600,'Sobre el nivel del mar',1300)  where reg_id = :id_region;
select add_temperatura(:id_region,medida('°C',17,' Media Anual',18));
select add_presipitaciones(:id_region,medida('mm',10,'por año'));

\lo_import ../imagenes/patagonia.jpg
insert into region (reg_nombre,reg_ano_creacion,reg_latitud,reg_descripcion_general,rep_mapa,fk_region) values
  (
  'Patagonia',
  null,
  medida('°',40,'Latitud sur'),
  des_gen_region(),
  :LASTOID,
  null
  )
  returning reg_id as id_region_p \gset
  
\lo_import ../imagenes/rionegro.jpg
insert into region (reg_nombre,reg_ano_creacion,reg_latitud,reg_descripcion_general,rep_mapa,fk_region) values
  (
  'Río Negro',
  1551,
  medida('°',40,'Latitud sur'),
  des_gen_region(),
  :LASTOID,
  :id_region_p
  )
  returning reg_id as id_region \gset
update region set reg_descripcion_general.altitud = medida('m',370,'Sobre el nivel del mar')  where reg_id = :id_region;
select add_temperatura(:id_region,medida('°C',12,' Media Anual',16));
select add_presipitaciones(:id_region,medida('mm',190,'por año'));

