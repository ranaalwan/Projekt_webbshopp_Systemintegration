 create table Kategorier(
 ID int auto_increment primary key,
 Namn varchar(30)
 );
 
 
 CREATE TABLE produkter(
   id int NOT NULL,
   nman varchar(255) DEFAULT NULL,
   Storlek int DEFAULT NULL,
   färg varchar(255) DEFAULT NULL,
   pris int DEFAULT NULL,
   Märke varchar(255) DEFAULT NULL,
   Lagerantal int DEFAULT NULL,
   PRIMARY KEY (`ID`)
 );
 
 
create table ProducktKategorier (
id int not null auto_increment primary key,
produktid int(20) not null,
kategoriid int(20) not  null,
Foreign key (IDProdukt) references produkter (ID) ,
Foreign key (IDkategori) references kategorier (ID)
);


 CREATE TABLE `beställningar` (
   `id` int NOT NULL AUTO_INCREMENT,
   `kundid` int NOT NULL,
   `datum` timestamp NULL DEFAULT NULL,
   `harbeställning` tinyint(1) DEFAULT NULL,
   PRIMARY KEY (`id`),
   KEY `IDKund` (`kundid`),
   CONSTRAINT `beställningar_ibfk_1` FOREIGN KEY (`kundid`) REFERENCES `kunder` (`id`)
 ); 
 
  
 create table OrderDetaljer (
 id int not null auto_increment primary key,
 beställningid int (20) ,
 producktid int(20),
 antal int (20),
 Foreign key (beställningid) references beställningar(id) ,
 Foreign key (producktid) references produkter(id)
 );
 
 
 CREATE TABLE kunder (
   id int NOT NULL,
   namn varchar(255) DEFAULT NULL,
   adress varchar(255) DEFAULT NULL,
   PRIMARY KEY (id)
 );
 

 
 
INSERT INTO `webbshop`. `kategorier` ( `id` , `namn`) VALUES ('1' , 'Kläning');
INSERT INTO `webbshop`. `kategorier` ( `id` , `namn`) VALUES ('2' , 'Byxor'); 
INSERT INTO `webbshop`. `kategorier` ( `id` , `namn`) VALUES ('3' , 'skor'); 
INSERT INTO `webbshop`. `kategorier` ( `id` , `namn`) VALUES ('4' , 'tröja');
INSERT INTO `webbshop`. `kategorier` ( `id` , `namn`) VALUES ('5' , 'Stompor');
INSERT INTO `webbshop`. `kategorier` ( `id` , `namn`) VALUES ('6' , 'jacka');
 

