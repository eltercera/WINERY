select pai_id as id_pais from pais where upper(pai_nombre) = 'ARGENTINA' \gset
/* Nieto Senetiner  */
insert into productor (Pro_Nombre,Pro_Dir_General) values
  (
  'Nieto Senetiner',
  direcciongeneral('Guardia Vieja s/n - Vistalba , Mendoza , 5509 , Argentina ','http://www.nietosenetiner.com.ar','guillermo.brandariz@molinos.com.ar')
  ) returning pro_id as id_productor \gset
UPDATE productor set Pro_Dir_General.telefonos = array_append((Pro_Dir_General).telefonos,telefono(54,'11','43401336','oficina')) where pro_id = :id_productor;

insert into bodega (Bod_Nombre,Bod_Direccion,Bod_Fundacion,Bod_Dir_Tecnico,Bod_Descripcion,FK_Pais,FK_Bodega,FK_Productor) Values
  (
    'Bodega Nieto Senetiner',
    'Guardia Vieja s/n - Vistalba , Mendoza , 5509 , Argentina',
    '01-01-1888',
    'Roberto Gonzalez',
    'Bodegas Nieto Senetiner es una bodega argentina referente en el mundo, por la cercanía al consumidor, su alto prestigio y una fuerte tradición familiar.\nLa bodega se encuentra en el corazón de Luján de Cuyo, en el Valle de Vistalba, a 900 metros sobre el nivel del mar. Históricamente conocida como “Primera Zona”, Luján de Cuyo se destaca en la provincia de Mendoza por sus condiciones extraordinarias para el óptimo desarrollo de uvas de alta calidad.',
    :id_pais,
    null,
    :id_productor
  ) returning bod_id as id_bodega \gset

select add_historia(:id_bodega, historiabodega(1888,' Inmigrantes italianos la fundan y plantan los primeros viñedos en Vistalba, Luján de Cuyo, provincia de Mendoza. La bodega se desarrolló en manos de diferentes familias durante las primeras décadas del siglo pasado, quienes han sabido transmitir el secreto de la elaboración de los grandes vinos y el amor por su tierra.'));
select add_historia(:id_bodega, historiabodega(1969,' es adquirida por las familias Nieto y Senetiner, quienes amplían las instalaciones dando comienzo a una nueva etapa de crecimiento y desarrollo de sus marcas.'));
select add_historia(:id_bodega, historiabodega(1998,' Pasa a formar parte del Grupo de Negocios de Molinos Río de la Plata. La bodega posee una posición consolidada de liderazgo, comprometida con los más altos estándares de elaboración y calidad, sustentados en un plan continuo de inversiones tanto en fincas como en tecnología de procesos.'));

\lo_import ../imagenes/vinos/NietoSenetiner_MalbecDoc.png
insert into marca (Mar_Nombre,Mar_Descripcion,Mar_Des_Cata,Mar_Temp_Servicio,Mar_Maduracion,Mar_Ventana,Mar_G_Alcohol,Mar_Acidez_Total,Mar_PH,Mar_Imagen,Mar_Tipo_Tapa,FK_Clasificacion,FK_Bodega) VALUES
  (
  'Nieto Senetiner Malbec D.O.C.',
  'La distinción D.O.C. (Denominación de Origen Controlado) certifica a través de un Consejo de especialistas que el vino proviene de una zona o terruño en particular y que ha sido elaborado bajo normas reglamentadas y especiales de calidad.',
  ('Vino definido e intenso, de color rojo profundo y buena intensidad','Sus notas a frutos rojos pequeños, ciruela e higos se combinan con los aromas a vainilla y tabaco entregados durante su crianza en roble francés.','se presenta con gran personalidad, cuerpo distinguido, armónico y sensual.'),
  18,
  1,
  7,
  14,
  4.8,
  4.8,
  :LASTOID,
  'CORCHO',
  1,
  :id_bodega
  );

/* LAGARDE  */
insert into productor (Pro_Nombre,Pro_Dir_General) values
  (
  'LAGARDE',
  direcciongeneral('Av. Del Libertador 5936 piso 6 (1428) Capital Federal, Buenos Aires, Argentina','http://www.lagarde.com.ar','info@lagarde.com.ar')
  ) returning pro_id as id_productor \gset
