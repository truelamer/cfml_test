<CFQUERY datasource="cfml_test" name="create_table_list_activity">
    create table list_activity
    (
        id   int identity
        constraint list_activity_pk
        primary key,
        name varchar(100)
    )
</CFQUERY>
<CFQUERY datasource="cfml_test" name="insert_table_list_activity">
    INSERT INTO cfml_test.dbo.list_activity (name) VALUES (N'Назначение');
    INSERT INTO cfml_test.dbo.list_activity (name) VALUES (N'Решение');
    INSERT INTO cfml_test.dbo.list_activity (name) VALUES (N'Проверка');
    INSERT INTO cfml_test.dbo.list_activity (name) VALUES (N'Переоткрытие');
    INSERT INTO cfml_test.dbo.list_activity (name) VALUES (N'Закрытие');
</CFQUERY>

<CFQUERY datasource="cfml_test" name="create_table_list_criticality">
    create table list_criticality
    (
    id   int identity
    constraint list_criticality_pk
    primary key,
    name varchar(100)
    )
</CFQUERY>
<CFQUERY datasource="cfml_test" name="insert_table_list_criticality">
    INSERT INTO cfml_test.dbo.list_criticality (name) VALUES (N'Авария');
    INSERT INTO cfml_test.dbo.list_criticality (name) VALUES (N'Критичная');
    INSERT INTO cfml_test.dbo.list_criticality (name) VALUES (N'Некритичная');
    INSERT INTO cfml_test.dbo.list_criticality (name) VALUES (N'Запрос на изменение');
</CFQUERY>

<CFQUERY datasource="cfml_test" name="create_table_list_status">
    create table list_status
    (
    id   int identity
    constraint list_status_pk
    primary key,
    name varchar(100)
    )
</CFQUERY>
<CFQUERY datasource="cfml_test" name="insert_table_list_status">
    INSERT INTO cfml_test.dbo.list_status (name) VALUES (N'Новая');
    INSERT INTO cfml_test.dbo.list_status (name) VALUES (N'Открытая');
    INSERT INTO cfml_test.dbo.list_status (name) VALUES (N'Решенная');
    INSERT INTO cfml_test.dbo.list_status (name) VALUES (N'Проверенная');
    INSERT INTO cfml_test.dbo.list_status (name) VALUES (N'Закрытая');
</CFQUERY>

<CFQUERY datasource="cfml_test" name="create_table_list_urgently">
    create table list_urgently
    (
    id   int identity
    constraint list_urgently_pk
    primary key,
    name varchar(100)
    )
</CFQUERY>
<CFQUERY datasource="cfml_test" name="insert_table_list_urgently">
    INSERT INTO cfml_test.dbo.list_urgently (name) VALUES (N'Очень срочно');
    INSERT INTO cfml_test.dbo.list_urgently (name) VALUES (N'Срочно');
    INSERT INTO cfml_test.dbo.list_urgently (name) VALUES (N'Несрочно');
    INSERT INTO cfml_test.dbo.list_urgently (name) VALUES (N'Совсем несрочно');
</CFQUERY>

<CFQUERY datasource="cfml_test" name="create_table_list_activity_to_status">
    create table list_activity_to_status
    (
    id                int identity,
    current_status_id int not null
    constraint list_activity_to_status_list_status_id_fk
    references list_status,
    activity_id       int not null
    constraint list_activity_to_status_list_activity_id_fk
    references list_activity,
    set_status_id     int not null
    constraint list_activity_to_status_list_status_id_fk_2
    references list_status
    )
</CFQUERY>
<CFQUERY datasource="cfml_test" name="insert_table_list_activity_to_status">
    INSERT INTO cfml_test.dbo.list_activity_to_status (current_status_id, activity_id, set_status_id) VALUES (1, 1, 2);
    INSERT INTO cfml_test.dbo.list_activity_to_status (current_status_id, activity_id, set_status_id) VALUES (2, 2, 3);
    INSERT INTO cfml_test.dbo.list_activity_to_status (current_status_id, activity_id, set_status_id) VALUES (3, 4, 2);
    INSERT INTO cfml_test.dbo.list_activity_to_status (current_status_id, activity_id, set_status_id) VALUES (3, 3, 4);
    INSERT INTO cfml_test.dbo.list_activity_to_status (current_status_id, activity_id, set_status_id) VALUES (4, 4, 2);
    INSERT INTO cfml_test.dbo.list_activity_to_status (current_status_id, activity_id, set_status_id) VALUES (4, 5, 5);
