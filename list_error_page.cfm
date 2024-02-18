<CFQUERY datasource="cfml_test" name="list_urgently" >
    select * from list_urgently
</CFQUERY>
<CFQUERY datasource="cfml_test" name="list_criticality" >
    select * from list_criticality
</CFQUERY>
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-6" id="list_error_container"></div>
        <div class="col-6">
            <div class="row">
                <div class="col" id="list_error_detail_container"></div>
            </div>
            <div class="row" id="form_change_status"></div>
        </div>
    </div>
    <div id="form_edit_error_container" style="display: none">
        <div class="row justify-content-center">
            <div class="col-6">
                <form>
                    <input type="hidden" name="id" id="edit_error_id">
                    <div class="row">
                        <div class="col">
                            <label for="edit_error_description_short" class="form-label">Краткое описание</label>
                            <input type="text" class="form-control" name="description_short" id="edit_error_description_short">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="edit_error_description_full" class="form-label">Полное описание</label>
                            <textarea cols="3" class="form-control" name="description_full" id="edit_error_description_full"></textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="edit_error_urgently_id" class="form-label">Срочность</label>
                            <select id='edit_error_urgently_id' name="urgently_id" class="form-control">
                                <CFOUTPUT query="list_urgently">
                                    <option class="form-control" value="#id#">#name#</option>
                                </CFOUTPUT>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="edit_error_criticality_id" class="form-label">Критичность</label>
                            <select id='edit_error_criticality_id' name="criticality_id" class="form-control">
                                <CFOUTPUT query="list_criticality">
                                    <option class="form-control" value="#id#">#name#</option>
                                </CFOUTPUT>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-4">
                <button style="width: 100%" class="btn btn-primary" onclick="saveError()">Сохранить</button>
                <div id="error_message_save_error"></div>
            </div>
        </div>
    </div>
    <div id="form_edit_error_status_container" style="display: none">
        <div class="row justify-content-center">
            <div class="col-6">
                <form>
                    <input type="hidden" name="id" id="edit_error_status_id">
                    <div class="row">
                        <div class="col">
                            <label for="edit_error_status_comment" class="form-label">Комментарий</label>
                            <input type="text" class="form-control" name="comment" id="edit_error_status_comment">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-4">
                <button style="width: 100%" class="btn btn-primary" onclick="saveErrorStatus()">Сохранить</button>
                <div id="error_message_save_error_status"></div>
            </div>
        </div>
</div>
</div>
