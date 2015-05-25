select pai_id as id_pais from pais where upper(pai_nombre) = 'ITALIA' \gset
/* Cantine LVNAE */
insert into productor (Pro_Nombre,Pro_Dir_General) values
  (
  'Paolo Bosoni',
  direcciongeneral('Loc. Giunchizza Trinita d Agultu e Vignola, Olbia Tempio, Sardegna, Italia ','http://www.cantinelunae.it','info@cantinelunae.com')
  ) returning pro_id as id_productor \gset
UPDATE productor set Pro_Dir_General.telefonos = array_append((Pro_Dir_General).telefonos,telefono(39,'0187','660187','oficina')) where pro_id = :id_productor;

insert into bodega (Bod_Nombre,Bod_Direccion,Bod_Fundacion,Bod_Dir_Tecnico,Bod_Descripcion,FK_Pais,FK_Bodega,FK_Productor) Values
  (
    'Cantine LVNAE',
    'Via Bozzi 63, 19034 Ortonovo, La Spezia',
    '03-15-1996',
    'Debora Bosoni',
    'El nombre esta inspirado en la ciudad de Luni, un antiguo puerto de Grecia consagrado por la diosa Selene para los griegos (Luna, para los romanos).',
    :id_pais,
    null,
    :id_productor
  ) returning bod_id as id_bodega \gset
  
\lo_import ../imagenes/vinos/albarola.jpg
insert into marca (Mar_Nombre,Mar_Descripcion,Mar_Des_Cata,Mar_Temp_Servicio,Mar_Maduracion,Mar_Ventana,Mar_G_Alcohol,Mar_Acidez_Total,Mar_PH,Mar_Imagen,Mar_Tipo_Tapa,FK_Clasificacion,FK_Bodega) VALUES
  (
  'Albarola',
  'Es un vino blanco de nuestra uva de Albarola, este vino va a los 20 años de producción',
  ('Es color amarillo palido','Intenso aroma mediterraneo y de campo','Su sabor es persistente'),
  13,
  2,
  3,
  13,
  6.4,
  4.15,
  :LASTOID,
  'PLASTICO',
  2,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/etiqueta_grigia.jpg
  (
  'Etichetta Grigia',
  'Es un vino blanco producido de la Vermentino in purezza, busca el equilibrio entre la frescura y la intensidad del sabor',
  ('Ligero tono amarillo con cierto tenue verdoso', 'Perfume intenso, persistente, fino y de gran elegancia', 'Presenta frescura y equilibrio'),
  10,
  1,
  4,
  12.5,
  4,
  5.7,
  :LASTOID,
  'PLASTICO',
  2,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/etiqueta_nera.jpg
  (
  'Etichetta Nera',
  'Un vino blanco elegante representativo de la región, estanto en el tercer puesto, por su elegancia y equilibrio',
  ('Su color es un intenso amarillo palido que da la sensación de ser dorado','Perfume elegante con aroma campestre, frutal y a mial','Se manifiesta rapidamente de forma persistente y armoníca'),
  13,
  2,
  3,
  13,
  6.7,
  5.3,
  :LASTOID,
  'PLASTICO',
  2,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/niccolo.jpg
  (
  'Niccolò V Riserva',
  'En honor a Nicolás V, Papa de origen Sarzana, viene este elegante vino rojo, a partir de una rigurosa selección de sangiovese, merlot y pollera negro se produce este vino de color rojo granate, intenso, con un tono naranja ligere en el borde, envejecido en barricas de roble pequeñas , este vino es la expresión del carácter de la tierra Colli di Luni  , el último tramo de la Liguria oriental.',
  ('Color rojo granata', 'Envejecido en madera','Intenso sabor dulce y amargo'),
  21,
  6,
  8,
  14,
  5.6,
  4.3,
  :LASTOID,
  'CORCHO',
  1,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/niccolov.jpg
  (
  'Niccolò V',
  'En honor a Nicolás V, Papa de origen Sarzana, viene este elegante vino rojo, a partir de una rigurosa selección de sangiovese, merlot y pollera negro se produce este vino de color rojo granate, intenso, con un tono naranja ligere en el borde, este vino es la expresión del carácter de la tierra Colli di Luni  , el último tramo de la Liguria oriental.',
  ('Color rojo granata','Intenso sabor amargo', 'Aroma frutal con un toque de canela'),
  19,
  3,
  6,
  13.5,
  4.7,
  5,
  :LASTOID,
  'CORCHO',
  1,
  :id_bodega
  );