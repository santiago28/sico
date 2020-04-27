
{{ content() }}
<h1>Contratos</h1>
<table class="table table-bordered table-hover">
	<thead>
		<tr>
			<th>Prestador</th>
			<th>Número contrato</th>
			<th>Modalidad</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>{{ link_to("bc_reporte/oferente_periodos_consolidado", "REPORTE CONSOLIDADO R1 - R2 - R3") }}</td>
			<td>{{ link_to("bc_reporte/oferente_periodos_consolidado", "TODOS") }}</td>
			<td>{{ link_to("bc_reporte/oferente_periodos_consolidado", "TODAS") }}</td>
		</tr>
		{% for contrato in contratos %}
		<tr>
			<td>{{ link_to("bc_reporte/oferente_periodos/"~contrato.id_contrato, contrato.oferente_nombre) }}</td>
			<td>{{ link_to("bc_reporte/oferente_periodos/"~contrato.id_contrato, contrato.id_contrato) }}</td>
			<td>{{ link_to("bc_reporte/oferente_periodos/"~contrato.id_contrato, contrato.modalidad_nombre) }}</td>
		</tr>
		{% endfor %}
	</tbody>
</table>