UPDATE productor set Pro_Dir_General.telefonos = array_append((Pro_Dir_General).telefonos,telefono(54,'11','4789-1800','oficina')) where pro_id = :id_productor;

insert into bodega (Bod_Nombre,Bod_Direccion,Bod_Fundacion,Bod_Dir_Tecnico,Bod_Descripcion,FK_Pais,FK_Bodega,FK_Productor) Values
  (
    'LAGARDE Bodega',
    'San Martin 1745, Mayor Drummond (5507) Luján de Cuyo, Mendoza, Argentina',
    '01-01-1897',
    'Sofía y Lucila Pescarmona',
    'La historia de Bodega Lagarde se remonta a los comienzos del cultivo de la vid y de la industria vitivinícola en Mendoza, Argentina. Establecida en 1897 y manejada por la familia Pescarmona desde 1970, siempre se trabajó para cumplir el objetivo de producir el vino de la más alta calidad, sosteniendo un compromiso único con su tierra y su gente.\nGracias al fuerte compromiso con la innovación, Lagarde fue pionero en implantación de cepas no tradicionales como el Viognier y el Moscato Bianco.\nSus vinos son elaborados exclusivamente con uvas de viñedos propios para resaltar la tipicidad varietal del terroir de donde provienen sus vinos. Siendo una de las bodegas con más trayectoria de la provincia de Mendoza, cuenta con viñedos históricos y centenarios de 1906 y 1930.',
    :id_pais,
    null,
    :id_productor
  ) returning bod_id as id_bodega \gset
select add_historia(:id_bodega, historiabodega(1897,'Fue Fundada.'));
select add_historia(:id_bodega, historiabodega(1897,'Bodega Lagarde fue adquirida por la familia Pescarmona, quien le imprimió un sello que marcaría su identidad de bodega familiar productora de vinos de alta gama, tanto en la Argentina como en el resto del mundo.'));

\lo_import ../imagenes/vinos/Lagarde_MalbecDOC.jpg
insert into marca (Mar_Nombre,Mar_Descripcion,Mar_Des_Cata,Mar_Temp_Servicio,Mar_Maduracion,Mar_Ventana,Mar_G_Alcohol,Mar_Acidez_Total,Mar_PH,Mar_Imagen,Mar_Tipo_Tapa,FK_Clasificacion,FK_Bodega) VALUES
  (
  'Lagarde Malbec D.O.C',
  '',
  ('Color rojo rubí intenso con matices bordó.','Aromas a frutos rojos y negros muy maduros y mermeladas. Algunas notas a aceitunas negras y eucaliptos.','En boca es untuoso y elegante. Bien estructurado, redondo y persistente.'),
  18,
  1,
  7,
  13.7,
  6.3,
  2.2,
  :LASTOID,
  'CORCHO',
  1,
  :id_bodega
  );
  
\lo_import ../imagenes/vinos/Guarda_Lagarde_Malbec.png
insert into marca (Mar_Nombre,Mar_Descripcion,Mar_Des_Cata,Mar_Temp_Servicio,Mar_Maduracion,Mar_Ventana,Mar_G_Alcohol,Mar_Acidez_Total,Mar_PH,Mar_Imagen,Mar_Tipo_Tapa,FK_Clasificacion,FK_Bodega) VALUES
  (
  'Guarda Lagarde Malbec DOC',
  'Este vino elaborado bajo la D.O.C. de Luján de Cuyo proviene de una viña de 1906, ubicada en Mayor Drummond, zona de gran reconocimiento para esta variedad.',
  ('Color rojo oscuro con reflejos bordó. ','Intenso, predominan los aromas de frutos rojos maduros y mermeladas, combinados con el suave aporte aromático del roble, vainilla chocolate y algunos ahumados.','Boca elegante, buena concentración y untuosidad, con taninos sedosos, típico del malbec argentino.'),
  18,
  1,
  7,
  14.2,
  6.6,
  3.6,
  :LASTOID,
  'CORCHO',
  1,
  :id_bodega
  );


