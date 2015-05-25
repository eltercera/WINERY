select pai_id as id_pais from pais where upper(pai_nombre) = 'ITALIA' \gset
/* Avignonesi */
insert into productor (Pro_Nombre,Pro_Dir_General) values
  (
  'Virginie Saverys',
  direcciongeneral('Fattoria Le Capezzine, 53040 Valiano di Montepulciano, Toscana, Italia','http://www.avignonesi.it','info@avignonesi.it')
  ) returning pro_id as id_productor \gset
UPDATE productor set Pro_Dir_General.telefonos = array_append((Pro_Dir_General).telefonos,telefono(39,'057','8724304','oficina')) where pro_id = :id_productor;

insert into bodega (Bod_Nombre,Bod_Direccion,Bod_Fundacion,Bod_Dir_Tecnico,Bod_Descripcion,FK_Pais,FK_Bodega,FK_Productor) Values
  (
    'Avignonesi',
    'Fattoria Le Capezzine, 53040 Valiano di Montepulciano',
    '07-06-1974',
    'Virginie Saverys',
    'Esta finca ha sido siempre las piezas centrales de la escena del vino de Montepulciano. Aquí se pueden degustar vinos , ir en una extensa gira de vino de la finca Avignonesi y disfrutar de una comida en el restaurante de la bodega',
    :id_pais,
    null,
    :id_productor
  ) returning bod_id as id_bodega \gset

select add_historia(:id_bodega, historiabodega(2009,'Avignonesi fue comprado en 2009 por Virginie Saverys , que ha traído cambios significativos en la bodega. Ella ha trabajado incansablemente para convertir todo el edificio a la viticultura orgánica y biodinámica, con el claro objetivo de la elaboración de los vinos distintos, genuinos que expresen en su totalidad las características singulares del terroir Avignonesi.'));
select add_historia(:id_bodega, historiabodega(2011,'En 2011, Avignonesi aplica para la certificación orgánica y espera recibir en 2016 , con un período de conversión un poco más largo de lo habitual debido a las compras de viñedos recientes en Montepulciano'));


\lo_import ../imagenes/vinos/desiderio.jpg
insert into marca (Mar_Nombre,Mar_Descripcion,Mar_Des_Cata,Mar_Temp_Servicio,Mar_Maduracion,Mar_Ventana,Mar_G_Alcohol,Mar_Acidez_Total,Mar_PH,Mar_Imagen,Mar_Tipo_Tapa,FK_Clasificacion,FK_Bodega) VALUES
  (
  'Desiderio Merlot',
  'La vendimia se inicia a mediados de septiembre después de realizar análisis en los viñedos, y se vinifica cada parcela por separado para preservar las características específicas de las distintas parcelas. Una vez en la bodega los granos son separados de los tallos, entonces comienza la maceración y pre-fermentación en las pieles con levaduras indígenas. El zumo de uva se transforma en vino mediante maceración con las pieles en depósitos de acero inoxidable a temperatura controlada. La fermentación maloláctica se lleva a cabo durante los primeros meses de crianza en madera.',	
  ('Tiene un intenso color rojo','Muestra la frescura de las frutas del bosque','Es largo y suave lleno de persistencia, con un sabor a fruita con un toque de chocolate oscuro'),
  2,
  5,
  7,
  11.5,
  6.4,
  7.5,
  :LASTOID,
  'CORCHO',
  11,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/nobile.jpg
  (
  'Grandi Annate Vino Nobile di Montepulciano',
  'Vino Nobile Grandi Annate, es la mejor expresión de Sangiovese de nuestros viñedos de Montepulciano. Se produce sólo en los mejores años, cuando el clima trae condiciones de crecimiento óptimas para las uvas, lo que permite que las uvas para expresar toda la complejidad del terruño, lo que lleva a un vino que es rico en carácter con el vigor de la edad durante muchos años.',
  ('Tiene un color rubí medianamente rojo','Abre con aromas de camelias y rosas silvestres, después con uno de ciruela, eucalipto y sándalo','Bien equilibrado, con concentración y elegancia'),
  19,
  2,
  30,
  14,
  5.4,
  7.2,
  :LASTOID,
  'CORCHO',
  14,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/grifi.jpg
  (
  'Grifi',
  'Vino propio que es realizado con nuestras mejores vides, la Sangiovese proviene de la parcela vitícola Poggetto di Sopra de I Poggetti raíces, y la Cabernet Sauvignon proviene de las parcelas vitícolas Selva Nuova y Selva Vecchia de La Selva inmobiliarias',
  ('De color medianamente rojo','Intenso aroma a violeta y cerezos','Persistencia en el sabor con un cuerpo fino y completo'),
  7,
  3,
  12,
  15,
  5.32,
  6.75,
  :LASTOID,
  'CORCHO',
  17,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/marzocco.jpg
  (
  'Il Marzocco Chardonnay',
  'En el 2014, Il Marzocco se convierte en un vino IGT . El cambio de denominación de Cortona DOC a Toscana IGT se debe al movimiento de vinificación de la region, pero su preparacion sigue siendo propia de nuestro viñedos.',
  ('Muestra un rico color dorado','Cuenta con un leve aroma de limón y especies sutiles','Fresco y acido'),
  12,
  2,
  7,
  13,
  7.2,
  6.4,
  :LASTOID,
  'PLASTICO',
  6,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/rossomonte.jpg
  (
  'Rosso di Montepulciano',
  'El Rosso di Montepulciano es el más joven de nuestro trío Sangiovese , que también incluye el Vino Nobile y el Grandi Annate . Tiene una crianza en roble ligera y es perfecto para combinar con " antipasti " , platos de pasta ligera o aves de corral . En el verano es delicioso cuando se sirve enfriado ligeramente del cubo de hielo.',
  ('Medianamente de color rojo','De aroma silvestre, una mezcla entre cerezas y grosella','Su sabor en contino, dejando un toque delicado de picante'),
  16,
  2,
  12,
  13.5,
  8.5,
  7.6,
  :LASTOID,
  'CORCHO',
  15,
  :id_bodega
  );