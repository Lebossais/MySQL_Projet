/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  05/02/2020 13:57:58                      */
/* Auteur : Jérôme BOEBION										*/	
/* Description : Création BDD + Triggers	 					*/
/*==============================================================*/

create database if not exists projet_actif;
use projet_actif;

set FOREIGN_KEY_CHECKS=0;

drop table if exists FUNCTIONBOX;
drop table if exists SECURITYBOX;
drop table if exists `STATUS`;
drop table if exists DOMAIN;
drop table if exists LIFECYCLE;
drop table if exists SECTORACTIVITY;
drop table if exists INFOSTECH;
drop table if exists TYPEINTERVENTION;
drop table if exists EMPLOYEE;
drop table if exists COMPANY;
drop table if exists CONTACTCOMPANY;
drop table if exists PROJECT;
drop table if exists LIFEPROJECT;
drop table if exists COMPOSE;
drop table if exists STAGE;
drop table if exists CONTRACT;
drop table if exists SIGN;
drop table if exists DOCUMENTATION;
drop table if exists INTERVENTION;

drop trigger if exists before_update_contract;
drop trigger if exists before_insert_employee;
drop trigger if exists before_update_employee;
drop trigger if exists before_insert_project;
drop trigger if exists before_delete_project;
drop trigger if exists before_update_intervention;
drop trigger if exists before_insert_intervention;

DROP FUNCTION if EXISTS count_employee;

/*==============================================================*/
/* Table : FUNCTIONBOX                                          */
/*==============================================================*/
create table FUNCTIONBOX
(
   IDFUNCTION           int auto_increment not null,
   LABELFUNCTION        varchar(15) not null,
   primary key (IDFUNCTION)
);

/*==============================================================*/
/* Table : STATUS                                               */
/*==============================================================*/
create table `STATUS`
(
   IDSTATUS             int auto_increment not null,
   TINYLABELSTATUS      char(3) not null,
   LABELSTATUS          varchar(20) not null,
   primary key (IDSTATUS)
);

/*==============================================================*/
/* Table : DOMAIN                                               */
/*==============================================================*/
create table DOMAIN
(
   IDDOMAIN             int auto_increment not null,
   LABELDOMAIN          varchar(50) not null,
   primary key (IDDOMAIN)
);

/*==============================================================*/
/* Table : LIFECYCLE                                            */
/*==============================================================*/
create table LIFECYCLE
(
   IDLIFECYCLE          int auto_increment not null,
   LABELLIFECYCLE       varchar(25) not null,
   primary key (IDLIFECYCLE)
);

/*==============================================================*/
/* Table : SECTORACTIVITY                                       */
/*==============================================================*/
create table SECTORACTIVITY
(
   IDSECTORACTIVITY     int auto_increment not null,
   LABELSECTORACTIVITY  varchar(25) not null,
   primary key (IDSECTORACTIVITY)
);

/*==============================================================*/
/* Table : INFOSTECH                                            */
/*==============================================================*/
create table INFOSTECH
(
   IDINFOSTECH          int auto_increment not null,
   LABELINFOSTECH       varchar(25) not null,
   COMMENTINFOSTECH     varchar(25),
   primary key (IDINFOSTECH)
);

/*==============================================================*/
/* Table : TYPEINTERVENTION                                     */
/*==============================================================*/
create table TYPEINTERVENTION
(
   IDTYPEINTER          int auto_increment not null,
   LABELTYPEINTER       varchar(25) not null,
   primary key (IDTYPEINTER)
);

/*==============================================================*/
/* Table : EMPLOYEE                                             */
/*==============================================================*/
create table EMPLOYEE
(
   NUMBERBADGE          int auto_increment not null,
   CIVILREGISTRATION    char(3) not null,
   SEX                  char(1) not null,
   LASTNAME             varchar(20) not null,
   FIRSTNAME            varchar(20) not null,
   ADDR1                varchar(25) not null,
   ADDR2                varchar(25) not null,
   POSTCODE             char(5) not null,
   CITY                 varchar(20) not null,
   PHONEEMPLOYEE        varchar(10) not null,
   HOBBIES              varchar(200) not null,
   primary key (NUMBERBADGE)   
);

