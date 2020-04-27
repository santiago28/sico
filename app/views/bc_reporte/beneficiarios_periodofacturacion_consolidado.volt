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
      "Nombre sede": "{{ beneficiario.CobActaconteo.sede_nombre }}",
      "Nombre Grupo": "{{ beneficiario.grupo }}",
      "ID Persona": "{{ beneficiario.id_persona }}",
      "Número documento": "{{ beneficiario.numDocumento }}",
      "Primer Nombre": "{{ beneficiario.primerNombre }}",
      "Segundo Nombre": "{{ beneficiario.segundoNombre }}",
      "Primer Apellido": "{{ beneficiario.primerApellido }}",
      "Segundo Apellido": "{{ beneficiario.segundoApellido }}",
      "Fecha Registro Matricula": "{{ beneficiario.fechaRegistro }}",
      "Fecha Registro Beneficiario": "{{ beneficiario.fechaInicioAtencion }}",
      "Fecha Retiro": "{{ beneficiario.fechaRetiro }}",
      "Asistencia  R1": "{{ beneficiario.asistencia1 }}",
      "Asistencia 1": "{{ beneficiario.getAsistenciaActas1Detail(beneficiario.CobActaconteo.id_modalidad) }}",
      "Asistencia R2": "{{ beneficiario.asistencia2 }}",
      "Asistencia 2": "{{ beneficiario.getAsistenciaActas2Detail(beneficiario.CobActaconteo.id_modalidad) }}",
      "Asistencia R3": "{{ beneficiario.asistencia3 }}",
      "Asistencia 3": "{{ beneficiario.getAsistenciaActas3Detail(beneficiario.CobActaconteo.id_modalidad) }}",
      "Certificación Facturación": "{{ beneficiario.getCertificacionFacturacion() }}"
    })
    {% endfor %}
    alasql('SELECT * INTO XLSX("Reporte Niño a Niño de Facturación.xlsx",{headers:true}) FROM ?', [Export]);
    window.close();
  });
},1000);
</script>
