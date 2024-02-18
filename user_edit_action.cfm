<CFSCRIPT>
    status = true;
    message = 'Операция выполнена успешно';
</CFSCRIPT>
<CFIF (len(FORM.login) IS 0) OR (len(FORM.login) GT 100)>
    <CFSET status = false/>
    <CFSET message = 'Длина логина должна быть от 1 до 100 символов! Текущая длина:' & len(FORM.login)/>
</CFIF>
<CFIF (len(FORM.first_name) IS 0) OR (len(FORM.first_name) GT 200)>
    <CFSET status = false/>
    <CFSET message = 'Длина имени должна быть от 1 до 200 символов! Текущая длина:' & len(FORM.first_name)/>
</CFIF>
<CFIF (len(FORM.last_name) IS 0) OR (len(FORM.last_name) GT 200)>
    <CFSET status = false/>
    <CFSET message = 'Длина фамилии должна быть от 1 до 200 символов! Текущая длина:' & len(FORM.last_name)/>
</CFIF>
<CFIF (len(FORM.password) GT 16)>
    <CFSET status = false/>
    <CFSET message = 'Длина пароля должна быть от 1 до 16 символов! Текущая длина :' & len(FORM.password)/>
</CFIF>
<CFIF structKeyExists(FORM, 'id')>
    <CFQUERY DATASOURCE="cfml_test" NAME="found_login">
        SELECT id FROM users
        WHERE login = '#FORM.login#' AND id != '#FORM.id#'
    </CFQUERY>
<CFELSE>
    <CFQUERY DATASOURCE="cfml_test" NAME="found_login">
        SELECT id FROM users
        WHERE login = '#FORM.login#'
    </CFQUERY>
</CFIF>
<CFIF found_login.recordcount GT 0>
    <CFSET status = false/>
    <CFSET message = 'Пользователь с таким логином уже существует. '/>
</CFIF>

<CFIF status IS true>
    <CFIF structKeyExists(FORM, 'id')>
        <CFIF (len(FORM.password) GT 0)>
            <CFQUERY DATASOURCE="cfml_test" NAME="update_user_with_password">
                UPDATE users SET login = '#FORM.login#', first_name = '#FORM.first_name#', last_name = '#FORM.last_name#', password = '#FORM.password#'
                WHERE id = '#FORM.id#'
            </CFQUERY>
        <CFELSE>
            <CFQUERY DATASOURCE="cfml_test" NAME="update_user">
                UPDATE users SET login = '#FORM.login#', first_name = '#FORM.first_name#', last_name = '#FORM.last_name#'
                WHERE id = '#FORM.id#'
            </CFQUERY>
        </CFIF>
    <CFELSE>
        <CFIF (len(FORM.password) IS 0)>
            <CFSET status = false/>
            <CFSET message = 'Длина пароля должна быть от 1 до 16 символов! Текущая длина:' & len(FORM.password)/>
        <CFELSE>
            <CFQUERY DATASOURCE="cfml_test" NAME="create_user">
                INSERT INTO users (login, first_name, last_name, password) VALUES ('#FORM.login#', '#FORM.first_name#', '#FORM.last_name#', '#FORM.password#')
            </CFQUERY>
        </CFIF>
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

