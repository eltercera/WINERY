/* Para adregar una denominacion con su variedad*/
CREATE OR REPLACE FUNCTION add_den_var(
  v_nombre varchar(50),
  d_nombre varchar(50),
  v_tipo varchar(10) = NULL,
  d_descripcion text = NULL,
  d_creacion date = NULL,
  d_cat varchar(50) = NULL
) RETURNS void AS
$BODY$
DECLARE
  id_v integer;
  id_d integer;
BEGIN
  v_nombre = UPPER(v_nombre);
  d_nombre = UPPER(d_nombre);
  --definicion de ID Variedad
  SELECT INTO id_v Var_ID FROM VARIEDAD WHERE  v_nombre = ANY(Var_Nombres);
  IF NOT FOUND THEN
    IF v_tipo IS NOT NULL THEN
      INSERT INTO VARIEDAD (Var_Nombres,Var_Tipo_Uva) VALUES (ARRAY[v_nombre],v_tipo) RETURNING Var_ID into id_v;
    ELSE
      RAISE 'La variedad no existe y no se ha espesificado un tipo de Uva';
    END IF;
    RAISE NOTICE 'Nueva variedad ID %',id_v;
  ELSE
    RAISE NOTICE 'Variedad % encontrada. ID %',v_nombre,id_v;
  END IF;
  
  --definicion de ID Denominacion
  SELECT INTO id_d Den_ID FROM DENOMINACION WHERE UPPER(Den_nombre) = d_nombre;
  IF NOT FOUND THEN
    INSERT INTO DENOMINACION (Den_Nombre,Den_descripcion,den_creacion,den_categoria) VALUES (d_nombre,d_descripcion,d_creacion,d_cat) RETURNING Den_ID into id_d;
    RAISE NOTICE 'Nueva Denominacion ID %',id_v;
  ELSE
    RAISE NOTICE 'Denominacion % encontrada. ID %',Den_Nombre,id_d;
  END IF;
  INSERT INTO DEN_VAR (fk_denominacion,fk_variedad) VALUES (id_d,id_v);
END;
$BODY$
LANGUAGE plpgsql;


/* identificacion del consumidor */
CREATE OR REPLACE FUNCTION con_login(
  nombre varchar(25),
  apellido varchar(25),
  fn varchar(25),
  genero char = NULL,
  pais varchar(50) = NULL,
  ciudad varchar(50) = NULL,
  dereccion varchar(200) = NULL
) RETURNS integer AS
$BODY$
DECLARE
  id_con integer;
BEGIN
  IF nombre <> '' AND apellido <> '' AND fn <> '' THEN
    SELECT INTO id_con Con_ID from CONSUMIDOR WHERE UPPER(Con_Nombre) = UPPER(nombre) AND UPPER(Con_Apellido) = UPPER(apellido) AND Con_fecha_nac = to_date(fn,'DD-MM-YYYY');
    IF NOT FOUND THEN
	  IF genero <> '' AND dereccion <> '' AND pais <> '' AND ciudad <> '' THEN
        INSERT INTO CONSUMIDOR (con_nombre,con_apellido,con_genero,con_fecha_nac,con_direccion,fk_lugar) VALUES (nombre, apellido, genero,to_date(fn,'DD-MM-YYYY'),dereccion,set_lugar(pais,ciudad)) RETURNING Con_ID INTO id_con;
        RAISE NOTICE 'Se a agregado un nuevo Consumidor';
	  ELSE
	    RAISE NOTICE 'Los parametros no estan Completos';
        RETURN NULL;
	  END IF;
    END IF;
    RAISE NOTICE 'Entrada Satisfactoria';
    RETURN id_con;
  ELSE
    RAISE NOTICE 'Los parametros no estan Completos';
    RETURN NULL;
  END IF;
END;
$BODY$
LANGUAGE plpgsql;

/* Para Llenar la interseccion PAI_REG*/
CREATE OR REPLACE FUNCTION add_dv_pr(
  p_nombre varchar(50),
  r_nombre varchar(50),
  d_nombre varchar(50),
  v_nombre varchar(50)
) RETURNS void AS
$BODY$
DECLARE
  id_p integer;
  id_r integer;
  id_d integer;
  id_v integer;