/*==============================================================*/
/* Table : SECURITYBOX                                          */
/*==============================================================*/
create table SECURITYBOX
(
   IDSECURITY           int auto_increment not null,
   NUMBERBADGE          int not null,
   LOGIN                varchar(10) not null,
   `PASSWORD`           varchar(8) not null,
   primary key (IDSECURITY),
   foreign key (NUMBERBADGE) references EMPLOYEE (NUMBERBADGE)
);

/*==============================================================*/
/* Table : COMPANY                                              */
/*==============================================================*/
create table COMPANY
(
   IDCOMPANY            int auto_increment not null,
   IDDOMAIN             int not null,
   BADGEHEADSALES       int not null,
   NAMECOMPANY          varchar(100) not null,
   TYPECOMPANY          char(1) not null,
   NATURE               varchar(20) not null,
   ADDRCOMPANY          varchar(100) not null,
   POSTCODE             char(5) not null,
   CITY                 varchar(20) not null,
   PHONECOMPANY         varchar(10) not null,
   REVENUE              int not null,
   WORKFORCE            int not null,
   REVIEWTRADE          varchar(100),
   REVIEWPROJECT        varchar(100),
   primary key (IDCOMPANY),
   foreign key (IDDOMAIN) references DOMAIN (IDDOMAIN),
   foreign key (BADGEHEADSALES) references EMPLOYEE (NUMBERBADGE),
   check (NATURE IN('principale', 'secondaire', 'ancienne')),
   check (TYPECOMPANY IN('1', '2'))
);

/*==============================================================*/
/* Table : CONTACTCOMPANY                                       */
/*==============================================================*/
create table CONTACTCOMPANY
(
   IDCONTACT            int auto_increment not null,
   IDCOMPANY            int not null,
   NAMECONTACT          varchar(50) not null,
   FUNCTIONCONTACT      varchar(100) not null,
   EXTERNAL             bool not null default 0,
   PHONECONTACT         varchar(10) not null,
   EMAILCONTACT         varchar(30) not null,
   primary key (IDCONTACT),
   foreign key (IDCOMPANY) references COMPANY (IDCOMPANY) on delete cascade
);

/*==============================================================*/
/* Table : PROJECT                                              */
/*==============================================================*/
create table PROJECT
(
   IDPROJECT            int auto_increment not null,
   IDCONTACT            int not null,
   BADGEHEADSTUDY       int not null,
   BADGEHEADPROJECT     int not null,
   IDCOMPANY            int not null,
   IDSECTORACTIVITY     int not null,
   TINYLABEL            varchar(10) not null,
   LONGLABEL            varchar(50) not null,
   TYPEPROJECT          char(1) not null,
   PRESTARTDATE         date not null,
   PREENDDATE           date not null,
   REALSTARTDATE        date,
   REALENDDATE          date,
   ESTIMATELOAD         int,
   SIZECODE				int,
   COMMENTESTIMATE      varchar(100),
   primary key (IDPROJECT),
   foreign key (BADGEHEADPROJECT) references EMPLOYEE (NUMBERBADGE),
   foreign key (IDCOMPANY) references COMPANY (IDCOMPANY) on delete cascade,
   foreign key (IDSECTORACTIVITY) references SECTORACTIVITY (IDSECTORACTIVITY),
   foreign key (IDCONTACT) references CONTACTCOMPANY (IDCONTACT),
   foreign key (BADGEHEADSTUDY) references EMPLOYEE (NUMBERBADGE),
   check (TYPEPROJECT IN('F', 'R', 'A'))
);

/*==============================================================*/
/* Table : LIFEPROJECT                                          */
/*==============================================================*/
create table LIFEPROJECT
(
   IDPROJECT            int not null,
   IDLIFECYCLE          int not null,
   LIFEDATE             date not null,
   primary key (IDPROJECT, IDLIFECYCLE),
   foreign key (IDPROJECT) references PROJECT (IDPROJECT) on delete cascade,
   foreign key (IDLIFECYCLE) references LIFECYCLE (IDLIFECYCLE)
);

