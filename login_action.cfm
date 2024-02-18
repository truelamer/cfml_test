<CFIF (len(FORM.login) IS 0) OR (len(FORM.password) IS 0)>
    <CFSET status = false/>
    <CFSET message = 'Логин и пароль не могут быть пустыми!'/>
<CFELSE>
    <CFQUERY DATASOURCE="cfml_test" NAME="found_users">
        SELECT id FROM users
        WHERE login = '#FORM.login#' AND password = '#FORM.password#'
    </CFQUERY>

    <CFIF found_users.recordcount IS 0>
        <CFSET status = false/>
        <CFSET message = 'Неправильно указаны логин или пароль. Повторите попытку'/>
    <CFELSE>
        <CFSET SESSION.isLoggedIn = true/>
        <CFSET SESSION.userLogin = FORM.login/>
        <CFSET SESSION.userId = found_users.id/>
        <CFSET status = true/>
        <CFSET message = 'Вход в систему произведен'/>
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
