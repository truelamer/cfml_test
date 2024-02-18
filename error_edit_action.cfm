<CFSCRIPT>
    status = true;
    message = 'Операция выполнена успешно';
</CFSCRIPT>
<CFIF (len(FORM.description_short) IS 0) OR (len(FORM.description_short) GT 100)>
    <CFSET status = false/>
    <CFSET message = 'Длина краткого описания должна быть от 1 до 200 символов! Текущая длина:' & len(FORM.description_short)/>
</CFIF>

<CFIF status IS true>
    <CFIF structKeyExists(FORM, 'id')>
        <CFQUERY DATASOURCE="cfml_test" NAME="update_error">
            UPDATE errors SET description_short = '#FORM.description_short#', description_full = '#FORM.description_full#',
                user_id = '#SESSION.userId#', urgently_id = '#FORM.urgently_id#', criticality_id = '#criticality_id#',
                date_edit = GETDATE()
            WHERE id = '#FORM.id#'
        </CFQUERY>
    <CFELSE>
        <CFQUERY DATASOURCE="cfml_test" NAME="create_error">
            INSERT INTO errors (description_short, description_full, user_id, status_id, urgently_id, criticality_id) VALUES
            ('#FORM.description_short#', '#FORM.description_full#', '#SESSION.userId#', 1, '#FORM.urgently_id#', '#FORM.criticality_id#')
        </CFQUERY>
    </CFIF>
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