/* NORTON */
insert into productor (Pro_Nombre,Pro_Dir_General) values
  (
  'NORTON',
  direcciongeneral('Ruta Provinvial 15, km 23.5 - Lujan de cuyo , Mendoza , 5509 , Argentina ','http://www.norton.com.ar','mesteller@norton.com.ar')
  ) returning pro_id as id_productor \gset
UPDATE productor set Pro_Dir_General.telefonos = array_append((Pro_Dir_General).telefonos,telefono(54,'261','4909700','oficina')) where pro_id = :id_productor;

insert into bodega (Bod_Nombre,Bod_Direccion,Bod_Fundacion,Bod_Dir_Tecnico,Bod_Descripcion,FK_Pais,FK_Bodega,FK_Productor) Values
  (
    'NORTON Bodega',
    'Ruta Provinvial 15, km 23.5 - Lujan de cuyo , Mendoza , 5509 , Argentina',
    '01-01-1895',
    'Jorge Riccitelli',
    'Asombrado por las características del lugar y alentado por su espíritu visionario, en 1985, el ingeniero inglés Edmund J. P. Norton plantó las primeras cepas importadas de Francia, dando origen a lo que en su momento fue la primera bodega al sur del Río Mendoza.\nEn 1989, el empresario austríaco Gernot Langes Swarovski viajó a Mendoza y experimentó esa misma fascinación por la belleza de la región, la calidez de su gente y las condiciones excepcionales para el cultivo de la vid. Guiado por la intuición y el convencimiento del alto potencial que representaba la vitivinicultura en Argentina, adquirió la bodega con el firme propósito de elaborar vinos que fueran reconocidos mundialmente por su calidad.',
    :id_pais,
    null,
    :id_productor
  ) returning bod_id as id_bodega \gset
select add_historia(:id_bodega, historiabodega(1895,'Edmund James Palmer Norton conoció el suelo mendocino durante la construcción del tren que unía Mendoza con Chile. Admirado por el terroir, fundó Bodega Norton al sur del río Mendoza con la plantación de vides importadas de Francia.'));
select add_historia(:id_bodega, historiabodega(1919,'Comienza la construcción de la Bodega actual.'));
select add_historia(:id_bodega, historiabodega(1970,'En manos de otra sociedad, Bodega Norton amplía sus instalaciones y se consolida como referente del vino Malbec en Argentina.'));
select add_historia(:id_bodega, historiabodega(1997,'Bodega Norton adquiere Finca La Colonia, una propiedad de más de 1000 hectáreas en el corazón de Agrelo, Luján de Cuyo. Así la superficie cultivable de la bodega se expandió a 1.265 has. de las que tiene en producción 705.'));
select add_historia(:id_bodega, historiabodega(2005,'Bodega Norton decide abrir sus puertas al turismo enológico, anticipándose al boom de los últimos años de la década'));
select add_historia(:id_bodega, historiabodega(2008,'Año en el que se modifica el frente y el área de turismo de la bodega. Norton re estiliza su fachada, convirtiéndose en una de las bodegas más impactantes de la zona.'));
select add_historia(:id_bodega, historiabodega(2011,'Bodega Norton es nominada por Wine Enthusiast como "New World Winery of the Year" (Mejor Bodega del Nuevo Mundo) en la edición 2011 de su concurso Wine Star Awards.'));


\lo_import ../imagenes/vinos/MALBECDOC_Norto.jpg
insert into marca (Mar_Nombre,Mar_Descripcion,Mar_Des_Cata,Mar_Temp_Servicio,Mar_Maduracion,Mar_Ventana,Mar_G_Alcohol,Mar_Acidez_Total,Mar_PH,Mar_Imagen,Mar_Tipo_Tapa,FK_Clasificacion,FK_Bodega) VALUES
  (
  'NORTON MALBEC DOC',
  'La distinción D.O.C., (Denominación de Origen Controlada), certifica que las uvas que lo originan sólo provienen de Luján de Cuyo, una de las regiones más notables para la elaboración de vinos de Argentina, y que cuenta con un especial proceso de añejamiento en barricas de Roble Francés y botella.',
  ('Color rojo violáceo intenso.','Aromas a ciruelas maduras, especias y pimienta negra','De buena estructura en boca, taninos dulces, redondo y aterciopelado.'),
  18,
  2,
  5,
  14.3,
  5.17,
  3.56,
  :LASTOID,
  'CORCHO',
  1,
  :id_bodega
  );

