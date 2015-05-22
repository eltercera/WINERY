\prompt 'Nombre Variedad: ' variedad
\prompt 'DOC_Nombre: ' doc
\prompt 'Tipo UVA: ' t_uva
\prompt 'DOC_Description: ' doc_des
\prompt 'DOC_Creacion: ' doc_creacion
\prompt 'DOC_categoria: ' doc_cat
SELECT add_den_var(:'variedad',:'doc',:'t_uva',:'doc_des',date(:'doc_creacion'),:'doc_cat');
