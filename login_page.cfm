<div class="container position-absolute top-50 start-50 translate-middle">
    <div class="row justify-content-center">
        <div class="col-4">
            <h3>Добро пожаловать в систему учета ошибок.</h3>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-4">
            <h4>Для продолжения введите свой логин и пароль.</h4>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-4">
            <form>
                <div class="row">
                    <div class="col">
                        <label for="login_login" class="form-label">Логин</label>
                        <input type="text" class="form-control" name="login" id="login_login">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <label for="login_password" class="form-label">Пароль</label>
                        <input type="password" class="form-control" name="password" id="login_password">
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-4">
            <button style="width: 100%" class="btn btn-primary" onclick="login()">Войти</button>
            <div id="error_message_login"></div>
        </div>
    </div>
</div>


