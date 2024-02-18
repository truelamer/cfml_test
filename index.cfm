<!doctype html>
<html lang="ru">
<head>
    <!-- Обязательные метатеги -->
    <meta charset="utf-8">
    <title>CFML Test task</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.3/js/jquery.tablesorter.min.js" integrity="sha512-qzgd5cYSZcosqpzpn7zF2ZId8f/8CHmFKZ8j7mU4OUXTNRd5g+ZHBPsgKEwoqxCtdQvExE5LprwwPAgoicguNg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.3/js/jquery.tablesorter.widgets.min.js" integrity="sha512-dj/9K5GRIEZu+Igm9tC16XPOTz0RdPk9FGxfZxShWf65JJNU2TjbElGjuOo3EhwAJRPhJxwEJ5b+/Ouo+VqZdQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="assets/js/main_script.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.3/css/theme.default.min.css" integrity="sha512-wghhOJkjQX0Lh3NSWvNKeZ0ZpNn+SPVXX1Qyc9OCaogADktxrBiBdKGDoqVUOyhStvMBmJQ8ZdMHiR3wuEq8+w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" integrity="sha384-4LISF5TTJX/fLmGSxO53rV4miRxdg84mZsxmO8Rx5jGtp/LbrixFETvWa5a6sESd" crossorigin="anonymous">
    <style>
        i {
            font-size: 14pt;
            cursor: pointer;
        }
    </style>
</head>
<body style="background-color: #79bcff4a;">
    <CFQUERY datasource="cfml_test" name="exist_tables">
        SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'users'
    </CFQUERY>
    <CFIF exist_tables.recordcount IS 0>
        <CFINCLUDE template="do_migration.cfm">
    <CFELSE>
        <CFIF NOT structKeyExists(SESSION, "isLoggedIn")>
            <CFINCLUDE template="login_page.cfm">
        <CFELSE>
            <div class="container-fluid">
                <div class="row">
                    <div class="col">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="new-error-tab" data-bs-toggle="tab" data-bs-target="#new-error-tab-pane" type="button" role="tab" aria-controls="new-error-tab-pane" aria-selected="true">Ввод новой ошибки</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="list-error-tab" onclick="getListError()" data-bs-toggle="tab" data-bs-target="#list-error-tab-pane" type="button" role="tab" aria-controls="list-error-tab-pane" aria-selected="false">Список ошибок</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="create-user-tab" data-bs-toggle="tab" data-bs-target="#create-user-tab-pane" type="button" role="tab" aria-controls="create-user-tab-pane" aria-selected="false">Создание нового пользователя</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="list-user-tab" onclick="getListUser()" data-bs-toggle="tab" data-bs-target="#list-user-tab-pane" type="button" role="tab" aria-controls="list-user-tab-pane" aria-selected="false">Список пользователей</button>
                            </li>
                            <li class="nav-item"  role="presentation">
                                <button class="nav-link"  id="logout_button" onclick="logout()" type="button">Выход</button>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="new-error-tab-pane" role="tabpanel" aria-labelledby="new-error-tab" tabindex="0">
                                <CFINCLUDE template="add_error_page.cfm">
                            </div>
                            <div class="tab-pane fade" id="list-error-tab-pane" role="tabpanel" aria-labelledby="list-error-tab" tabindex="0">
                                <CFINCLUDE template="list_error_page.cfm">
                            </div>
                            <div class="tab-pane fade" id="create-user-tab-pane" role="tabpanel" aria-labelledby="create-user-tab" tabindex="0">
                                <CFINCLUDE template="add_user_page.cfm">
                            </div>
                            <div class="tab-pane fade" id="list-user-tab-pane" role="tabpanel" aria-labelledby="list-user-tab" tabindex="0">
                                <CFINCLUDE template="list_user_page.cfm">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </CFIF>
    </CFIF>
</body>
