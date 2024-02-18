<CFSCRIPT>
    status = true;
    message = 'Операция выполнена успешно';
</CFSCRIPT>
<CFIF (len(FORM.comment) IS 0)>
    <CFSET status = false/>
    <CFSET message = 'Комментарий не может быть пустой'/>
</CFIF>

<CFIF status IS true>
    <CFQUERY DATASOURCE="cfml_test" NAME="update_error_status">
        UPDATE error_set_status SET comment = '#FORM.comment#' WHERE id = '#FORM.id#'
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

