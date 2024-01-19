create table if not exists user_role
(
    user_id bigint       not null,
    roles   varchar(255) null,
    constraint FKj345gk1bovqvfame88rcx7yyx
        foreign key (user_id) references users (id)
);