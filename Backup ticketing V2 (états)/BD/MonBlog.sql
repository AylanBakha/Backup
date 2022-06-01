/* Testé sous MySQL 5.x */

drop table if exists T_COMMENTAIRE;
drop table if exists T_BILLET;
drop table if exists T_ETAT;

create table T_ETAT (
  ETA_ID integer primary key auto_increment not null,
  ETA_LIB varchar(50) not null
) ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

insert into T_ETAT (ETA_LIB, ETA_ID) values
('ouvert', 1);
insert into T_ETAT (ETA_LIB, ETA_ID) values
('en cours', 2);
insert into T_ETAT (ETA_LIB, ETA_ID) values
('fermé', 3);

create table T_BILLET (
  BIL_ID integer primary key auto_increment,
  BIL_DATE datetime not null,
  BIL_TITRE varchar(100) not null,
  BIL_CONTENU varchar(400) not null,
  ETA_ID integer not null,
  constraint fk_bil_eta foreign key(ETA_ID) references T_ETAT(ETA_ID)
) ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

create table T_COMMENTAIRE (
  COM_ID integer primary key auto_increment,
  COM_AUTEUR varchar(100) not null,
  COM_CONTENU varchar(200) not null,
  BIL_ID integer not null,
  constraint fk_com_bil foreign key(BIL_ID) references T_BILLET(BIL_ID)
) ENGINE=INNODB CHARACTER SET utf8 COLLATE utf8_general_ci;

insert into T_BILLET(BIL_DATE, BIL_TITRE, BIL_CONTENU, ETA_ID) values
(NOW(), 'Premier billet', 'Bonjour monde ! Ceci est le premier billet sur mon blog.', 1);
insert into T_BILLET(BIL_DATE, BIL_TITRE, BIL_CONTENU, ETA_ID) values
(NOW(), 'Au travail', 'Il faut enrichir ce blog dès maintenant.', 2);

insert into T_COMMENTAIRE(COM_AUTEUR, COM_CONTENU, BIL_ID) values
('A. Nonyme', 'Bravo pour ce début', '1');
insert into T_COMMENTAIRE(COM_AUTEUR, COM_CONTENU, BIL_ID) values
('Moi', 'Merci ! Je vais continuer sur ma lancée', '1');