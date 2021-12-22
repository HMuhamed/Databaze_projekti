create database Bibloteka;

use Bibloteka;

/*     KRIJIMI I TABELAVE    */

create table Lexuesi(
Leid decimal primary key,
Emri varchar(20),
Mbiemri varchar(20),
EmriPrindit varchar(20),
Gjinia varchar(1),
Datelindja date,
Profesioni varchar(20)
);

create table Contact_Lexuesi(
Leid decimal,
Rruga varchar(30),
Qyteti varchar(20),
Shteti varchar(20),
KodiPostal varchar(20),
TelefoniMobil varchar(30),
TelefoniFix varchar(30),
Email varchar(50),
FOREIGN KEY (Leid) REFERENCES Lexuesi(Leid)
);


 
create table Detajet_Lexuesit(
Leid decimal,
Pid decimal,
Vitiiregjistrimit date,
Dataeregjistrimit date,
Çmimiiregjistrimit varchar(10),
Antarsia boolean,
fundi_i_regjistimit date,
constraint fundi_regjstrimit_check check (fundi_i_regjistimit<='2021-12-31'),
foreign key (Leid) references Lexuesi(leid),
foreign key (Pid) references punëtori(Pid)

);

create table Punëtori(
Pid decimal,
Emri varchar(20),
Mbiemri varchar(20),
Titulli varchar(20),
Paga real,
PRIMARY KEY(Pid)

);

create table Contact_Punëtori(
Pid decimal ,
Rruga varchar(30),
Qyteti varchar(20),
Shteti varchar(20),
KodiPostal varchar(20),
TelefoniMobil varchar(30),
TelefoniFix varchar(30),
Email varchar(50),
FOREIGN KEY (Pid) REFERENCES Punëtori(Pid)
);

create table Autorët(
aid decimal,
Emri varchar(20),
Mbiemri varchar(20),
Gjinia varchar(10),
Datelindja date,
PRIMARY KEY(aid)

);

create table Contact_Autori(
Aid decimal ,
Rruga varchar(30),
Qyteti varchar(20),
Shteti varchar(20),
KodiPostal varchar(20),
TelefoniMobil varchar(30),
TelefoniFix varchar(30),
Email varchar(50),
FOREIGN KEY (Aid) REFERENCES Autorët(Aid)
);

create table Libri(
Lid decimal,
Pid decimal,
Aid decimal,
Titulli varchar(50),
Zhanri varchar(20),
Numriikopjeve int,
Dataepranimit datetime,
primary key (Lid),
foreign key (Pid) references Punëtori(Pid),
foreign key (Aid) references Autorët(Aid)
);

create table Huazimi_Librit(
Lid decimal,
Leid decimal,
Pid decimal,
Aid decimal,
Dataehuazimit date,
Afatikthimit date,
Dataekthimit date,
Verejte varchar(20),
constraint data_kthimit_check check (Afatikthimit=Dataehuazimit+15),
foreign key (Lid) references libri(Lid),
foreign key (Leid) references lexuesi(Leid),
foreign key (Pid) references Punëtori(Pid),
foreign key (Aid) references Autorët(Aid)
);


create table Arkiva(
Arid decimal primary key,
Lid decimal,
Leid decimal,
foreign key (Lid) references Libri(Lid),
foreign key (Leid) references Lexuesi(Leid)


);

create table Libri_Dëmtuar(
Lid decimal,
Pid decimal,
Verejte varchar(50),
Dataeregjistrimit date,
foreign key (Lid) references Libri(Lid),
foreign key (Pid) references Punëtori(Pid)

);

create table Donatorët(
Did decimal,
Lid decimal,
Pid decimal,
Aid decimal,
Emri varchar(50),
Dataedonacionit date,
Numriikopjeve decimal,
primary key (Did),
foreign key (Lid) references Libri(Lid),
foreign key (Pid) references Punëtori(Pid),
foreign key (Aid) references Autorët(Aid)
);

