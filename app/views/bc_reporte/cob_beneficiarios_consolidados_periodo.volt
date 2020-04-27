 {{ content() }}

 <style>
 .principal {
   /* background: yellow; */
   height: 500px;
   /*IMPORTANTE*/
   display: flex;
   justify-content: center;
   align-items: center;
 }

 .secundario {
   /* background: red; */
   width: 480px;
 }
 </style>

 <div class="principal">
   <div class="secundario"><h3>Generando reporte consolidado...</h3></div>
 </div>


<script>
setTimeout(function(){
$(document).ready(function(){

		var Export = [];
		{% for beneficiario in beneficiarios %}
		Export.push({
			"id_actaconteo_persona": "{{ beneficiario.id_actaconteo_persona }}",
			"id_actaconteo_persona_facturacion": "{{ beneficiario.id_actaconteo_persona_facturacion }}",
			"id_actaconteo": "{{ beneficiario.id_actaconteo }}",
			"id_periodo": "{{ beneficiario.id_periodo }}",
			"recorrido": "{{ beneficiario.recorrido }}",
			"id_contrato": "{{ beneficiario.id_contrato }}",
			"id_persona": "{{ beneficiario.id_persona }}",
			"numDocumento": "{{ beneficiario.numDocumento }}",
			"primerNombre": "{{ beneficiario.primerNombre }}",
			"segundoNombre": "{{ beneficiario.segundoNombre }}",
			"primerApellido": "{{ beneficiario.primerApellido }}",
			"segundoApellido": "{{ beneficiario.segundoApellido }}",
			"	id_grupo": "{{ beneficiario.	id_grupo }}",
			"grupo": "{{ beneficiario.grupo }}",
			"fechaInterventoria": "{{ beneficiario.fechaInterventoria }}",
			"fechaNacimiento": "{{ beneficiario.fechaNacimiento }}",
			"asistencia": "{{ beneficiario.asistencia }}",
			"asistencia_texto": "{{ beneficiario.getAsistenciaActasDetail(beneficiario.CobActaconteo.id_modalidad) }}",
			"cicloVital": "{{ beneficiario.cicloVital }}",
			"tipoPersona": "{{ beneficiario.tipoPersona }}",
			"urlAdicional": "{{ beneficiario.urlAdicional }}",
			"observacionAdicional": "{{ beneficiario.observacionAdicional }}"
		});
		{% endfor %}
		alasql('SELECT * INTO XLSX("Reporte Niño a Niño Periodo.xlsx",{headers:true}) FROM ?', [Export]);
		window.close();
});
},1000);
</script>
