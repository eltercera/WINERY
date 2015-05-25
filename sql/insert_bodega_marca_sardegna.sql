select pai_id as id_pais from pais where upper(pai_nombre) = 'ITALIA' \gset
/* Montespada */
insert into productor (Pro_Nombre,Pro_Dir_General) values
  (
  'Robert Albertini',
  direcciongeneral('Loc. Giunchizza Trinita d Agultu e Vignola, Olbia Tempio, Sardegna, Italia ',' ','albertini@montespada.it')
  ) returning pro_id as id_productor \gset
UPDATE productor set Pro_Dir_General.telefonos = array_append((Pro_Dir_General).telefonos,telefono(349,'39','3737613','oficina')) where pro_id = :id_productor;

insert into bodega (Bod_Nombre,Bod_Direccion,Bod_Fundacion,Bod_Dir_Tecnico,Bod_Descripcion,FK_Pais,FK_Bodega,FK_Productor) Values
  (
    'Montespada',
    'Loc. Giunchizza Trinita d Agultu e Vignola, Olbia Tempio, Sardegna, Italia',
    '09-22-1992',
    'Robert Albertini',
    'La granja está situada en la región Montespada noreste de Cerdeña, en el corazón de la Costa Smeralda. \n Tiene vistas al mar frente a la costa de Córcega.',
    :id_pais,
    null,
    :id_productor
  ) returning bod_id as id_bodega \gset

\lo_import ../imagenes/vinos/vecchia-costa.jpg
insert into marca (Mar_Nombre,Mar_Descripcion,Mar_Des_Cata,Mar_Temp_Servicio,Mar_Maduracion,Mar_Ventana,Mar_G_Alcohol,Mar_Acidez_Total,Mar_PH,Mar_Imagen,Mar_Tipo_Tapa,FK_Clasificacion,FK_Bodega) VALUES
  (
  'Vecchia Costa',
  'Es un Vermentino con su máxima expresión típica de Vermentino di Gallura, con un contenido de alcohol bajo pero con la naturaleza precisa y equilibrada',
  ('Tiene un color amarillo de poca intensidad','Su aroma es característico al mediterráneo con un toque de eucalipto',' '),
  9,
  2,
  6,
  12.5,
  5.15,
  2.75,
  :LASTOID,
  'PLASTICO',
  2,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/sole.jpg
  (
  'Sole di Sardegna',
  'Una importante reserva con una mezcla de prestigio que da la fuerza de Vermentino y la elegancia de Chardonnay. Las selecciones en el campo y en la bodega se incluyen en esta reserva',
  ('Es de color amarillo claro', 'Con un aroma intenso de flores de primavera gallura , la miel y el mar', ' '),
  9,
  2,
  6,
  12.5,
  5.8,
  6.2,
  :LASTOID,
  'PLASTICO',
  2,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/sabbialuce.jpg
  (
  'Sabbialuce',
  'Es un vino de Vermentino di Gallura DOCG, con grandes ambiciones y el deseo de llevar a la mesa los sabores de la tierra donde nació y se crió, proveniente de un lugar donde la vid crece con gran dificultad y de la mejor manera',
  ('De color amarillo palido','Tiene un aroma intenso de frutas del bosque, eucalipto y del maqui de Gallura',' '),
  9,
  3,
  6,
  13,
  5.4,
  5.2,
  :LASTOID,
  'PLASTICO',
  2,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/rosso-montespada.jpg
  (
  'Rosso Di Montespada',
  'Un vino complejo pero con toda su elegante tipicidad, que trae a la mesa los sabores de este gran uva.',
  ('De color rojo intenso','Cuerpo denso', 'Fuerte olor perfumado con toque de aroma de fresas silvestres y frutos rojos'),
  15,
  4,
  10,
  13,
  5,
  3.4,
  :LASTOID,
  'CORCHO',
  1,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/giunchizza.jpg
  (
  'Giunchizza',
  'Un Vermentino que expresa el maximo sabor de la uva de donde proviene, con un grado modesto de alcohol dando un equilibrio preciso.',
  ('De color amarillo claro','Con olor al mediterraneo y a eucalipto', ' '),
  9,
  2,
  6,
  12.5,
  5.12,
  3.8,
  :LASTOID,
  'PLASTICO',
  2,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/canonau-montespada.jpg
  (
  'Cannonau Montespada',
  'Un vino riguroso,  , cannonau, un vino complejo pero con toda su elegante autenticidad, lo que pone sobre la mesa los verdaderos sabores de esta gran impureza de uva',
  ('Un sabor cálido y envolvente que emite emociones intensas','Color rojo intenso','Con un aroma de frutos rojos y de maleza'),
  15,
  3,
  8,
  12.5,
  5.22,
  3.55,
  :LASTOID,
  'PLASTICO',
  1,
  :id_bodega
  );