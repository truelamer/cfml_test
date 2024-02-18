<CFQUERY datasource="cfml_test" name="list_error_statuses">
    SELECT ess.*, FORMAT(ess.date_create, 'dd.MM.yyyy hh:mm:ss') AS date_create_formatted, FORMAT(ess.date_edit, 'dd.MM.yyyy hh:mm:ss') AS date_edit_formatted,
    la.name AS activity_name, u.login
    FROM error_set_status ess
        LEFT JOIN list_activity la ON ess.activity_id = la.id
        LEFT JOIN users u ON ess.user_id = u.id
    WHERE ess.error_id = '#FORM.id#'
</CFQUERY>
<style>
    th { cursor: pointer; }
</style>
<CFOUTPUT><input type="hidden" id="main_error_id" value="#FORM.id#"></CFOUTPUT>
<table class="table table-bordered table-hover" id="list_error_status">
    <thead>
        <tr>
            <th>#</th>
            <th>Действие</th>
            <th>Комментарий</th>
            <th>Пользователь</th>
            <th>Дата создания</th>
            <th>Дата последнего изменения</th>
            <th class="sorter-false parser-false">Редактирование</th>
        </tr>
    </thead>
    <tbody>
        <CFOUTPUT query="list_error_statuses">
            <tr>
                <td>#CURRENTROW#</td>
                <td>#activity_name#</td>
                <td>#comment#</td>
                <td>#login#</td>
                <td>#date_create_formatted#</td>
                <td>#date_edit_formatted#</td>
                <td>
                    <i class="bi bi-pencil-fill text-primary" onclick="openFormEditErrorStatus('#id#', '#comment#')"></i>
                </td>
            </tr>
        </CFOUTPUT>
    </tbody>
</table>
<CFOUTPUT><button class="btn btn-success" onclick="openFormChangeStatus('#FORM.id#')">Поменять статус</button></CFOUTPUT>
<script>
    $("#list_error_status").tablesorter({
        headerTemplate: '{content}{icon}',
    });
</script>