/* Luigi Bosca*/
insert into productor (Pro_Nombre,Pro_Dir_General) values
  (
  'Luigi Bosca',
  direcciongeneral('San Martín 2044, Mayor Drummond, Luján de Cuyo','http://www.luigibosca.com.ar','info@luigibosca.com.ar')
  ) returning pro_id as id_productor \gset
UPDATE productor set Pro_Dir_General.telefonos = array_append((Pro_Dir_General).telefonos,telefono(54,'261','4981974','oficina')) where pro_id = :id_productor;

insert into bodega (Bod_Nombre,Bod_Direccion,Bod_Fundacion,Bod_Dir_Tecnico,Bod_Descripcion,FK_Pais,FK_Bodega,FK_Productor) Values
  (
    'Luigi Bosca',
    'San Martín 2044, Mayor Drummond, Luján de Cuyo',
    '01-01-1901',
    'Lic. Vicente Garzia',
    'Fundada en 1901 por Don Leoncio Arizu, la Bodega Luigi Bosca cuenta con una extensa trayectoria en la industria vitivinícola nacional.\nDirigida actualmente por la tercera y cuarta generación, constituye una de las pocas bodegas que, a través de las décadas, permanece en manos de la familia fundadora y que, por su prestigio, se ha convertido en un paradigma del vino argentino.\nLos Arizu han trabajado desde siempre en la búsqueda de la máxima expresión del vino argentino y han sido protagonistas de los grandes cambios de la industria vitivinícola nacional. Los pilares sobre los cuales han logrado consolidar su trayectoria han sido la expansión a nivel internacional, su prestigio basado en la experiencia trasmitida a través de los años, la constante y homogénea calidad en los vinos y una búsqueda permanente de la excelencia mediante la innovación, el dinamismo y la tecnología de avanzada.',
    :id_pais,
    null,
    :id_productor
  ) returning bod_id as id_bodega \gset
select add_historia(:id_bodega, historiabodega(1901,'Fundada por Don Leoncio Arizu, la Bodega Luigi Bosca cuenta con una extensa trayectoria en la industria vitivinícola nacional.'));
select add_historia(:id_bodega, historiabodega(1989,'Luigi Bosca colaboró activamente en la fundación de la primera DOC en nuestro país en 1989, la Denominación de Origen de Luján de Cuyo, equiparándose con orgullo a otras DOC del mundo.'));

\lo_import ../imagenes/vinos/Luigi_Bosca_MALBEC_DOC.jpg
insert into marca (Mar_Nombre,Mar_Descripcion,Mar_Des_Cata,Mar_Temp_Servicio,Mar_Maduracion,Mar_Ventana,Mar_G_Alcohol,Mar_Acidez_Total,Mar_PH,Mar_Imagen,Mar_Tipo_Tapa,FK_Clasificacion,FK_Bodega) VALUES
  (
  'Luigi Bosca Malbec D.O.C.',
  'Luigi Bosca es la bodega pionera en elaborar un Malbec bajo la Denominación de Origen Luján de Cuyo. Por ello, se busca aquí la máxima expresión del terruño cosechando las uvas en su nivel justo de madurez y cuidando cada detalle de la elaboración. La cosecha 2011 no tuvo accidentes climáticos, por lo que se obtuvieron uvas de excelente calidad.',
  ('Genuino varietal de un profundo color violáceo','Se caracteriza por sus aromas a cerezas y ciruelas maduras.','Su estructura es sólida y su paso por boca, jugoso y elegante, con acidez equilibrada y gran redondez.'),
  18,
  2,
  10,
  14,
  4.8,
  3.6,
  :LASTOID,
  'CORCHO',
  1,
  :id_bodega
  );