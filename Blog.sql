create database if not exists blog;

use blog;

create table if not exists Posts 
(
 id INTEGER not null AUTO_INCREMENT,
 name VARCHAR(40),
 content VARCHAR(40),
 created_at Integer,
    primary key (id)
 );