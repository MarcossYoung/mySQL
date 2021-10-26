/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
Drop DATABASE sqlentregable;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ sqlentregable /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE sqlentregable;

DROP TABLE IF EXISTS genero;
CREATE TABLE `genero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genero` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS notas;
CREATE TABLE `notas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `nota` text DEFAULT NULL,
  `fecha_crea` date DEFAULT NULL,
  `fecha_mod` date DEFAULT NULL,
  `id_creador` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `borrable` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_creador`) REFERENCES usuarios(`id`)

) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS usuarios;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

INSERT INTO genero(id,genero) VALUES(1,'-'),(2,X'6d7953716c'),(3,X'6a617661'),(4,X'707974686f6e'),(5,X'6a617661736372697074'),(6,X'65787072657373'),(7,X'52'),(8,X'6e6f64652e6a73'),(9,X'6c697465726174757261'),(10,X'6d6174656d617469636173');

INSERT INTO notas(id,titulo,nota,fecha_crea,fecha_mod,borrable,id_creador) Values (1, 'Money Money Money (L''aventure, c''est l''aventure)', 'Arthropathy following intestinal bypass, unspecified knee', '2020-12-05', '2021-06-13', 0, 4),
(2, 'Crime and Punishment', 'Nondisp intertroch fx unsp femr, 7thD', '2021-02-03', '2020-11-16', 0, 5),
(3, 'Pawnbroker, The', 'Other fracture of seventh cervical vertebra', '2021-06-29', '2021-07-30', 1, 5),
(4, 'Sybil', 'Congenital malformation of circulatory system, unspecified', '2021-01-10', '2021-08-26', 0, 10),
(5, 'Muzi v nadeji', 'Cont preg aft elctv fetl rdct of 1 fts or more,3rd tri, fts4', '2021-03-09', '2021-06-14', 0, 8),
(6, 'Less is More (Menos es más)', 'Acquired absence of leg below knee', '2021-08-23', '2020-12-26', 0, 2),
(7, 'Pride and Glory', 'Ocular lac/rupt w prolaps/loss of intraoc tissue, right eye', '2021-10-03', '2021-06-16', 0, 9),
(8, 'X Games 3D: The Movie', 'Oth osteopor w current path fracture, r forearm, init', '2021-05-21', '2021-02-21', 1, 9),
(9, 'Dinner, The (Diner, Het)', 'Myositis ossificans progressiva, right thigh', '2020-11-06', '2021-05-29', 1, 4),
(10, 'Fat Girl (À ma soeur!)', 'Rhabdomyolysis', '2021-06-18', '2021-03-26', 0, 8);
INSERT INTO usuarios(id,usuario,email) VALUES(1,'jorgito baltazar','jbaltzar@mail.com'),(2,'gito blotazar','jblotzar@mail.com'),(3,'joro azar','jbazar@mail.com'),(4,'jorgito bruno','jbruno@mail.com'),(5,'mark Kulimo','mkulimor@mail.com'),(6,'pepito baltazar','pbaltzar@mail.com'),(7,'domingo baltazar','dbaltzar@mail.com'),(8,'javier ortega','jortega@mail.com'),(9,'jaime benedit','jbenedit@mail.com'),(10,'paolo omar','pomar@mail.com');
SELECT  genero,COUNT(id) as total
from category_notas
GROUP BY id_genero;

create table borrables(SELECT * 
FROM notas
WHERE borrable = 1);

SELECT usuarios.id,usuarios.usuario, COUNT(notas.id) as total
from usuarios inner join notas on usuarios.id = notas.id_creador
GROUP BY id_creador;


Alter Table notas
add emailcreador text;

UPDATE notas, usuarios
Set notas.usuario = usuarios.usuario
Where id_creador = usuarios.id;


UPDATE notas, usuarios
Set emailcreador = usuarios.email
Where id_creador = usuarios.id;

DROP table category_notas;
CREATE Table category_notas(
  id int(11) NOT NULL ,
  id_genero int(11) NOT NULL ,
  genero TEXT,
  FOREIGN KEY (`id`) REFERENCES notas(`id`),
  FOREIGN KEY (`id_genero`) REFERENCES genero(`id`)
);
Insert into category_notas(id,id_genero) VALUES (3, 4),
(10, 3),
(8, 1),
(9, 2),
(10, 5),
(2, 7),
(5, 5),
(5, 2),
(6, 10),
(8, 2);
UPDATE category_notas, genero
set category_notas.genero = genero.genero
WHERE id_genero = genero.id;