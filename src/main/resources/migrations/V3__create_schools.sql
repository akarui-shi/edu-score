create table if not exists schools
(
    id  bigint auto_increment
        primary key,
    name             varchar(299) null,
    global_id        bigint       null,
    year             varchar(9)   null,
    adm_area         varchar(39)  null,
    district         varchar(31)  null,
    passes_over_220  int          null,
    passes_under_160 int          null,
    address          varchar(255) null
);