BEGIN
  r_nombre = UPPER(r_nombre);
  p_nombre = UPPER(p_nombre);
  d_nombre = UPPER(d_nombre);
  v_nombre = UPPER(v_nombre);
  SELECT INTO id_p Pai_id FROM PAIS WHERE UPPER(Pai_Nombre) = p_nombre;
  IF NOT FOUND THEN
    RAISE 'Pais no % encontrado.',p_nombre;
  END IF;
  SELECT INTO id_r Reg_id FROM REGION WHERE UPPER(Reg_Nombre) = r_nombre;
  IF NOT FOUND THEN
    RAISE 'Region no % encontrado.',r_nombre;
  END IF;
  SELECT INTO id_v,id_d FK_Variedad,FK_denominacion FROM DEN_VAR, VARIEDAD, DENOMINACION WHERE UPPER(var_Nombres[1]) = v_nombre AND UPPER(Den_Nombre) = d_nombre AND FK_Variedad = Var_ID AND FK_Denominacion = Den_ID;
  IF NOT FOUND THEN
    RAISE 'La Denominacion + Variedad no existe.';
  END IF;
  INSERT INTO PAI_REG (fk_pais,fk_region) VALUES (id_p,id_r);
  INSERT INTO DV_PR (fk_pais,fk_region,fk_Variedad,fk_Denominacion) VALUES (id_p,id_r,id_v,id_d);
END;
$BODY$
LANGUAGE plpgsql;

/* Para Agregar Viñedo*/
CREATE OR REPLACE FUNCTION add_vinedo(
  p_nombre varchar(50),
  r_nombre varchar(50),
  d_nombre varchar(50),
  v_nombre varchar(50),
  b_nombre varchar(50),
  vi_nombre varchar(50)
) RETURNS void AS
$BODY$
DECLARE
  id_p integer;
  id_r integer;
  id_d integer;
  id_b integer;
  id_v integer;
BEGIN
  r_nombre = UPPER(r_nombre);
  p_nombre = UPPER(p_nombre);
  d_nombre = UPPER(d_nombre);
  v_nombre = UPPER(v_nombre);
  b_nombre = UPPER(b_nombre);
  SELECT INTO id_p Pai_id FROM PAIS WHERE UPPER(Pai_Nombre) = p_nombre;
  IF NOT FOUND THEN
    RAISE 'Pais no % encontrado.',p_nombre;
  END IF;
  SELECT INTO id_r Reg_id FROM REGION WHERE UPPER(Reg_Nombre) = r_nombre;
  IF NOT FOUND THEN
    RAISE 'Region no % encontrado.',r_nombre;
  END IF;
  SELECT INTO id_b Bod_id FROM BODEGA WHERE UPPER(Bod_Nombre) = b_nombre;
  IF NOT FOUND THEN
    RAISE 'Bodega no % encontrado.',b_nombre;
  END IF;
  SELECT INTO id_v,id_d,id_p,id_r d.FK_Variedad,d.FK_denominacion,d.FK_pais,d.FK_region
    FROM DV_PR d, VARIEDAD, DENOMINACION, PAIS, REGION r
    WHERE UPPER(var_Nombres[1]) = v_nombre AND UPPER(Den_Nombre) = d_nombre
    AND UPPER(Pai_Nombre) = p_nombre AND UPPER(r.Reg_Nombre) = r_nombre
    AND d.FK_Variedad = Var_ID AND d.FK_Denominacion = Den_ID
    AND d.FK_PAIS = Pai_ID AND d.FK_REGION = r.Reg_ID;
  IF NOT FOUND THEN
    RAISE 'La Denominacion + Variedad no existe.';
  END IF;
  INSERT INTO VINEDO (fk_pais,fk_region,fk_Variedad,fk_Denominacion,Vin_Nombre,Vin_Hect_cult,fk_bodega) VALUES (id_p,id_r,id_v,id_d,v_nombre,ARRAY[]::cultivo[],id_b);
END;
$BODY$
LANGUAGE plpgsql;





