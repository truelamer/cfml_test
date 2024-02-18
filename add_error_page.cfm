<CFQUERY datasource="cfml_test" name="list_urgently" >
    select * from list_urgently
</CFQUERY>
<CFQUERY datasource="cfml_test" name="list_criticality" >
    select * from list_criticality
</CFQUERY>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-6">
            <form>
                <div class="row">
                    <div class="col">
                        <label for="add_error_description_short" class="form-label">Краткое описание</label>
                        <input type="text" class="form-control" name="description_short" id="add_error_description_short">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <label for="add_error_description_full" class="form-label">Полное описание</label>
                        <textarea cols="3" class="form-control" name="description_full" id="add_error_description_full"></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <label for="add_error_urgently_id" class="form-label">Срочность</label>
                        <select id='add_error_urgently_id' name="urgently_id" class="form-control">
                            <CFOUTPUT query="list_urgently">
                                <option class="form-control" value="#id#">#name#</option>
                            </CFOUTPUT>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <label for="add_error_criticality_id" class="form-label">Критичность</label>
                        <select id='add_error_criticality_id' name="criticality_id" class="form-control">
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
            <button style="width: 100%" class="btn btn-primary" onclick="addError()">Создать</button>
            <div id="error_message_add_error"></div>
        </div>
    </div>
</div>
