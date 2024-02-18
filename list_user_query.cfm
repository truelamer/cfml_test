<CFQUERY datasource="cfml_test" name="list_user">SELECT * FROM users ORDER BY id</CFQUERY>
<style>
    th { cursor: pointer; }
</style>
<table class="table table-bordered table-hover" id="list_user">
    <thead>
        <tr>
            <th>#</th>
            <th>Логин</th>
            <th>Имя</th>
            <th>Фамилия</th>
            <th class="sorter-false parser-false">Редактировать</th>
        </tr>
    </thead>
    <tbody>
        <CFOUTPUT query="list_user">
            <tr>
                <td>#CURRENTROW#</td>
                <td>#login#</td>
                <td>#first_name#</td>
                <td>#last_name#</td>
                <td>
                    <i class="bi bi-pencil-fill text-primary" onclick="openFormEditUser('#id#', '#login#', '#first_name#', '#last_name#')"></i>
                </td>
            </tr>
        </CFOUTPUT>
    </tbody>
</table>
<script>
    $("#list_user").tablesorter({
        headerTemplate: '{content}{icon}',
    });
</script>