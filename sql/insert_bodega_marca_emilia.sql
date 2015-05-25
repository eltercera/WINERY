select pai_id as id_pais from pais where upper(pai_nombre) = 'ITALIA' \gset
/* Bonfiglio */
insert into productor (Pro_Nombre,Pro_Dir_General) values
  (
  'Giovanni Fraulini',
  direcciongeneral('Via Cassola 21 - 40053 Valsamoggia loc. Monteveglio Bologna, Emilia Romagna, Italia','http://www.bonfigliovini.it','fraulivani@gmail.com')
  ) returning pro_id as id_productor \gset
UPDATE productor set Pro_Dir_General.telefonos = array_append((Pro_Dir_General).telefonos,telefono(39,'05','1830758','oficina')) where pro_id = :id_productor;

insert into bodega (Bod_Nombre,Bod_Direccion,Bod_Fundacion,Bod_Dir_Tecnico,Bod_Descripcion,FK_Pais,FK_Bodega,FK_Productor) Values
  (
    'Bonfiglio',
    'Via Cassola 21- 40053 Valsamoggia loc. Monteveglio Bologna',
    '03-15-1987',
    'Massimo Calgiari',
    'Bonfiglio es una bodega histórica situada en Monteveglio y asociado a la doc Colli Bolognesi Consorcio de Vinos con más de cincuenta años de doc típica la producción de vinos.',
    :id_pais,
    null,
    :id_productor
  ) returning bod_id as id_bodega \gset

\lo_import ../imagenes/vinos/alba_in_vigna.jpg
insert into marca (Mar_Nombre,Mar_Descripcion,Mar_Des_Cata,Mar_Temp_Servicio,Mar_Maduracion,Mar_Ventana,Mar_G_Alcohol,Mar_Acidez_Total,Mar_PH,Mar_Imagen,Mar_Tipo_Tapa,FK_Clasificacion,FK_Bodega) VALUES
  (
  'Alba in Vigna',
  'Alba in Vigna es un vino frizante hecho por el metodo tradicional con una segunda botella de fermentación, El proceso es el mismo que se usa para generar los vinos espumantes o champana, solo por un corto tiempo para darle luz, frescura y textura plasmatica',
  ('Su color es de un brillante y claro amarillo','Buena intensidad','Es un vino fresco'),
  9,
  2,
  3,
  11.9,
  5.7,
  4,
  :LASTOID,
  'PLASTICO',
  2,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/barbarot.jpg
  (
  'Barbarot Brioso',
  'Barbera & Merlot son las uvas utilizadas para obtener este vino, es un vino frizante de poca luz',
  ('Su color es un rojo fuerte que tiende a violeta', 'Su aroma es una combinacion de la violetas y bosque', 'Es un vino de textura suave y dulce'),
  15,
  1,
  2,
  12.3,
  7.6,
  6,
  :LASTOID,
  'CORCHO',
  1,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/cab-sauvignon.jpg
  (
  'Cabarnet Sauvignon',
  'Con la gran producción de uvas rojas de la región, escojemos las mejores de estas, las Cabernet Sauvignon.',
  ('Es de un color rojizo con matices violetas','Tiene un aroma agrio y del bosque','Su sabor es intenso y persistente'),
  17,
  1,
  4,
  12.7,
  6.6,
  5.4,
  :LASTOID,
  'CORCHO',
  1,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/pig_clasico.jpg
  (
  'Pignoletto Classico',
  'El Pignoletto es un vino historico de la región que utiliza las uvas de denominación Colli Bolognesi. Bonfiglio lo realiza de la forma mas pura posible para mantener el sabor de las mejores uvas Pignoletto, su frescura, cuerpo y sabor frutal.',
  ('De un color amarillo con toques de verde','Es fresco, de buen cuerpo y con mucha ĺuz','Es seco, largo y armónico'),
  10,
  1,
  2,
  12.5,
  5.9,
  4.9,
  :LASTOID,
  'PLASTICO',
  1,
  :id_bodega
  ),
  
\lo_import ../imagenes/vinos/pig_superior.jpg
  (
  'Pignoletto Superiore',
  'El Pignoletto es un vino historico de la región que utiliza las uvas de denominación Colli Bolognesi.',
  ('De un color amarillo con toques de verde','Es fresco, de buen cuerpo y con mucha ĺuz','Es seco, largo y armónico'),
  10,
  1,
  2,
  12.5,
  6.1,
  5.4,
  :LASTOID,
  'PLASTICO',
  2,
  :id_bodega
  );