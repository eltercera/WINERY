select pai_id as id_pais from pais where upper(pai_nombre) = 'ITALIA' \gset
/* Cerreto */
insert into productor (Pro_Nombre,Pro_Dir_General) values
  (
  'Brunno Cerretto',
  direcciongeneral('Alba, Tenuta Monsordo Bernardina, Localita San Cassiano 34, Piamonte, Italia','http://www.cerreto.com','visit@cerreto.com')
  ) returning pro_id as id_productor \gset
UPDATE productor set Pro_Dir_General.telefonos = array_append((Pro_Dir_General).telefonos,telefono(39,'017','3282582','oficina')) where pro_id = :id_productor;

insert into bodega (Bod_Nombre,Bod_Direccion,Bod_Fundacion,Bod_Dir_Tecnico,Bod_Descripcion,FK_Pais,FK_Bodega,FK_Productor) Values
  (
    'Cerreto',
    'Alba, Tenuta Monsordo Bernardina, Localita San Cassiano 34',
    '04-10-1970',
    'Michele Charlo',
    'Para la mayoría, Ceretto es reconocido principalmente por sus vinos, viñedos propios, calidad excepcional, bodegas singulares y arquitectura moderna y el diseño.',
    :id_pais,
    null,
    :id_productor
  ) returning bod_id as id_bodega \gset

select add_historia(:id_bodega, historiabodega(1970,'Ceretto compro este viñedo en conjunto al huerto, Avellana Relanghe, en la frontera de los pueblos de Sinio y Albaretto Torre. El objetivo era restaurar un territorio que tenía de todo, y que no fue olvidado por el éxodo en los años sesenta con el más lucrativo Valle Langa. Se tomó la decisión de plantar Riesling del Rin , una variedad de uva que posee más capacidad de adaptarse a las diferencias significativas en el día y la noche temperaturas de tiempo.'));

\lo_import ../imagenes/vinos/albarei.jpg
insert into marca (Mar_Nombre,Mar_Descripcion,Mar_Des_Cata,Mar_Temp_Servicio,Mar_Maduracion,Mar_Ventana,Mar_G_Alcohol,Mar_Acidez_Total,Mar_PH,Mar_Imagen,Mar_Tipo_Tapa,FK_Clasificacion,FK_Bodega) VALUES
  (
  'Arbarei',
  'Este vino blanco de denominación Langhe se caracteriza por su gran acidez y color amarillento, pasa por un gran tiempo de maduración en contenedores metal con una temperatura controlada para conseguir la mejor maceración de la uva. ',
  ('De un color amarillo con tonos verdes','Intenso olor a frutas','De gran acidez'),
  9,
  4,
  7,
  17.3,
  6.4,
  7.9,
  :LASTOID,
  'PLASTICO',
  8,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/asij.jpg
  (
  'Asij Barbaresco',
  'Con la cosecha 2010 de Barolo y Barbaresco 2011 de la vendimia de la nombres en las etiquetas de Zonchera y Asij se simplificarán al Barolo y Barbaresco. Zonchera y Asij fueron creados como el primer Barolo y Barbaresco de la casa de Ceretto, desde los viñedos de La Zonchetta Morra, en Brunate y los viñedos asili de Barbaresco. Eran nuestra etiquetas superiores hasta los años 70, cuando Bruno y Marcello decidieron invertir en viñedos individuales prestigiosos y comenzaron a adquirir las primeras hectáreas de vides. A partir de ese momento en adelante, por razones nostálgicas, se decidió continuar su producción, pero las etiquetas distintas. Zonchera y Asij tanto se convirtió en el segundo vino de nuestra más famosa Barolo y Barbaresco.',
  ('Perfume persistente a flores marchitas','Demuestra un sabor equilibrado y buena acidez en la bora', 'Su color rojo claro que tiende a anaranjado'),
  15,
  2,
  10,
  12.5,
  5.8,
  8.2,
  :LASTOID,
  'CORCHO',
  13,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/blange.jpg
  (
  'Blangé Arneis',
  'Arneis, variedad de uva autóctona , produce un vino muy afrutado con notas de pera y manzana. La fragancia y sabor se ven reforzadas por la pequeña cantidad de CO2 que contiene, mantenido por fermentación, también es útil para compensar la baja acidez típica de la uva.',
  ('Tiene un gran perfume con su olor típico a pera y manzana','Un color amarillo muy palido','Buena intensidad del sabor'),
  7,
  1,
  4,
  12,
  3,
  7,
  :LASTOID,
  'PLASTICO',
  6,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/brunate.jpg
  (
  'Brunate',
  'Vinos Barolo se hacen de la uva Nebbiolo , una uva roja originalmente encontrado en el Piamonte Italia. Esta denominación produce una mejor profundidad del sabor de esta variedad, siendo uno de los vinos más conocidos en Italia.',
  ('Presenta una complejidad aromática por su mezcla de perfumes entre rosas y violetas','De cuerpo ligero','Contine un porcentaje de acidez placentero para el paladar'),
  17,
  4,
  15,
  11.7,
  5.6,
  8.1,
  :LASTOID,
  'CORCHO',
  12,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/zonchera.jpg
  (
  'Zonchera',
  'Con la cosecha 2010 de Barolo y Barbaresco 2011 de la vendimia de la nombres en las etiquetas de Zonchera y Asij se simplificarán al Barolo y Barbaresco. Zonchera y Asij fueron creados como el primer Barolo y Barbaresco de la casa de Ceretto, desde los viñedos de La Zonchetta Morra, en Brunate y los viñedos asili de Barbaresco. Eran nuestra etiquetas superiores hasta los años 70, cuando Bruno y Marcello decidieron invertir en viñedos individuales prestigiosos y comenzaron a adquirir las primeras hectáreas de vides. A partir de ese momento en adelante, por razones nostálgicas, se decidió continuar su producción, pero las etiquetas distintas. Zonchera y Asij tanto se convirtió en el segundo vino de nuestra más famosa Barolo y Barbaresco.',
  ('Fino equilibrio entre alcohol y acidez','Armonioso y aterciopelado','Presenta una complejidad aromática por su mezcla de perfumes entre rosas y violetas'),
  17,
  4,
  18,
  11.2,
  10,
  8.05,
  :LASTOID,
  'CORCHO',
  12,
  :id_bodega
  );