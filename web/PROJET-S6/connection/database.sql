
create database if not exists test;
use test;



create table client(
    username varchar(20) primary key,
	password varchar(20) Not null,
    Nom_client varchar(50) Not null,
    adresse_client varchar(70) Not null,
    tel_client int(8) Not null,
    status_client varchar(50) Not null
);


create table commande(
    id_commande int(4) auto_increment primary key,
   Nom_commande varchar(100) Not null,
    prix varchar(8) Not null,
	username varchar(20) Not null,
   delai varchar(100) Not null ,
   id_entreprise int(4) Not null
   
);




create table entreprise(
   id_entreprise int(4) auto_increment primary key,
   Nom_ent varchar(100) Not null,
   categorie varchar(100) Not null,
   telephone varchar(8) Not null,
   email varchar(100) Not null,
   etat int(1) Not null,
   photo varchar(100) Not null
);


create table users(
    userid int(4) auto_increment primary key,
    login varchar(50) Not null,
    email varchar(255) Not null,
    category varchar(50) Not null,   -- admin ou visiteur
    etat int(1)Not null,        -- 1:activé 0:desactivé
    pwd varchar(255)Not null
);


	Alter table commande add constraint 
    foreign key(id_entreprise) references entreprise(id_entreprise);

    Alter table commande add constraint 
    foreign key(username) references client(username);

	INSERT INTO users(login,email,category,etat,pwd) VALUES 
    ('cheikhena','cheikhena@gmail.com','ADMIN',1,md5('12345'))
	('admin','admin@gmail.com','ADMIN',1,md5('12345'));
