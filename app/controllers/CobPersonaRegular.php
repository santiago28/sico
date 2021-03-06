<?php

class CobPersonaRegular extends \Phalcon\Mvc\Model
{

  /**
  *
  * @var integer
  */
  public $id_persona_regular;


  public $entidad;


  public $grado;


  public $numDocumento;


  public $primerNombre;


  public $segundoNombre;


  public $primerApellido;


  public $segundoApellido;


  public $legalizaMatricula;


  public $confirmeGrado;


  public $confirmeNumDocumento;


  public $fechaMatricula;


  public $numeroFolio;


  public $confirmeSedeLegalizaMatricula;

  public function cargarBdRegularConfesiones($carga){
    $db = $this->getDI()->getDb();
    $config = $this->getDI()->getConfig();
    $timestamp = new DateTime();
    $tabla_mat = "m" . $timestamp->getTimestamp();
    $archivo_mat = $config->application->basePath . "public/files/bc_bd/" . $carga->nombreMat;
    $db->query("CREATE TEMPORARY TABLE $tabla_mat (numeroContrato VARCHAR(15), entidad VARCHAR(100), 	institucion VARCHAR(100), grado2019 varchar(3), grado2020 varchar(3), numDocumento VARCHAR(100), primerNombre VARCHAR(100), segundoNombre VARCHAR(100), primerApellido VARCHAR(100), segundoApellido VARCHAR(100), 	legalizaMatricula VARCHAR(5), confirmeGrado VARCHAR(30), confirmeNumDocumento VARCHAR(30), 	fechaMatricula DATE, numeroFolio VARCHAR(29), confirmeSedeLegalizaMatricula VARCHAR(30)) CHARACTER SET utf8 COLLATE utf8_bin");
    $db->query("LOAD DATA INFILE '$archivo_mat' IGNORE INTO TABLE $tabla_mat FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 LINES (@CONTRATO, @ENTIDAD, @INSTITUCION, @GRADO_2019, @GRADO_2020, @DOCUMENTO, @APELLIDO1, @APELLIDO2, @NOMBRE1, @NOMBRE2, @LEGALIZA_MATRICULA, @CONFIRME_GRADO, @CONFIRME_DOCUMENTO, @FECHA_MATRICULA, @NUMERO_FOLIO, @CONFIRME_SEDE_MATRICULA) SET numeroContrato = @CONTRATO, entidad = @ENTIDAD, 	institucion = @INSTITUCION, grado2019 = @GRADO_2019, grado2020 = @GRADO_2020, numDocumento = @DOCUMENTO, primerNombre = REPLACE(@NOMBRE1, '\"',\"\"), segundoNombre = REPLACE(@NOMBRE2, '\"',\"\"), primerApellido = TRIM(REPLACE(@APELLIDO1, '\"',\"\")), segundoApellido = TRIM(REPLACE(@APELLIDO2, '\"',\"\")), legalizaMatricula = @LEGALIZA_MATRICULA, confirmeGrado = @CONFIRME_GRADO, confirmeNumDocumento = @CONFIRME_DOCUMENTO, fechaMatricula = @FECHA_MATRICULA, 	numeroFolio = @NUMERO_FOLIO, confirmeSedeLegalizaMatricula = @CONFIRME_SEDE_MATRICULA");

    $db->query("INSERT IGNORE INTO cob_persona_regular_confesiones (numeroContrato, entidad, institucion, grado2019, grado2020 , numDocumento, primerNombre, segundoNombre, primerApellido, segundoApellido, legalizaMatricula, confirmeGrado, confirmeNumDocumento, fechaMatricula, numeroFolio, confirmeSedeLegalizaMatricula) SELECT numeroContrato, entidad, institucion, grado2019, grado2020, numDocumento, primerNombre, segundoNombre, primerApellido, segundoApellido, legalizaMatricula, confirmeGrado, confirmeNumDocumento, fechaMatricula, numeroFolio, confirmeSedeLegalizaMatricula FROM $tabla_mat WHERE $tabla_mat.numDocumento NOT IN (SELECT numDocumento FROM cob_persona_regular_confesiones)");
    // return TRUE;
  }
}