INSERT INTO `webbshop`. `producktkategorier` ( `id` , `produktid`  , `kategoriid`) VALUES ('1' , '2' , '4');
INSERT INTO `webbshop`. `producktkategorier` ( `id` , `produktid`  , `kategoriid`) VALUES ('2' , '1' , '2');
INSERT INTO `webbshop`. `producktkategorier` ( `id` , `produktid`  , `kategoriid`) VALUES ('3' , '4' , '3');
INSERT INTO `webbshop`. `producktkategorier` ( `id` , `produktid`  , `kategoriid`) VALUES ('4' , '3' , '1');
INSERT INTO `webbshop`. `producktkategorier` ( `id` , `produktid`  , `kategoriid`) VALUES ('5' , '6' , '4');
INSERT INTO `webbshop`. `producktkategorier` ( `id` , `produktid`  , `kategoriid`) VALUES ('6' , '7' , '5');
INSERT INTO `webbshop`. `producktkategorier` ( `id` , `produktid`  , `kategoriid`) VALUES ('7' , '8' , '3');
INSERT INTO `webbshop`. `producktkategorier` ( `id` , `produktid`  , `kategoriid`) VALUES ('8' , '5' , '6');


 
INSERT INTO `webbshop`. `produkter` ( `id` , `namn`  , `storlek`  `färg` , `pris` , `märke` , `lagerantal` ) VALUES ('1' , 'shorts' , '38' , 'svart' , '277' , 'SweetPants' , '15');
INSERT INTO `webbshop`. `produkter` ( `id` , `namn`  , `storlek`  `färg` , `pris` , `märke` , `lagerantal` ) VALUES ('2' , 'sommar-tröja' , '30' , 'vit' , '122' , 'BasicWear' , '23');
INSERT INTO `webbshop`. `produkter` ( `id` , `namn`  , `storlek`  `färg` , `pris` , `märke` , `lagerantal` ) VALUES ('3' , 'lång-Kläning' , '45' , 'blå' , '169' , 'FashionStyle' , '12');
INSERT INTO `webbshop`. `produkter` ( `id` , `namn`  , `storlek`  `färg` , `pris` , `märke` , `lagerantal` ) VALUES ('4' , 'herrskor' , '40' , 'röd' , '340' , 'Sporty' , '7');
INSERT INTO `webbshop`. `produkter` ( `id` , `namn`  , `storlek`  `färg` , `pris` , `märke` , `lagerantal` ) VALUES ('5' , 'vinterjacka' , '23' , 'grå' , '250' , 'Trendy' , '20');
INSERT INTO `webbshop`. `produkter` ( `id` , `namn`  , `storlek`  `färg` , `pris` , `märke` , `lagerantal` ) VALUES ('6' , 'ulltröja' , '62' , 'gul' , '400' , 'UrbanStyle' , '17');
INSERT INTO `webbshop`. `produkter` ( `id` , `namn`  , `storlek`  `färg` , `pris` , `märke` , `lagerantal` ) VALUES ('7' , 'DamStrompor' , '23' , 'lilla' , '52' , 'Conzy' , '33');
INSERT INTO `webbshop`. `produkter` ( `id` , `namn`  , `storlek`  `färg` , `pris` , `märke` , `lagerantal` ) VALUES ('8' , 'sportskor' , '35' , 'grön' , '540' , 'Denimy' , '43');

 
INSERT INTO `webbshop`.`orderdetaljer` (`id`, `IDBeställning`, `IDProduckt`, `antal`) VALUES ('1', '1', '1', '3');
INSERT INTO `webbshop`.`orderdetaljer` (`id`, `IDBeställning`, `IDProduckt`, `antal`) VALUES ('2', '1', '2', '2');
INSERT INTO `webbshop`.`orderdetaljer` (`id`, `IDBeställning`, `IDProduckt`, `antal`) VALUES ('3', '3', '3', '5');
INSERT INTO `webbshop`.`orderdetaljer` (`id`, `IDBeställning`, `IDProduckt`, `antal`) VALUES ('4', '4', '4', '8');
INSERT INTO `webbshop`.`orderdetaljer` (`id`, `IDBeställning`, `IDProduckt`, `antal`) VALUES ('5', '2', '5', '3');
INSERT INTO `webbshop`.`orderdetaljer` (`id`, `IDBeställning`, `IDProduckt`, `antal`) VALUES ('6', '4', '6', '2');
INSERT INTO `webbshop`.`orderdetaljer` (`id`, `IDBeställning`, `IDProduckt`, `antal`) VALUES ('7', '2', '7', '5');
INSERT INTO `webbshop`.`orderdetaljer` (`id`, `IDBeställning`, `IDProduckt`, `antal`) VALUES ('8', '6', '8', '3');
 
 
 
INSERT INTO `webbshop`. `beställningar` ( `id` , `kundid`  , `datum` ,`harbeställning` ) VALUES ('1' , '3' , '2023-08-15',' 1');
INSERT INTO `webbshop`. `beställningar` ( `id` , `kundid`  , `datum` ,`harbeställning` ) VALUES ('2' , '4' , '2023-07-03',' 0');
INSERT INTO `webbshop`. `beställningar` ( `id` , `kundid`  , `datum` ,`harbeställning` ) VALUES ('3' , '5' , '2023-05-06',' 1');
INSERT INTO `webbshop`. `beställningar` ( `id` , `kundid`  , `datum` ,`harbeställning` ) VALUES ('4' , '1' , '2023-02-09',' 1');
INSERT INTO `webbshop`. `beställningar` ( `id` , `kundid`  , `datum` ,`harbeställning` ) VALUES ('5' , '2' , '2023-01-13',' 0');
INSERT INTO `webbshop`. `beställningar` ( `id` , `kundid`  , `datum` ,`harbeställning` ) VALUES ('6' , '4' , '2023-06-03',' 1');
 


