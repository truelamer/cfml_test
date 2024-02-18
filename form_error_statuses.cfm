<CFQUERY datasource="cfml_test" name="error_status" >
    SELECT * FROM errors WHERE id = #FORM.id#
</CFQUERY>
<CFQUERY datasource="cfml_test" name="list_availability_statuses" >
    SELECT la.id, la.name AS activity_name, ls.name AS status_name FROM list_activity_to_status lats
    LEFT JOIN list_status ls ON lats.set_status_id = ls.id
    LEFT JOIN list_activity la ON lats.activity_id = la.id
    WHERE lats.current_status_id = #error_status.status_id#
</CFQUERY>
<CFIF list_availability_statuses.recordcount GT 0>
    <div class="row justify-content-center">
        <div class="col-6">
            <form>
                <CFOUTPUT><input type="hidden" name="id" id="add_status_error_id" value="#FORM.id#"></CFOUTPUT>
                <div class="row">
                    <div class="col">
                        <label for="add_status_error_activity_id" class="form-label">Действие</label>
                        <select id='add_status_error_activity_id' name="activity_id" class="form-control">
                            <CFOUTPUT query="list_availability_statuses">
                                    <option class="form-control" value="#id#">#activity_name# -> #status_name#</option>
                            </CFOUTPUT>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <label for="add_status_error_comment" class="form-label">Комментарий</label>
                        <input type="text" class="form-control" name="comment" id="add_status_error_comment">
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-4">
            <button style="width: 100%" class="btn btn-primary" onclick="addStatusError()">Сохранить</button>
            <div id="error_message_add_error_status"></div>
        </div>
    </div>
</CFIF>