create table Contact_Donatori(
Did decimal,
Rruga varchar(30),
Qyteti varchar(20),
Shteti varchar(20),
KodiPostal varchar(20),
TelefoniMobil varchar(30),
TelefoniFix varchar(30),
Email varchar(50),
FOREIGN KEY (Did) REFERENCES Donatorët(Did)
);

/*     INSERTIMI I TE DHENAVE NE TABELA     */
insert into Lexuesi(Leid ,Emri ,Mbiemri ,EmriPrindit ,Gjinia,Datelindja,Profesioni ) values( 1,' Leon','Hoti','Bajram','M',	'1990-05-29','Profesor');
insert into Lexuesi(Leid ,Emri ,Mbiemri ,EmriPrindit ,Gjinia,Datelindja,Profesioni ) values( 2,' Tringa','Mustafa','Isak','F','1989-01-01','Mjeke');
insert into Lexuesi(Leid ,Emri ,Mbiemri ,EmriPrindit ,Gjinia,Datelindja,Profesioni ) values( 3,' Lufti','Smajli','Leotrim','M','2000-10-02','IT');
insert into Lexuesi(Leid ,Emri ,Mbiemri ,EmriPrindit ,Gjinia,Datelindja,Profesioni ) values( 4,' Arta','Musliu','Gjin','F',	'1998-05-06','Mesuese');
insert into Lexuesi(Leid ,Emri ,Mbiemri ,EmriPrindit ,Gjinia,Datelindja,Profesioni ) values( 5,' Kaltrina','Hoxha','Armando','F','1997-11-25','Infermere');
insert into Lexuesi(Leid ,Emri ,Mbiemri ,EmriPrindit ,Gjinia,Datelindja,Profesioni ) values( 6,' Getoar','Fazliu','Naim','M','1999-11-12','Ndertimtar');
insert into Lexuesi(Leid ,Emri ,Mbiemri ,EmriPrindit ,Gjinia,Datelindja,Profesioni ) values( 7,' Kushtrim','Thaqi','Bashkim','M','1989-04-02','Kuzhinjer');
insert into Lexuesi(Leid ,Emri ,Mbiemri ,EmriPrindit ,Gjinia,Datelindja,Profesioni ) values( 8,' Leonita','Saliu','Sami','F','1990-01-03','Sekretare');
insert into Lexuesi(Leid ,Emri ,Mbiemri ,EmriPrindit ,Gjinia,Datelindja,Profesioni ) values( 9,' Riad','Rama','Memli','M','1999-11-05','Arkitekt');
insert into Lexuesi(Leid ,Emri ,Mbiemri ,EmriPrindit ,Gjinia,Datelindja,Profesioni ) values( 10,' Ardiana','Aliu','Arjan','F','1990-11-05','Gazetare');

insert into Contact_Lexuesi(Leid ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 1,' Bedri Bajrami','Podujeve','Kosove','10001','044 632 789','+383 44 632 789','Leon_Hoti@gmail.com');
insert into Contact_Lexuesi(Leid ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 2,' Alexander Platz','Berlin','Gjermani','12053','030 901820','+49 30 901820','Tringa_Mustafa@gmail.com');
insert into Contact_Lexuesi(Leid ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 3,' Uke Sadiku','Prishtine','Kosove','10000','044 531 422','+383 44 531 422','Lufti_Smajli@gmail.com');
insert into Contact_Lexuesi(Leid ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 4,' Visar Dodani','Prishtine','Kosove','10000','044 431 455','+383 44 431 455','Visar_Dodani@gmail.com');
insert into Contact_Lexuesi(Leid ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 5,' Zahir Pajaziti','Podujeve','Kosove','10001','044 555 671','+383 44 555 671','Kaltrina_Hoxha@gmail.com');
insert into Contact_Lexuesi(Leid ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 6,' Rexhep Shema','Prishtine','Kosove','10000','044 222 451','+383 44 222 451','Getoar_Fazliu@gmail.com');
insert into Contact_Lexuesi(Leid ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 7,' Uke Sadiku','Prishtine','Kosove','10000','044 252 671','+383 44 252 671','Kushtrim_Thaqi@gmail.com'); 
insert into Contact_Lexuesi(Leid ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 8,' Zahir Pajaziti','Podujeve','Kosove','10001','044 272 777','+383 44 272 777','Leonita_Saliu@gmail.com');
insert into Contact_Lexuesi(Leid ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 9,' Nuhi Behrami','Podujeve','Kosove','10001','044 555 898','+383 44 555 898','Riad_Rama@gmail.com');
insert into Contact_Lexuesi(Leid ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 10,' Resim Kiçina','Prishtine','Kosove','10000','044 898 774','+383 44 898 774','Ardiana_Aliu@gmail.com');


