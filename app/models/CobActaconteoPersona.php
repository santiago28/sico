<?php

class CobActaconteoPersona extends \Phalcon\Mvc\Model
{

  /**
  *
  * @var integer
  */
  public $id_actaconteo_persona;

  /**
  *
  * @var integer
  */
  public $id_actaconteo;

  /**
  *
  * @var integer
  */
  public $id_periodo;

  /**
  *
  * @var integer
  */
  public $recorrido;

  /**
  *
  * @var integer
  */
  public $id_contrato;

  /**
  *
  * @var integer
  */
  public $id_persona;

  /**
  *
  * @var string
  */
  public $numDocumento;

  /**
  *
  * @var string
  */
  public $primerNombre;

  /**
  *
  * @var string
  */
  public $segundoNombre;

  /**
  *
  * @var string
  */
  public $primerApellido;

  /**
  *
  * @var string
  */
  public $segundoApellido;

  /**
  *
  * @var integer
  */
  public $id_grupo;

  /**
  *
  * @var string
  */
  public $grupo;

  /**
  *
  * @var string
  */
  public $fechaInterventoria;

  /**
  *
  * @var integer
  */
  public $tipoPersona;

  /**
  *
  * @var integer
  */
  public $asistencia;

  //Virtual Foreign Key para poder acceder a la fecha de corte del acta
  public function initialize()
  {
    $this->belongsTo('id_actaconteo_persona', 'CobActaconteoPersonaExcusa', 'id_actaconteo_persona', array(
      'reusable' => true
    ));
    $this->belongsTo('id_actaconteo_persona', 'CobActaconteoPersonaFacturacion', 'id_actaconteo_persona', array(
      'reusable' => true
    ));
    $this->belongsTo('id_actaconteo', 'CobActaconteo', 'id_actaconteo', array(
      'reusable' => true
    ));
  }

  /**
  * Returns a human representation of 'estado'
  *
  * @return string
  */
  public function getAsistenciaDetail()
  {
    switch ($this->asistencia) {
      case 6:
      return " class='warning'";
      break;
      case 4:
      return " class='warning'";
      break;
      case 5:
      return " class='warning'";
      break;
      case 13:
      return " class='warning'";
      break;
      default:
      return "";
      break;
    }
  }

  /**
  * Returns a human representation of 'estado'
  *
  * @return string
  */
  public function getAsistenciaDetail2()
  {
    switch ($this->asistencia) {
      case 2:
      return " class='warning'";
      break;
      case 3:
      return " class='warning'";
      break;
      case 5:
      return " class='success'";
      break;
      case 7:
      return " class='info'";
      break;
      default:
      return "";
      break;
    }
  }

  public function getAsistenciaActasDetail($id_modalidad)
  {
    if ($id_modalidad == 5) {
      switch ($this->asistencia) {
        case 1:
        return "ASISTE";
        break;
        case 2:
        return "RETIRADO";
        break;
        case 3:
        return "AUSENTE";
        break;
        case 4:
        return "BENEFICIARIO CON EXCUSA VALIDA";
        break;
        case 5:
        return "AUSENTE CON LLAMADA TELEFÓNICA CONFIRMANDO ATENCIÓN";
        break;
        case 6:
        return "AUSENTE CON LLAMADA TELEFÓNICA NEGANDO ATENCIÓN";
        break;
        default:
        return "";
        break;
      }
    }else{
      switch ($this->asistencia) {
        case 1:
        return "PRESENTE";
        break;
        case 2:
        return "AUSENTE CON EXCUSA FÍSICA";
        break;
        case 3:
        return "AUSENTE CON EXCUSA TELEFÓNICA";
        break;
        case 4:
        return "RETIRADO ANTES DEL DÍA DE CORTE DE PERIODO";
        break;
        case 5:
        return "RETIRADO DESPUES DEL DÍA DE CORTE DE PERIODO";
        break;
        case 6:
        return "AUSENTE QUE NO PRESENTA EXCUSA EL DÍA DEL REPORTE";
        break;
        case 7:
        return "CON EXCUSA MÉDICA MAYOR O IGUAL A 15 DIAS";
        break;
        case 8:
        return "CON EXCUSA MÉDICA MENOR A 15 DIAS";
        break;
        case 9:
        return "GESTIÓN TELEFÓNICA Y/O REVISIÓN DOCUMENTAL VÁLIDA CONFIRMANDO ATENCIÓN";
        break;
        case 13:
        return "GESTIÓN TELEFÓNICA Y/O REVISIÓN DOCUMENTAL INVÁLIDA NEGANDO ATENCIÓN";
        break;
        default:
        return "";
        break;
      }
    }
  }
}
