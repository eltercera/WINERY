/* 
	Catadores Argentinos
*/

insert into catador_consultor (cc_nivel,cc_nombre,cc_email,cc_genero,cc_fecha_nacimiento) values
	('EXPERTO','Pablo Renea','pabloranea@azafran.com','M','17-03-1973') returning cc_id as id_catador \gset
UPDATE catador_consultor set cc_telefonos.telefonos = array_append((cc_telefonos),telefono(54,'11','74639176','oficina')) where cc_id = :id_catador;

insert into catador_consultor (cc_nivel,cc_nombre,cc_email,cc_genero,cc_fecha_nacimiento) values
	('EXPERTO','Agustina De Alba','contacto@agustinadealba.com','F','23-05-1988') returning cc_id as id_catador \gset
UPDATE catador_consultor set cc_telefonos.telefonos = array_append((cc_telefonos),telefono(54,'11','99417693','oficina')) where cc_id = :id_catador;

insert into catador_consultor (cc_nivel,cc_nombre,cc_email,cc_genero,cc_fecha_nacimiento) values
	('EXPERTO','Paz Levinson','paz.levinson@gmail.com','F','16-04-1985') returning cc_id as id_catador \gset
UPDATE catador_consultor set cc_telefonos.telefonos = array_append((cc_telefonos),telefono(54,'11','41976652','oficina')) where cc_id = :id_catador;

insert into catador_consultor (cc_nivel,cc_nombre,cc_email,cc_genero,cc_fecha_nacimiento) values
	('EXPERTO','Martin Bruno','martin.bruno@gmail.com','M','13-01-1978') returning cc_id as id_catador \gset
UPDATE catador_consultor set cc_telefonos.telefonos = array_append((cc_telefonos),telefono(54,'11','34286572','oficina')) where cc_id = :id_catador;

insert into catador_consultor (cc_nivel,cc_nombre,cc_email,cc_genero,cc_fecha_nacimiento) values
	('EXPERTO','Matthieu Grassin','matthieu@altavista.com','M','31-08-1982') returning cc_id as id_catador \gset
UPDATE catador_consultor set cc_telefonos.telefonos = array_append((cc_telefonos),telefono(54,'261','24176703','oficina')) where cc_id = :id_catador;

insert into catador_consultor (cc_nivel,cc_nombre,cc_email,cc_genero,cc_fecha_nacimiento) values
	('EXPERTO','Roberto De La Mota','rdelamota@mendel.com.ar','M','06-07-1967') returning cc_id as id_catador \gset
UPDATE catador_consultor set cc_telefonos.telefonos = array_append((cc_telefonos),telefono(54,'261','87849782','oficina')) where cc_id = :id_catador;

insert into catador_consultor (cc_nivel,cc_nombre,cc_email,cc_genero,cc_fecha_nacimiento) values
	('EXPERTO','Romina Carparelli','romina@bodegamargot.com.ar','F','15-11-1980') returning cc_id as id_catador \gset
UPDATE catador_consultor set cc_telefonos.telefonos = array_append((cc_telefonos),telefono(54,'261','33498217','oficina')) where cc_id = :id_catador;

insert into catador_consultor (cc_nivel,cc_nombre,cc_email,cc_genero,cc_fecha_nacimiento) values
	('EXPERTO','Susana Balbo','sbalbo@dominiodelplata.com.ar','F','17-12-1956') returning cc_id as id_catador \gset
UPDATE catador_consultor set cc_telefonos.telefonos = array_append((cc_telefonos),telefono(54,'261','77619328','oficina')) where cc_id = :id_catador;

insert into catador_consultor (cc_nivel,cc_nombre,cc_email,cc_genero,cc_fecha_nacimiento) values
	('EXPERTO','Jorge Riccitelli','riccitelli@norton.com.ar','M','06-10-1964') returning cc_id as id_catador \gset
UPDATE catador_consultor set cc_telefonos.telefonos = array_append((cc_telefonos),telefono(54,'261','98578951','oficina')) where cc_id = :id_catador;

insert into catador_consultor (cc_nivel,cc_nombre,cc_email,cc_genero,cc_fecha_nacimiento) values
	('EXPERTO','Matias Riccitelli','matiasriccitelli@matiasriccitelli.com','M','23-11-1980') returning cc_id as id_catador \gset
UPDATE catador_consultor set cc_telefonos.telefonos = array_append((cc_telefonos),telefono(54,'926','15465443','oficina')) where cc_id = :id_catador;

insert into catador_consultor (cc_nivel,cc_nombre,cc_email,cc_genero,cc_fecha_nacimiento) values
	('EXPERTO','Santiago Mayorga','smayorga@mendel.com.ar','M','17-02-1980') returning cc_id as id_catador \gset
UPDATE catador_consultor set cc_telefonos.telefonos = array_append((cc_telefonos),telefono(54,'261','42234507','oficina')) where cc_id = :id_catador;

/*
	Catadores Italianos
*/

insert into catador_consultor (cc_nivel,cc_nombre,cc_email,cc_genero,cc_fecha_nacimiento) values
	('EXPERTO','Luca Gardini','luca@lucagardini.com','M','19-09-1981') returning cc_id as id_catador \gset
UPDATE catador_consultor set cc_telefonos.telefonos = array_append((cc_telefonos),telefono(39,'333','34286572','oficina')) where cc_id = :id_catador;