/*==============================================================*/
/* Table : COMPOSE                                              */
/*==============================================================*/
create table COMPOSE
(
   IDPROJECT            int not null,
   IDINFOSTECH          int not null,
   primary key (IDPROJECT, IDINFOSTECH),
   foreign key (IDPROJECT) references PROJECT (IDPROJECT) on delete cascade,
   foreign key (IDINFOSTECH) references INFOSTECH (IDINFOSTECH)
);

/*==============================================================*/
/* Table : CONTRACT                                             */
/*==============================================================*/
create table CONTRACT
(
   IDCONTRACT           int auto_increment not null,
   IDFUNCTION           int not null,
   IDSTATUS             int not null,
   SALARY               decimal not null default 0,
   primary key (IDCONTRACT),
   foreign key (IDFUNCTION) references FUNCTIONBOX (IDFUNCTION),
   foreign key (IDSTATUS) references `STATUS` (IDSTATUS)
);

/*==============================================================*/
/* Table : SIGN                                                 */
/*==============================================================*/
create table SIGN
(
   NUMBERBADGE          int not null,
   IDCONTRACT           int not null,
   ENTRYDATE            date not null,
   EXITDATE             date,
   primary key (NUMBERBADGE, IDCONTRACT),
   foreign key (NUMBERBADGE) references EMPLOYEE (NUMBERBADGE),
   foreign key (IDCONTRACT) references CONTRACT (IDCONTRACT)
);

/*==============================================================*/
/* Table : STAGE                                                */
/*==============================================================*/
create table STAGE
(
   IDSTAGE              int auto_increment not null,
   IDPROJECT            int not null,
   STARTDATESTAGE       date not null,
   ENDDATESTAGE         date not null,
   VALIDATESTAGE        bool,
   PRODCHARGESTAGE      int not null,
   PRODESTIMATESTAGE    int not null,
   FINALCHARGESTAGE     int,
   primary key (IDSTAGE),
   foreign key (IDPROJECT) references PROJECT (IDPROJECT) on delete cascade
);

/*==============================================================*/
/* Table : DOCUMENTATION                                        */
/*==============================================================*/
create table DOCUMENTATION
(
   IDDOC                int auto_increment not null,
   NUMBERBADGE          int not null,
   IDPROJECT            int not null,
   LABELDOC             varchar(25) not null,
   SUMMARY              varchar(100) not null,
   RELEASEDATE          date not null,
   primary key (IDDOC),
   foreign key (IDPROJECT) references PROJECT (IDPROJECT) on delete cascade,
   foreign key (NUMBERBADGE) references EMPLOYEE (NUMBERBADGE)
);

/*==============================================================*/
/* Table : INTERVENTION                                         */
/*==============================================================*/
create table INTERVENTION
(
   IDINTERV             int auto_increment not null,
   BADGEHEADPROJECT     int not null,
   BADGEEMPLOYEE        int not null,
   IDTYPEINTER          int not null,
   IDTEMPFUNCTION       int,
   IDCONTACT            int,
   IDSTAGE              int not null,
   LABELINTERV          varchar(20) not null,
   STARTDATEINTERV      date not null,
   ENDDATEINTERV        date,
   VALIDATEINTERV       bool,
   TESTFUNCTIONEMP      bool default 0,
   COMMENTINTERV        varchar(100),
   WORKTIME             int not null,
   primary key (IDINTERV),
   foreign key (BADGEHEADPROJECT) references EMPLOYEE (NUMBERBADGE),
   foreign key (IDSTAGE) references STAGE (IDSTAGE) on delete cascade,
   foreign key (IDTYPEINTER) references TYPEINTERVENTION (IDTYPEINTER),
   foreign key (IDCONTACT) references CONTACTCOMPANY (IDCONTACT),
   foreign key (BADGEEMPLOYEE) references EMPLOYEE (NUMBERBADGE),
   foreign key (IDTEMPFUNCTION) references FUNCTIONBOX (IDFUNCTION)
   );