<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-6" id="list_user_container">
        </div>
    </div>
    <div id="form_edit_user_container" style="display: none">
        <div class="row justify-content-center">
            <div class="col-6">
                <form>
                    <input type="hidden" name="id" id="edit_user_id">
                    <div class="row">
                        <div class="col">
                            <label for="edit_user_login" class="form-label">Логин</label>
                            <input type="text" class="form-control" name="login" id="edit_user_login">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="edit_user_first_name" class="form-label">Имя</label>
                            <input type="text" class="form-control" name="first_name" id="edit_user_first_name">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="edit_user_last_name" class="form-label">Фамилия</label>
                            <input type="text" class="form-control" name="last_name" id="edit_user_last_name">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="edit_user_password" class="form-label">Пароль</label>
                            <input type="password" class="form-control" name="password" id="edit_user_password">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-4">
                <button style="width: 100%" class="btn btn-primary" onclick="saveUser()">Сохранить</button>
                <div id="error_message_save_user"></div>
            </div>
        </div>
    </div>
</div>