INSERT INTO `webbshop`. `kunder` ( `id` , `namn`  , `addres`) VALUES ('1' , 'Anna Anderson' , 'Stockholm ');
INSERT INTO `webbshop`. `kunder` ( `id` , `namn`  , `addres`) VALUES ('2' , 'Erik Larson' , 'Malmö');
INSERT INTO `webbshop`. `kunder` ( `id` , `namn`  , `addres`) VALUES ('3' , 'Maria Peterson' , 'Falkenberg');
INSERT INTO `webbshop`. `kunder` ( `id` , `namn`  , `addres`) VALUES ('4' , 'Anders Nilson' , 'Göteborg');
INSERT INTO `webbshop`. `kunder` ( `id` , `namn`  , `addres`) VALUES ('5' , 'Emma Erixon' , 'Trölhatan');






>>>>>>>>>>>>>>>>>>>>>>>>>>>
Frågan 1;

SELECT kunder.namn
FROM beställningar
INNER JOIN kunder ON kunder.id = beställningar.kundid
INNER JOIN orderdetaljer ON beställningar.id = orderdetaljer.beställningid
INNER JOIN produkter ON orderdetaljer.produktid = produkter.id
INNER JOIN producktkategorier ON producktkategorier.produktid = produkter.id
INNER JOIN kategorier ON producktkategorier.kategoriid = kategorier.id
WHERE produkter.färg = 'svart' AND produkter.Storlek = 38 AND produkter.Märke = 'SweetPants';

Frågan 2;

SELECT Kategorier.Namn AS Kategori, COUNT(produkter.id) AS Antal_Produkter
FROM Kategorier
LEFT JOIN ProducktKategorier ON Kategorier.id = ProducktKategorier.kategoriid
LEFT JOIN produkter ON ProducktKategorier.produktid = produkter.id
GROUP BY Kategorier.Namn;

 Frågan 3;
 
SELECT kunder.namn AS Kundens_Namn, SUM(produkter.pris * orderdetaljer.antal) AS Totalt_Värde
FROM kunder
LEFT JOIN beställningar ON kunder.id = beställningar.kundid
LEFT JOIN orderdetaljer ON beställningar.id = orderdetaljer.beställningid
LEFT JOIN produkter ON orderdetaljer.produktid = produkter.id
GROUP BY Kundens_Namn;

Frågan 4;
SELECT kunder.addres AS Ort, SUM(produkter.pris * orderdetaljer.antal) AS Totalt_Värde
FROM kunder
LEFT JOIN beställningar ON kunder.id = beställningar.kundid
LEFT JOIN orderdetaljer ON beställningar.id = orderdetaljer.beställningid
LEFT JOIN produkter ON orderdetaljer.produktid = produkter.id
GROUP BY Ort
HAVING Totalt_Värde > 1000;


SELECT kunder.addres AS Ort, SUM(produkter.pris * orderdetaljer.antal) AS Totalt_Värde
FROM kunder
LEFT JOIN beställningar ON kunder.id = beställningar.kundid
LEFT JOIN orderdetaljer ON beställningar.id = orderdetaljer.beställningid
LEFT JOIN produkter ON orderdetaljer.produktid = produkter.id
GROUP BY Ort
HAVING Totalt_Värde < 1000 OR Totalt_Värde IS NULL;

Frågan 5;

SELECT produkter.namn AS Produkt_Namn, SUM(orderdetaljer.antal) AS Totalt_Antal_Sålda
FROM produkter
INNER JOIN orderdetaljer ON produkter.id = orderdetaljer.produktid
GROUP BY Produkt_Namn
ORDER BY Totalt_Antal_Sålda DESC
LIMIT 5;


Frågan 6;

SELECT MONTH(datum) AS Månad, SUM(produkter.pris * OrderDetaljer.antal) AS Totalt_Försäljningsvärde
FROM beställningar
INNER JOIN kunder ON kunder.id = beställningar.kundid
INNER JOIN orderdetaljer ON orderdetaljer.beställningid = beställningar.id
INNER JOIN produkter ON orderdetaljer.produktid = produkter.id
GROUP BY Månad
ORDER BY Totalt_Försäljningsvärde DESC
LIMIT 1;