</CFQUERY>

<CFQUERY datasource="cfml_test" name="create_table_users">
    create table users
    (
    id         int identity
    constraint users_pk
    primary key,
    login      varchar(100) not null,
    first_name varchar(200),
    last_name  varchar(200),
    password   varchar(16)  not null
    )
</CFQUERY>
<CFQUERY datasource="cfml_test" name="insert_table_users">
    INSERT INTO cfml_test.dbo.users (login, first_name, last_name, password) VALUES (N'user1', N'user1_name', N'user1_lname', N'123456');
</CFQUERY>

<CFQUERY datasource="cfml_test" name="create_table_errors">
    create table errors
    (
    id                int identity
    constraint errors_pk
    primary key,
    description_short varchar(200),
    description_full  varchar(max),
    user_id           int                        not null
    constraint errors_users_id_fk
    references users,
    status_id         int                        not null
    constraint errors_list_status_id_fk
    references list_status,
    urgently_id       int                        not null
    constraint errors_list_urgently_id_fk
    references list_urgently,
    criticality_id    int                        not null
    constraint errors_list_criticality_id_fk
    references list_criticality,
    date_create       datetime default getdate() not null,
    date_edit         datetime default getdate() not null
    )
</CFQUERY>
<CFQUERY datasource="cfml_test" name="insert_table_errors">
    INSERT INTO cfml_test.dbo.errors (description_short, description_full, user_id, status_id, urgently_id, criticality_id, date_create, date_edit) VALUES (N'Короткое описание', N'Длинное описание', 1, 5, 3, 1, getdate(), getdate());
</CFQUERY>

<CFQUERY datasource="cfml_test" name="create_table_error_set_status">
    create table error_set_status
    (
    id          int identity
    constraint error_set_status_pk
    primary key,
    activity_id int                        not null
    constraint error_set_status_list_activity_id_fk
    references list_activity,
    comment     varchar(max),
    user_id     int                        not null
    constraint error_set_status_users_id_fk
    references users,
    date_create datetime default getdate() not null,
    error_id    int                        not null
    constraint error_set_status_errors_id_fk
    references errors,
    date_edit   datetime default getdate() not null
    )
</CFQUERY>
<CFQUERY datasource="cfml_test" name="insert_table_error_set_status">
    INSERT INTO cfml_test.dbo.error_set_status (activity_id, comment, user_id, date_create, error_id, date_edit) VALUES (1, N'Назначили на исполнителя', 1, getdate(), 1, getdate());
    INSERT INTO cfml_test.dbo.error_set_status (activity_id, comment, user_id, date_create, error_id, date_edit) VALUES (2, N'Исполнитель решил', 1, getdate(), 1, getdate());
    INSERT INTO cfml_test.dbo.error_set_status (activity_id, comment, user_id, date_create, error_id, date_edit) VALUES (4, N'Исполнитель плохо решил', 1, getdate(), 1, getdate());
    INSERT INTO cfml_test.dbo.error_set_status (activity_id, comment, user_id, date_create, error_id, date_edit) VALUES (2, N'Теперь хорошо', 1, getdate(), 1, getdate());
    INSERT INTO cfml_test.dbo.error_set_status (activity_id, comment, user_id, date_create, error_id, date_edit) VALUES (3, N'Точно хорошо', 1, getdate(), 1, getdate());
    INSERT INTO cfml_test.dbo.error_set_status (activity_id, comment, user_id, date_create, error_id, date_edit) VALUES (5, N'Закрываем', 1, getdate(), 1, getdate());
</CFQUERY>

<CFOUTPUT>
    <script>location.reload()</script>
</CFOUTPUT>