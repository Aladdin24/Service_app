
create database if not exists db_pfe;
use test;



create table client(
    username varchar(20) primary key,
	password varchar(20),
    Nom_client varchar(50),
    adresse_client varchar(70),
    tel_client int(8),
    status_client varchar(50)
);


create table commande(
    id_commande int(4) auto_increment primary key,
   Nom_commande varchar(100),
    prix varchar(8),
	username varchar(20),
   delai varchar(100) ,
   id_entreprise int(4)
   
);




create table entreprise(
   id_entreprise int(4) auto_increment primary key,
   Nom_ent varchar(100),
   categorie varchar(100),
   telephone varchar(8),
   email varchar(100),
   etat int(1),
   photo varchar(100)
);


create table users(
    userid int(4) auto_increment primary key,
    login varchar(50),
    email varchar(255),
    category varchar(50),   -- admin ou visiteur
    etat int(1),        -- 1:activé 0:desactivé
    pwd varchar(255)
);


	Alter table commande add constraint 
    foreign key(id_entreprise) references entreprise(id_entreprise);

    Alter table commande add constraint 
    foreign key(username) references client(username);

	