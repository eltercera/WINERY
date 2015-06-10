insert into escala(esc_tipo)
values ('VINO')returning esc_id as id_escala \gset
update escala set esc_lista_valoracion = array_append((esc_lista_valoracion),valoracion('gustativa','calidad',0,100,'vino')) where esc_id=:id_escala;

insert into escala(esc_tipo)
values ('VINO')returning esc_id as id_escala \gset
update escala set esc_lista_valoracion = array_append((esc_lista_valoracion),valoracion('gustativa','intensidad',0,100,'vino')) where esc_id=:id_escala;

insert into concurso(con_nombre, con_email, con_tipo, con_nivel, con_condicion_pago, fk_escala)
values ('Decanter World Wine Awards', 'awards@decanter.com','VINO','$200 + IVA (20%) con tarjeta de credito o debito online. $235 por pago via correo postal',1) returning con_id as id_concurso \gset 
UPDATE concurso set con_costos = array_append((con_costos),costo(1,235,'Estados Unidos')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(1,200,'Estados Unidos')) where con_id = :id_concurso;

insert into concurso(con_nombre, con_email, con_tipo, con_nivel, con_condicion_pago, fk_escala)
values ('Concours Mondial de Bruxelles', 'contact@concoursmondial.com','VINO','Hace falta enviar cuatro botellas etiquetadas de cada vino presentado en el concurso antes del día de recoleccion. La caja debe ir acompañada de una factura pro forma que mencione “muestras sin valor comercial - Concours Mondial de Bruxelles” con el fin de evitar eventuales gastos aduaneros.',1) returning con_id as id_concurso \gset 
UPDATE concurso set con_costos = array_append((con_costos),costo(1,150,'Bruselas')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(2,298,'Bruselas')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(3,444,'Bruselas')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(4,588,'Bruselas')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(5,730,'Bruselas')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(6,870,'Bruselas')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(7,1001,'Bruselas')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(8,1136,'Bruselas')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(9,1260,'Bruselas')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(10,1380,'Bruselas')) where con_id = :id_concurso
UPDATE concurso set con_premios = array_append((con_premios),premio(,1,'diploma',,'Reconocimiento Gold')) where con_id = :id_concurso
UPDATE concurso set con_premios = array_append((con_premios),premio(,2,'diploma',,'Reconocimiento Silver')) where con_id = :id_concurso
UPDATE concurso set con_premios = array_append((con_premios),premio(,3,'diploma',,'Reconocimiento Bronze')) where con_id = :id_concurso
UPDATE concurso set con_premios = array_append((con_premios),premio(,4,'diploma',,'Reconocimiento International')) where con_id = :id_concurso
UPDATE concurso set con_premios = array_append((con_premios),premio(,5,'diploma',,'Reconocimiento Regional')) where con_id = :id_concurso
;

insert into concurso(con_nombre, con_email, con_tipo, con_nivel, con_condicion_pago, fk_escala)
values ('International Wine Challenge', 'iwc@wrbm.com','VINO','El pago en línea se puede hacer por la mayoría de las tarjetas de crédito. También puede solicitar una factura en £, € o US $.',2) returning con_id as id_concurso \gset 
UPDATE concurso set con_costos = array_append((con_costos),costo(1,99,'Inglaterra')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(1,128,'Inglaterra')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(1,49,'Inglaterra')) where con_id = :id_concurso
UPDATE concurso set con_premios = array_append((con_premios),premio(,1,'diploma',,'Reconocimiento Gold')) where con_id = :id_concurso
UPDATE concurso set con_premios = array_append((con_premios),premio(,2,'diploma',,'Reconocimiento Silver')) where con_id = :id_concurso
UPDATE concurso set con_premios = array_append((con_premios),premio(,3,'diploma',,'Reconocimiento Bronze')) where con_id = :id_concurso;

insert into concurso(con_nombre, con_email, con_tipo, con_nivel, con_condicion_pago, fk_escala)
values ('International Wine & Spirit Competition', 'info@iwscgroup.com','VINO','Entradas de línea no se considerará como completada si no van acompañados por el pago total a través de uno de los métodos de pago aprobados. La entrada se puede pagar con tarjeta de crédito o débito.',2) returning con_id as id_concurso \gset 
UPDATE concurso set con_costos = array_append((con_costos),costo(1,99,'Inglaterra')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(1,128,'Inglaterra')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(1,49,'Inglaterra')) where con_id = :id_concurso
UPDATE concurso set con_premios = array_append((con_premios),premio(,1,'diploma',,'Reconocimiento Gold')) where con_id = :id_concurso
UPDATE concurso set con_premios = array_append((con_premios),premio(,2,'diploma',,'Reconocimiento Silver')) where con_id = :id_concurso
UPDATE concurso set con_premios = array_append((con_premios),premio(,3,'diploma',,'Reconocimiento Bronze')) where con_id = :id_concurso;

insert into concurso(con_nombre, con_email, con_tipo, con_nivel, con_condicion_pago, fk_escala)
values ('Premios Bacchus', 'info@uec.es','VINO','El abono de las cuotas de inscripción se efectuará mediante una transferencia dirigida a: UNIÓN ESPAÑOLA DE CATADORES (BACCHUS 2015)',1) returning con_id as id_concurso \gset 
UPDATE concurso set con_costos = array_append((con_costos),costo(1,150,'España')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(2,298,'España')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(3,443,'España')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(4,584,'España')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(5,710,'España')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(6,843,'España')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(7,975,'España')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(8,1091,'España')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(9,1201,'España')) where con_id = :id_concurso
UPDATE concurso set con_costos = array_append((con_costos),costo(10,1280,'España')) where con_id = :id_concurso
UPDATE concurso set con_premios = array_append((con_premios),premio(,1,'diploma',,'Reconocimiento Gold')) where con_id = :id_concurso
UPDATE concurso set con_premios = array_append((con_premios),premio(,2,'diploma',,'Reconocimiento Silver')) where con_id = :id_concurso
UPDATE concurso set con_premios = array_append((con_premios),premio(,3,'diploma',,'Reconocimiento Bronze')) where con_id = :id_concurso;