insert into Detajet_Lexuesit(Leid ,Pid ,Vitiiregjistrimit,Dataeregjistrimit ,Çmimiiregjistrimit,Antarsia,fundi_i_regjistimit) values( 1,1,' 2021-01-01','2021-01-01','5€',true,'2021-12-31');
insert into Detajet_Lexuesit(Leid ,Pid ,Vitiiregjistrimit,Dataeregjistrimit ,Çmimiiregjistrimit,Antarsia,fundi_i_regjistimit) values( 2,1,' 2021-02-01','2021-02-01','5€',true,'2021-12-31');
insert into Detajet_Lexuesit(Leid ,Pid ,Vitiiregjistrimit,Dataeregjistrimit ,Çmimiiregjistrimit,Antarsia,fundi_i_regjistimit) values( 3,1,' 2021-01-04','2022-01-04','5€',true,'2021-12-31');
insert into Detajet_Lexuesit(Leid ,Pid ,Vitiiregjistrimit,Dataeregjistrimit ,Çmimiiregjistrimit,Antarsia,fundi_i_regjistimit) values( 4,2,' 2020-01-21','2020-01-21','5€',true,'2021-12-31');
insert into Detajet_Lexuesit(Leid ,Pid ,Vitiiregjistrimit,Dataeregjistrimit ,Çmimiiregjistrimit,Antarsia,fundi_i_regjistimit) values( 5,2,' 2020-02-01','2020-02-01','5€',true,'2021-12-31');
insert into Detajet_Lexuesit(Leid ,Pid ,Vitiiregjistrimit,Dataeregjistrimit ,Çmimiiregjistrimit,Antarsia,fundi_i_regjistimit) values( 6,2,' 2020-02-01-','2020-02-01','5€',true,'2021-12-31');
insert into Detajet_Lexuesit(Leid ,Pid ,Vitiiregjistrimit,Dataeregjistrimit ,Çmimiiregjistrimit,Antarsia,fundi_i_regjistimit) values( 7,3,' 2021-04-01','2021-04-01','5€',true,'2021-12-31');
insert into Detajet_Lexuesit(Leid ,Pid ,Vitiiregjistrimit,Dataeregjistrimit ,Çmimiiregjistrimit,Antarsia,fundi_i_regjistimit) values( 8,3,' 2021-04-01','2021-04-01','5€',true,'2021-12-31');
insert into Detajet_Lexuesit(Leid ,Pid ,Vitiiregjistrimit,Dataeregjistrimit ,Çmimiiregjistrimit,Antarsia,fundi_i_regjistimit) values( 9,3,' 2021-04-01','2021-04-01','5€',true,'2021-12-31');
insert into Detajet_Lexuesit(Leid ,Pid ,Vitiiregjistrimit,Dataeregjistrimit ,Çmimiiregjistrimit,Antarsia,fundi_i_regjistimit) values( 10,4,' 2020-01-02','2020-01-02','5€',true,'2021-12-31');


insert into Punëtori(Pid ,Emri,Mbiemri,Titulli,Paga) values( 1,' Blerta','Jashari','Biblotekiste','400');
insert into Punëtori(Pid ,Emri,Mbiemri,Titulli,Paga) values( 2,' Eljesa','Gashi','Biblotekiste','400');
insert into Punëtori(Pid ,Emri,Mbiemri,Titulli,Paga) values( 3,' Fetah','Mehmeti','Biblotekist','400');
insert into Punëtori(Pid ,Emri,Mbiemri,Titulli,Paga) values( 4,' Rron','Hoxha','Biblotekist','400');


