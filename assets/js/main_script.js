
let logout = function() {
    $.post("logout_action.cfm", {}, function() {
        location.reload();
    });
};

let addUser = function () {
    let login = $('#add_user_login').val();
    let first_name = $('#add_user_first_name').val();
    let last_name = $('#add_user_last_name').val();
    let password = $('#add_user_password').val();
    $.post("user_edit_action.cfm", {
            login : login,
            first_name : first_name,
            last_name : last_name,
            password : password
        },function(result){
            getListUser();
            json = $.parseJSON(result);
$('#error_message_add_user').text(json.message);
        }
    );
};

let openFormEditUser = function (id, login, first_name, last_name) {
    $('#form_edit_user_container').show();
    $('#edit_user_id').val(id);
    $('#edit_user_login').val(login);
    $('#edit_user_first_name').val(first_name);
    $('#edit_user_last_name').val(last_name);
    $('#edit_user_password').val('');
};

let saveUser = function () {
    let id = $('#edit_user_id').val();
    let login = $('#edit_user_login').val();
    let first_name = $('#edit_user_first_name').val();
    let last_name = $('#edit_user_last_name').val();
    let password = $('#edit_user_password').val();
    $.post("user_edit_action.cfm", {
            id : id,
            login : login,
            first_name : first_name,
            last_name : last_name,
            password : password
        },function(result){
            json = $.parseJSON(result);
            if (json.status == true)
            {
                getListUser();
                $('#form_edit_user_container').hide();
            }
            else
            {
                $('#error_message_save_user').text(json.message);
            }
        }
    );
};

let getListUser = function () {
    $.post("list_user_query.cfm", {
        },function(result){
            $('#list_user_container').html(result);
        }
    );
}

let login = function() {
    let login = $("#login_login").val();
    let password = $("#login_password").val();
    $.post("login_action.cfm", {
            login:login,
            password:password
        },function(result){
            json = $.parseJSON(result);
            if (json.status == true)
            {
                location.reload();
            }
            else
            {
                $('#error_message_login').text(json.message);
            }
        }
    );
};

let addError = function () {
    let description_short = $('#add_error_description_short').val();
    let description_full = $('#add_error_description_full').val();
    let urgently_id = $('#add_error_urgently_id').val();
    let criticality_id = $('#add_error_criticality_id').val();
    $.post("error_edit_action.cfm", {
            description_short : description_short,
            description_full : description_full,
            urgently_id : urgently_id,
            criticality_id : criticality_id
        },function(result){
            //getListError();
            json = $.parseJSON(result);
            $('#error_message_add_error').text(json.message);
        }
    );
};

let getListError = function () {
    $.post("list_error_query.cfm", {
        },function(result){
            $('#list_error_container').html(result);
        }
    );
}

let openFormEditError = function (id, description_short, description_full, urgently_id, criticality_id) {
    $('#form_edit_error_status_container').hide();
    $('#list_error_detail_container').hide();
    $('#form_edit_error_container').show();
    $('#edit_error_id').val(id);
    $('#edit_error_description_short').val(description_short);
    $('#edit_error_description_full').val(description_full);
    $('#edit_error_urgently_id').val(urgently_id);
    $('#edit_error_criticality_id').val(criticality_id);
};

let saveError = function () {
    let id = $('#edit_error_id').val();
    let description_short = $('#edit_error_description_short').val();
    let description_full = $('#edit_error_description_full').val();
    let urgently_id = $('#edit_error_urgently_id').val();
    let criticality_id = $('#edit_error_criticality_id').val();
    $.post("error_edit_action.cfm", {
            id : id,
            description_short : description_short,
            description_full : description_full,
            urgently_id : urgently_id,
            criticality_id : criticality_id
        },function(result){
            json = $.parseJSON(result);
            if (json.status == true)
            {
                getListError();
                $('#form_edit_error_container').hide();
            }
            else
            {
                $('#error_message_save_error').text(json.message);
            }
        }
    );
};

let getListErrorStatuses = function (id) {
    $.post("list_error_statuses_query.cfm", {
            id: id
        },function(result){
            $('#form_change_status').hide();
            $('#form_edit_error_container').hide();
            $('#list_error_detail_container').show();
            $('#list_error_detail_container').html(result);
        }
    );
}

let openFormEditErrorStatus = function (id, comment) {
    $('#form_edit_error_container').hide();
    $('#form_edit_error_status_container').show();
    $('#edit_error_status_id').val(id);
    $('#edit_error_status_comment').val(comment);
}

let saveErrorStatus = function () {
    let id = $('#edit_error_status_id').val();
    let comment = $('#edit_error_status_comment').val();
    $.post("error_status_edit_action.cfm", {
            id : id,
            comment : comment,
        },function(result){
            json = $.parseJSON(result);
            if (json.status == true)
            {
                getListErrorStatuses($('#main_error_id').val());
                $('#form_edit_error_status_container').hide();
            }
            else
            {
                $('#error_message_save_error_status').text(json.message);
            }
        }
    );
}

let openFormChangeStatus = function (id) {
    $('#form_change_status').show();
    $.post("form_error_statuses.cfm", {
            id: id
        },function(result){
            $('#form_change_status').html(result);
        }
    );
}

let addStatusError = function () {
    let id = $('#add_status_error_id').val();
    let comment = $('#add_status_error_comment').val();
    let activity_id = $('#add_status_error_activity_id').val();
    $.post("add_status_error_action.cfm", {
            id : id,
            comment : comment,
            activity_id : activity_id
        },function(result){
            json = $.parseJSON(result);
            if (json.status == true)
            {
                getListError();
                getListErrorStatuses(id);
                $('#form_change_status').hide();
            }
            else
            {
                $('#error_message_add_error_status').text(json.message);
            }
        }
    );
}
