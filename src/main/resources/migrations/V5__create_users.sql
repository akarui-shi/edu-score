create table if not exists users
(
    id       bigint auto_increment
        primary key,
    active   bit           null,
    email    varchar(255)  null,
    name     varchar(255)  null,
    password varchar(1000) null,
    constraint UK_6dotkott2kjsp8vw4d0m25fb7
        unique (email)
);