insert into Contact_Punëtori(Pid ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 1,' Uke Sadiku','Prishtine','Kosove','10001','044 425 642','+383 44 425 642','Blerta_Jashari@gmail.com');
insert into Contact_Punëtori(Pid ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 2,' Visar Dodani','Prishtine','Kosove','10001','044 451 781','+383 44 451 781','Eljesa_Gashi@gmail.com');
insert into Contact_Punëtori(Pid ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 3,' Visar Dodani','Prishtine','Kosove','10001','044 524 671','+383 44 524 671','Fetah_Mehmeti@gmail.com');
insert into Contact_Punëtori(Pid ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 4,' Uke Sadiku','Prishtine','Kosove','10001','044 565 787','+383 44 565 787','Rron_Hoxha@gmail.com');


insert into Autorët(Aid ,Emri,Mbiemri,Gjinia,Datelindja) values( 1,' Ismajl','Kadare','M','1936-01-28-');
insert into Autorët(Aid ,Emri,Mbiemri,Gjinia,Datelindja) values( 2,' Dritero','Agolli','M','1931-01-13');
insert into Autorët(Aid ,Emri,Mbiemri,Gjinia,Datelindja) values( 3,'Naim ','Frasheri','M','1846-05-25');
insert into Autorët(Aid ,Emri,Mbiemri,Gjinia,Datelindja) values( 4,' Rexhep','Qosja','M','1936-06-25');
insert into Autorët(Aid ,Emri,Mbiemri,Gjinia,Datelindja) values( 5,' Fan','Noli','M','1882-01-06');


insert into Contact_Autori(Aid ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 1,' Teqja','Gjirokaster','Shqiperi','6001','044 451 781','+383 44 451 781','Ismajl_Kadare@gmail.com');
insert into Contact_Autori(Aid ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 2,' Bregu i Martinit','Gjirokaster','Shqiperi','6001','044 542 651','+383 44 542 651','Dritero_Agolli@gmail.com');
insert into Contact_Autori(Aid ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 3,' Guri i Bardhe','Frasher','Shqiperi','5002','044 765 999','+383 44 765 999','Naim_Frasheri@gmail.com');
insert into Contact_Autori(Aid ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 4,' Nuhi Berhami','Vuthaj','Shqiperi','3001','044 988 655','+383 44 988 655','Rexhep_Qosja@gmail.com');
insert into Contact_Autori(Aid ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 5,' Rrethi i Orfeut','Briktepe','Shqiperi','1002','044 898 564','+383 44 898 564','Fan_Noli@gmail.com');


insert into Libri(Lid ,Pid,Aid,Titulli,Zhanri,Numriikopjeve,Dataepranimit) values( 1,1,1,' "Prilli i thyer"','Novel','10','2020-04-03');
insert into Libri(Lid ,Pid,Aid,Titulli,Zhanri,Numriikopjeve,Dataepranimit) values( 2,2,2,' "Shkelqimi dhe renija e shokut Zylo"','Novel','6','2021-02-05');
insert into Libri(Lid ,Pid,Aid,Titulli,Zhanri,Numriikopjeve,Dataepranimit) values( 3,2,3,' "Lulet e Veres"','Poezi','7','2019-01-05');
insert into Libri(Lid ,Pid,Aid,Titulli,Zhanri,Numriikopjeve,Dataepranimit) values( 4,1,4,' "Pushteti i korruptuar"','Politik','3','2020-06-10');
insert into Libri(Lid ,Pid,Aid,Titulli,Zhanri,Numriikopjeve,Dataepranimit) values( 5,3,5,' "Albumi"','Poexi','20','2020-13-01');


