<CFSCRIPT>
    status = true;
    message = 'Операция выполнена успешно';
</CFSCRIPT>
<CFIF (len(FORM.comment) IS 0)>
    <CFSET status = false/>
    <CFSET message = 'Комментарий не может быть пустой'/>
</CFIF>

<CFIF status IS true>
    <CFQUERY datasource="cfml_test" name="error_status" >
        SELECT * FROM errors WHERE id = #FORM.id#
    </CFQUERY>
    <CFQUERY datasource="cfml_test" name="list_availability_statuses" >
        SELECT set_status_id FROM list_activity_to_status
        WHERE current_status_id = #error_status.status_id# AND activity_id = #FORM.activity_id#
    </CFQUERY>
    <CFQUERY datasource="cfml_test" name="update_status_error" >
        UPDATE errors SET user_id = '#SESSION.userId#', date_edit = GETDATE(), status_id = '#list_availability_statuses.set_status_id#'
        WHERE id = '#FORM.id#'
    </CFQUERY>
    <CFQUERY datasource="cfml_test" name="add_error_set_status">
        INSERT INTO error_set_status (activity_id, comment, user_id, error_id) VALUES ('#FORM.activity_id#', '#FORM.comment#',
            '#SESSION.userId#', '#FORM.id#')
    </CFQUERY>
</CFIF>

<CFSCRIPT>
    response = structNew();
    structInsert(response,"status",status);
    structInsert(response,"message",message);
</CFSCRIPT>

<CFSET json = serializeJSON(response)>
<CFOUTPUT>
    #json#
</CFOUTPUT>


