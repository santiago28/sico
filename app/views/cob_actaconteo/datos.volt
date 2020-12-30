{{ content() }}
{{ elements.getActamenu(acta) }}
<table class="table table-bordered table-striped">
	<tbody>
		{% if(periodo_tipo != 2) %} <!-- Daniel Gallo 02/03/2017 -->
		<tr>
			<td>1. TOTAL DE NIÑOS Y NIÑAS QUE EFECTIVAMENTE ASISTIERON</td>
			<td>{{ asiste1 }}</td>
		</tr>
		<tr>
			<td>2. TOTAL DE NIÑOS Y NIÑAS AUSENTES CON EXCUSA FISICA VALIDA</td>
			<td>{{ asiste2 }}</td>
		</tr>
		<tr>
			<td>3. TOTAL DE NIÑOS Y NIÑAS AUSENTES CON EXCUSA TELEFONICA VALIDA</td>
			<td>{{ asiste3 }}</td>
		</tr>
		<tr>
			<td>4. TOTAL DE NIÑOS Y NIÑAS RETIRADOS ANTES DEL DIA DE CORTE DE PERIODO</td>
			<td>{{ asiste4 }}</td>
		</tr>
		<tr>
			<td>5. TOTAL DE NIÑOS Y NIÑAS RETIRADOS DESPUES DEL DIA DE CORTE DE PERIODO</td>
			<td>{{ asiste5 }}</td>
		</tr>
		<tr>
			<td>6. TOTAL DE NIÑOS Y NIÑAS AUSENTES QUE NO PRESENTAN EXCUSA EL DIA DEL REPORTE</td>
			<td>{{ asiste6 }}</td>
		</tr>
		<tr>
			<td>7. TOTAL DE NIÑOS Y NIÑAS CON EXCUSA MEDICA MAYOR O IGUAL A 15 DÍAS</td>
			<td>{{ asiste7 }}</td>
		</tr>
		<tr>
			<td>8. TOTAL DE NIÑOS Y NIÑAS CON EXCUSA MEDICA MENOR A 15 DÍAS</td>
			<td>{{ asiste8 }}</td>
		</tr>
		{% if((acta.recorrido == 3 and acta.id_periodo == 70) or acta.recorrido_virtual == 1) %}
		<tr>
			<td>9. GESTIÓN TELEFÓNICA Y/O REVISIÓN DOCUMENTAL VÁLIDA CONFIRMANDO ATENCIÓN</td>
			<td>{{ asiste9 }}</td>
		</tr>
		<tr>
			<td>10. GESTIÓN TELEFÓNICA Y/O REVISIÓN DOCUMENTAL INVÁLIDA NEGANDO ATENCIÓN</td>
			<td>{{ asiste10 }}</td>
		</tr>
		{% endif %}
		<tr>
			<td><strong>TOTAL LISTADO DE NIÑOS Y NIÑAS REPORTADOS EN EL SIBC</strong></td>
			<td>{{ asistetotal }}</td>
		</tr>
		<tr>
			<td><strong>TOTAL NIÑOS ADICIONALES INGRESADOS</strong></td>
			<td>{{ asisteadicionales }}</td>
		</tr>
		{% else %}
		<tr>
			<td>1.1 ASISTE</td>
			<td>{{ asiste1 }}</td>
		</tr>
		<tr>
			<td>1.2 RETIRADO</td>
			<td>{{ asiste2 }}</td>
		</tr>
		<tr>
			<td>1.3 AUSENTE</td>
			<td>{{ asiste3 }}</td>
		</tr>
		<tr>
			<td>1.4 BENEFICIARIO CON EXCUSA VALIDA</td>
			<td>{{ asiste4 }}</td>
		</tr>
		<tr>
			<td>1.5 GESTIÓN TELEFÓNICA Y/O REVISIÓN DOCUMENTAL VÁLIDA CONFIRMANDO ATENCIÓN</td>
			<td>{{ asiste5 }}</td>
		</tr>
		<tr>
			<td>1.6 GESTIÓN TELEFÓNICA Y/O REVISIÓN DOCUMENTAL INVÁLIDA NEGANDO ATENCIÓN</td>
			<td>{{ asiste6 }}</td>
		</tr>
		{# <tr>
			<td>1.7 ENCUENTRO EN CASA</td>
			<td>{{ asiste7 }}</td>
		</tr> #}
		{% endif %}
	</tbody>
</table>
{{ form("cob_actaconteo/guardardatos/"~id_actaconteo, "method":"post", "class":"form-container form-horizontal", "parsley-validate" : "", "enctype" : "multipart/form-data") }}
<div class="form-group">
	<label class="col-sm-2 control-label" for="fecha">* Fecha Interventoría</label>
	<div class="col-sm-10">
		{{ text_field("fecha", "type" : "date", "class" : "form-control tipo-fecha required", "placeholder" : "dd/mm/aaaa", "parsley-type" : "dateIso", "data-date-format" : "dd/mm/yyyy") }}
	</div>
</div>
<div class="form-group">
	{% if((acta.recorrido == 3 and acta.id_periodo == 70) or acta.recorrido_virtual == 1) %}
	<label class="col-sm-2 control-label" for="horaInicio">* Hora Inicio Virtual</label>
	{% else %}
	<label class="col-sm-2 control-label" for="horaInicio">* Hora Inicio</label>
	{% endif %}
	<div class="col-sm-10">
		{{ text_field("horaInicio", "placeholder": "Ej: 08:30 am", "class" : "form-control required") }}
	</div>
</div>
<div class="form-group">
	{% if((acta.recorrido == 3 and acta.id_periodo == 70) or acta.recorrido_virtual == 1) %}
	<label class="col-sm-2 control-label" for="horaFin">* Hora Fin Virtual</label>
	{% else %}
	<label class="col-sm-2 control-label" for="horaFin">* Hora Fin</label>
	{% endif %}
	<div class="col-sm-10">
		{{ text_field("horaFin", "placeholder": "Ej: 09:00 am", "class" : "form-control required") }}
	</div>
</div>
{% if(periodo_tipo != 2) %}
{% if((acta.recorrido == 3 and acta.id_periodo == 70) or acta.recorrido_virtual == 1) %}

{% else %}
<div class="form-group">
	<label class="col-sm-2 control-label" for="nombreEncargado">* Nombre Encargado de la Sede</label>
	<div class="col-sm-10">
		{{ text_field("nombreEncargado", "class" : "form-control required") }}
	</div>
</div>
{% endif %}
{% else %}
{{ hidden_field("nombreEncargado", "value": "N/A") }}
<div class="form-group">
	<label class="col-sm-2 control-label" for="encuentroSede">* El encuentro se realizó en la sede matriculada</label>
	<div class="col-sm-10">
		{{ select("encuentroSede", sino, "class" : "form-control encuentroSede required") }}
	</div>
</div>
<div id="servicio-item" class="form-group hidden servicio">
	<label class="col-sm-2 control-label" for="nombreSede">* Nombre de la sede donde prestó el servicio</label>
	<div class="col-sm-10">
		{{ text_field("nombreSede", "placeholder" : "Nombre de la sede donde prestó el servicio", "class" : "form-control required hidden servicio", "disabled" : "disabled") }}
	</div>
</div>
<!--<div class="form-group">
<label class="col-sm-2 control-label" for="mosaicoSanitario">* Cuenta con servicio sanitario, lavamanos, energía eléctrica y agua potable</label>
<div class="col-sm-10">
{{ select("mosaicoSanitario", sino, "class" : "form-control required") }}
</div>
</div>
<div class="form-group">
<label class="col-sm-2 control-label" for="mosaicoSeguridad" placeholder="Plan de Ordenamiento Territorial">* Cuenta con condiciones minimas (POT)</label>
<div class="col-sm-10">
{{ select("mosaicoSeguridad", sino, "class" : "form-control required") }}
</div>
</div>-->
<div class="form-group">
	<label class="col-sm-2 control-label" for="mosaicoEncuentro" placeholder="Plan de Ordenamiento Territorial">El encuentro se realizó</label>
	<div class="col-sm-10">
		{{ select("mosaicoEncuentro", tipo_encuentro, "class" : "form-control required") }}
	</div>
</div>
<div class="form-group">
	<label class="col-sm-2 control-label" for="gruposVisitados">* Cantidad de grupos visitados</label>
	<div class="col-sm-10">
		{{ text_field("gruposVisitados", "class" : "form-control required grupos") }}
	</div>
</div>

{% endif %}
{% if((acta.recorrido == 3 and acta.id_periodo == 70) or acta.recorrido_virtual == 1) %}
{% else %}
<div class="form-group">
	<label class="col-sm-2 control-label" for="vallaClasificacion">* Valla de Identificación</label>
	<div class="col-sm-10">
		{{ select("vallaClasificacion", valla_sede, "class" : "form-control required") }}
	</div>
</div>

<div class="form-group">
	<label class="col-sm-2 control-label" for="correccionDireccion">Corrección Dirección Sede</label>
	<div class="col-sm-10">
		{{ text_field("correccionDireccion", "class" : "form-control") }}
	</div>
</div>
{% if(periodo_tipo != 2) %}
<div class="form-group">
	<label class="col-sm-2 control-label" for="mosaicoFisico">* Cuenta con Registro Fotográfico Físico</label>
	<div class="col-sm-10">
		{{ select("mosaicoFisico", sino, "class" : "form-control required	") }}
	</div>
</div>
<div class="form-group">
	<label class="col-sm-2 control-label" for="mosaicoDigital">* Cuenta con Registro Fotográfico Digital</label>
	<div class="col-sm-10">
		{{ select("mosaicoDigital", sino, "class" : "form-control required") }}
	</div>
</div>
{% endif %}
{% endif %}
<div class="form-group">
	<label class="col-sm-2 control-label" for="observacionUsuario">Observación Interventor</label>
	<div class="col-sm-10">
		{% if((acta.recorrido == 3 and acta.id_periodo == 70) or acta.recorrido_virtual == 1) %}
		{{ text_area("observacionUsuario", "rows" : "4", "class" : "form-control", "value" : "Tras la declaratoria de “Emergencia Sanitaria” en todo el territorio colombiano por parte del Ministerio de Salud y Protección Social, según Resolución 385 del 12 de marzo de 2020 y de calamidad pública por Decreto Municipal 373 del 16 de marzo de 2020, el Programa Buen Comienzo impartió mediante Circular 20206000078 del 17 de marzo de 2020, unas orientaciones para la “flexibilización de la atención como medida de contención en la propagación del COVID19”, tendientes a garantizar la prestación del servicio de atención integral a la primera infancia a través de diferente estrategias por parte de las entidades prestadoras del servicio, las cuales deben ser objeto de verificación por parte de la interventoría, a través medios no presenciales. Adicional a lo anterior, mediante Decreto 457 del 22 de marzo de 2020, el Gobierno Nacional ordenó el aislamiento preventivo obligatorio de todas las personas habitantes de la República de Colombia, entre el 25 de marzo y el 13 de abril de 2020, con algunas excepciones. Con fundamento en lo anterior, el equipo de interventoría realiza labores de seguimiento y verificación, haciendo uso de herramientas de las TIC`s, que permitan en forma remota certificar el cumplimiento de cada contrato o convenio de asociación, para lo cual las actas generadas llevarán únicamente la firma del técnico de conteo encargado de hacer la gestión telefónica con las familias y revisar las fuentes documentales. El consolidado final niño a niño del periodo, en las modalidades: institucional 8 horas, jardines infantiles, entorno familiar y ludotekas. podrá ser consultadas en la pagina  http://asesoriayconsultoria.pascualbravo.edu.co:10001/2020/interventoria/index.html.") }}
		{% else %}
		{{ text_area("observacionUsuario", "rows" : "4", "class" : "form-control") }}
{% endif %}
	</div>
</div>
{% if((acta.recorrido == 3 and acta.id_periodo == 70) or acta.recorrido_virtual == 1) %}
{% else %}
<div class="form-group">
	<label class="col-sm-2 control-label" for="observacionEncargado">Observación Encargado Sede</label>
	<div class="col-sm-10">
		{{ text_area("observacionEncargado", "rows" : "4", "class" : "form-control") }}
	</div>
</div>
{% endif %}
{% if acta.id_modalidad == 12 %}
<div class="form-group">
	<label class="col-sm-2 control-label" for="estadoVisita">* Estado de la visita</label>
	<div class="col-sm-10">
		{{ select("estadoVisita", estadoVisita, "class" : "form-control required") }}
	</div>
</div>
<div class="form-group">
	<label class="col-sm-2 control-label" for="numeroEncuentos">* Número de Encuentros</label>
	<div class="col-sm-10">
		{{ select("numeroEncuentos", numeroEncuentos, "class" : "form-control required") }}
	</div>
</div>
<div class="form-group">
	<label class="col-sm-2 control-label" for="gestionTelefonica">Gestión Telefonica</label>
	<div class="col-sm-10">
		{{ text_area("gestionTelefonica", "rows" : "4", "class" : "form-control") }}
	</div>
</div>
{% endif %}
<div class="form-group">
	<div class="col-sm-offset-2 col-sm-10">
		{{ submit_button("Guardar", "class" : "btn btn-default") }}
	</div>
</div>
</form>
<script>
setTimeout(function(){
	$(document).ready(function(){
		$("#fecha").datepicker({
			language: 'es',
			autoclose: true,
		});
		document.getElementsByClassName("grupos")[0].setAttribute("type", "number");
	});
},1000);
</script>