insert into Huazimi_Librit(Lid ,Leid,Pid,aid,Dataehuazimit,Afatikthimit,Dataekthimit,Verejte) values( 1,3,2,1,' 2021-12-01','2021-12-16','2021-12-13','Nuk ka verejte');
insert into Huazimi_Librit(Lid ,Leid,Pid,aid,Dataehuazimit,Afatikthimit,Dataekthimit,Verejte) values( 2,1,2,2,' 2021-04-03','2021-04-18','2021-04-19','Nuk ka verejte');
insert into Huazimi_Librit(Lid ,Leid,Pid,aid,Dataehuazimit,Afatikthimit,Dataekthimit,Verejte) values( 3,4,3,3,' 2021-12-11','2021-12-26','2021-12-31','2 verejte');
insert into Huazimi_Librit(Lid ,Leid,Pid,aid,Dataehuazimit,Afatikthimit,Dataekthimit,Verejte) values( 4,2,1,4,' 2021-02-10','2021-02-25','2021-02-26','1 verejte');
insert into Huazimi_Librit(Lid ,Leid,Pid,aid,Dataehuazimit,Afatikthimit,Dataekthimit,Verejte) values( 4,3,1,4,' 2021-02-10','2021-02-25','2021-02-26','1 verejte');
insert into Huazimi_Librit(Lid ,Leid,Pid,aid,Dataehuazimit,Afatikthimit,Dataekthimit,Verejte) values( 4,3,2,4,' 2021-02-10','2021-02-25','2021-02-26','1 verejte');

select count(Lid) from Huazimi_Librit as 'Libri me i Lexuar';

insert into Arkiva(Arid ,Leid,Lid) values( 1,3,1);
insert into Arkiva(Arid ,Leid,Lid) values( 2,1,2);
insert into Arkiva(Arid ,Leid,Lid) values( 3,4,3);
insert into Arkiva(Arid ,Leid,Lid) values( 4,2,4);
insert into Arkiva(Arid ,Leid,Lid) values( 5,5,5);

insert into Libri_Dëmtuar(Lid,Pid,Verejte,Dataeregjistrimit) values( 2,2,'Demtimi i kopertines','2021-10-04');
insert into Libri_Dëmtuar(Lid,Pid,Verejte,Dataeregjistrimit) values( 3,3,'Demtimi i faqeve ne mes','2021-10-12');
insert into Libri_Dëmtuar(Lid,Pid,Verejte,Dataeregjistrimit) values( 2,1,'Demtimi i kopertines','2021-02-09');


insert into Donatorët(Did,Lid,Pid,Aid,Emri,Dataedonacionit,Numriikopjeve) values( 1,1,1,3,'Mehmet','2017-01-01',20);
insert into Donatorët(Did,Lid,Aid,Pid,Emri,Dataedonacionit,Numriikopjeve) values( 2,2,2,2,'Leart','2016-10-11',10);
insert into Donatorët(Did,Lid,Aid,Pid,Emri,Dataedonacionit,Numriikopjeve) values( 3,3,3,3,'Gresa','2016-12-12',10);
insert into Donatorët(Did,Lid,Aid,Pid,Emri,Dataedonacionit,Numriikopjeve) values( 4,4,4,4,'Bardha','2016-10-10',6);



insert into Contact_Donatori(Did ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 1,' "Skenderbeu" ','Gjilan','Kosove','30001','044 564 981','+383 44 564 981','Mehmet_Kastrati@gmail.com');
insert into Contact_Donatori(Did ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 2,' "Zahir Pajaziti" ','Podujeve','Kosove','40001','044 891 999','+383 44 891 999','Leart.Blakqori@gmail.com');
insert into Contact_Donatori(Did ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 3,' "Nuhi Sheholli" ','Prishtine','Kosove','10001','044 143 452','+383 44 143 452','Gresa.Lumbardhi@gmail.com');
insert into Contact_Donatori(Did ,Rruga ,Qyteti ,Shteti ,KodiPostal,TelefoniMobil,TelefoniFix,Email ) values( 4,' "Skenderbeu" ','Gjilan','Kosove','30001','044 987 452','+383 44 987 452','Bardha_Rrahmani@gmail.com');
