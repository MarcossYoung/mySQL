/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
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
  `id_modficiador` int(11) DEFAULT NULL,
  `usuario_mod` varchar(20) DEFAULT NULL,
  `id_genero` int(11) NOT NULL,
  `titulo_genero` varchar(20) DEFAULT NULL,
  `borrable` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS usuarios;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

INSERT INTO genero(id,genero) VALUES(1,X'676974'),(2,X'6d7953716c'),(3,X'6a617661'),(4,X'707974686f6e'),(5,X'6a617661736372697074'),(6,X'65787072657373'),(7,X'52'),(8,X'6e6f64652e6a73'),(9,X'6c697465726174757261'),(10,X'6d6174656d617469636173');

INSERT INTO notas(id,titulo,nota,fecha_crea,fecha_mod,id_creador,usuario,id_modficiador,usuario_mod,id_genero,titulo_genero,borrable) VALUES(1,'Optimized optimal definition',X'41637469766974792c20776174657220706f6c6f','2021-07-01','2021-05-26',3,'joro azar',1,'jorgito baltazar',9,'literatura',0),(2,'Ameliorated asynchronous instruction set',X'496e74656e74696f6e616c2073656c662d6861726d20627920737465616d206f7220686f74207661706f72732c2073657175656c61','2021-06-05','2021-05-25',5,'mark Kulimo',9,'jaime benedit',2,'mySql',1),(3,'Polarised heuristic parallelism',X'556e737065636966696564206672616374757265206f66206c6f77657220656e64206f6620756e7370656369666965642066656d75722c2073756273657175656e7420656e636f756e74657220666f72206f70656e20667261637475726520747970652049206f722049492077697468206e6f6e756e696f6e','2021-07-15','2021-08-07',10,'paolo omar',7,'domingo baltazar',10,'matematicas',1),(4,'Phased optimal methodology',X'4d616c69676e616e74206e656f706c61736d206f66207269676874206f76617279','2021-03-15','2021-08-08',9,'jaime benedit',5,'mark Kulimo',6,'express',0),(5,'Advanced fault-tolerant Graphic Interface',X'436f72726f73696f6e206f66207365636f6e6420646567726565206f66206d756c7469706c65207369746573206f66206c656674206c6f776572206c696d622c2065786365707420616e6b6c6520616e6420666f6f742c2073756273657175656e7420656e636f756e746572','2021-09-22','2021-07-08',4,'jorgito bruno',9,'jaime benedit',8,'node.js',1),(6,'Organized demand-driven parallelism',X'426c65706861726f636f6e6a756e6374697669746973','2020-12-19','2021-04-08',9,'jaime benedit',10,'paolo omar',6,'express',0),(7,'Down-sized neutral attitude',X'436f6e747573696f6e206f66206c656674206d6964646c652066696e67657220776974686f75742064616d61676520746f206e61696c','2021-03-15','2021-01-24',4,'jorgito bruno',8,'javier ortega',4,'python',1),(8,'Reactive heuristic application',X'506f737470726f6365647572616c2068656d61746f6d6120616e64207365726f6d61206f662061206469676573746976652073797374656d206f7267616e206f722073747275637475726520666f6c6c6f77696e6720612070726f636564757265','2021-03-23','2021-08-19',6,'pepito baltazar',1,'jorgito baltazar',7,'R',1),(9,'Face to face static approach',X'53706972696c6c6f736973','2021-05-14','2021-09-04',6,'pepito baltazar',8,'javier ortega',4,'python',1),(10,'Streamlined demand-driven pricing structure',X'4f746865722073706563696669656420696e6a757279206f6620646565702070616c6d61722061726368206f6620756e7370656369666965642068616e642c2073756273657175656e7420656e636f756e746572','2021-09-08','2021-07-23',7,'domingo baltazar',10,'paolo omar',6,'express',1);
INSERT INTO usuarios(id,usuario,email) VALUES(1,'jorgito baltazar','jbaltzar@mail.com'),(2,'gito blotazar','jblotzar@mail.com'),(3,'joro azar','jbazar@mail.com'),(4,'jorgito bruno','jbruno@mail.com'),(5,'mark Kulimo','mkulimor@mail.com'),(6,'pepito baltazar','pbaltzar@mail.com'),(7,'domingo baltazar','dbaltzar@mail.com'),(8,'javier ortega','jortega@mail.com'),(9,'jaime benedit','jbenedit@mail.com'),(10,'paolo omar','pomar@mail.com');

SELECT genero.id,genero, COUNT(notas.id) as total
from genero inner join notas on genero.id = notas.id_genero
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
Set notas.usuario_mod = usuarios.usuario
Where id_modficiador = usuarios.id;

UPDATE notas, usuarios
Set emailcreador = usuarios.email
Where id_creador = usuarios.id;

UPDATE notas, genero
Set notas.titulo_genero = genero.genero
Where id_genero = genero.id;