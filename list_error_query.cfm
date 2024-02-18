<CFQUERY datasource="cfml_test" name="list_error">
    SELECT e.*, FORMAT(e.date_create, 'dd.MM.yyyy hh:mm:ss') AS date_create_formatted, FORMAT(e.date_edit, 'dd.MM.yyyy hh:mm:ss') AS date_edit_formatted,
    ls.name AS status_name, lc.name AS criticality_name, lu.name AS urgently_name, u.login FROM errors e
        LEFT JOIN list_status ls ON e.status_id = ls.id
        LEFT JOIN list_criticality lc ON e.criticality_id = lc.id
        LEFT JOIN list_urgently lu ON e.urgently_id = lu.id
        LEFT JOIN users u ON e.user_id = u.id
    ORDER BY e.id
</CFQUERY>
<style>
    th { cursor: pointer; }
</style>
<table class="table table-bordered table-hover" id="list_error">
    <thead>
        <tr>
            <th>#</th>
            <th>Краткое описание</th>
            <th>Полное описание</th>
            <th>Статус</th>
            <th>Срочность</th>
            <th>Критичность</th>
            <th>Пользователь</th>
            <th>Дата создания</th>
            <th>Дата последнего изменения</th>
            <th class="sorter-false parser-false">Операции</th>
        </tr>
    </thead>
    <tbody>
        <CFOUTPUT query="list_error">
            <tr>
                <td>#CURRENTROW#</td>
                <td>#description_short#</td>
                <td>#description_full#</td>
                <td>#status_name#</td>
                <td>#urgently_name#</td>
                <td>#criticality_name#</td>
                <td>#login#</td>
                <td>#date_create_formatted#</td>
                <td>#date_edit_formatted#</td>
                <td>
                    <i class="bi bi-pencil-fill text-primary" onclick="openFormEditError('#id#', '#description_short#', '#description_full#', '#urgently_id#',
                        '#criticality_id#')">
                    </i>
                    <i class="bi bi-search text-primary" onclick="getListErrorStatuses('#id#')"></i>
                </td>
            </tr>
        </CFOUTPUT>
    </tbody>
</table>
<script>
    $("#list_error").tablesorter({
        headerTemplate: '{content}{icon}',
    });
</script>