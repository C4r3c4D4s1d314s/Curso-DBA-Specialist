-- EM CONSTRUÇÃO






-- Início do script SQL
-- verifica e deleta DB criado anteriormente
drop database oficina;

-- Criação do DB
create database oficina;
USE oficina;

-- Tabela Model

CREATE TABLE Model (
MoId INT PRIMARY KEY,
MoMaker VARCHAR(15) NOT NULL,
MoType Enum('Passeio', 'Carga', 'Agrícola') default 'Passeio',
MoModel VARCHAR(15) NOT NULL,
MoSubModel VARCHAR(15)
  );
alter table Model auto_increment = 1;


-- -----------------------------------------------------
-- Tabela Driver
-- -----------------------------------------------------
CREATE TABLE Driver (
  DrId INT PRIMARY KEY,
  DrName VARCHAR(25) NULL,
  DrFone1 VARCHAR(13) NULL,
  DrFone2 VARCHAR(13) NULL,
  DrAdress VARCHAR(45) NULL
  );
alter table Driver auto_increment = 1;


-- -----------------------------------------------------
-- Tabela vehicle
-- -----------------------------------------------------
CREATE TABLE Vehicle (
  VeId INT PRIMARY KEY,
  VePlate VARCHAR(10) NOT NULL,
  MoId INT NOT NULL,
  DrId INT NOT NULL,
    CONSTRAINT fk_Vehicle_Modelo
    FOREIGN KEY (MoId)
    REFERENCES Model (MoId),
  CONSTRAINT fk_Vehicle_Driver
    FOREIGN KEY (DrId)
    REFERENCES Driver (DrId)
    );
alter table Vehicle auto_increment = 1;


-- -----------------------------------------------------
-- Tabela ServiceOrder
-- -----------------------------------------------------
CREATE TABLE ServiceOrder (
  SoId INT NOT NULL,
  SoValue FLOAT NOT NULL,
  SoAproved ENUM('Não aprovado', 'Aprovado') DEFAULT 'Não aprovado',
  SoStatus ENUM('Na fila', 'Em execução', 'Finalizado') DEFAULT 'Na fila',
  SoPayed ENUM('Não pago', 'Pago') DEFAULT 'Não pago',
  SoDelivery ENUM('Não entregue', 'Entregue') DEFAULT 'Não entregue',
  VeId INT NOT NULL,
  PRIMARY KEY (SoId),
    CONSTRAINT fk_ServiceOrder_Vehicle
    FOREIGN KEY (VeId)
    REFERENCES Vehicle (VeId)
    );
alter table ServiceOrder auto_increment = 1;


-- -----------------------------------------------------
-- Tabela Employe
-- -----------------------------------------------------
CREATE TABLE Employe (
  EmId INT NOT NULL,
  EmName VARCHAR(45) NULL,
  EmAddress VARCHAR(45) NULL,
  EmFone VARCHAR(13) NULL,
  PRIMARY KEY (EmId));
alter table Employe auto_increment = 1;


-- -----------------------------------------------------
-- Tabela Technician
-- -----------------------------------------------------
CREATE TABLE Technician (
  TeId INT NOT NULL,
  TeSpecialty VARCHAR(35) NULL,
  TeValue FLOAT NULL,
  EmId INT NOT NULL,
  PRIMARY KEY (TeId),
    CONSTRAINT fk_Technician_Employe
    FOREIGN KEY (EmId)
    REFERENCES Employe (EmId)
    );
    
alter table Technician auto_increment = 1;


-- -----------------------------------------------------
-- Tabela Team
-- -----------------------------------------------------
CREATE TABLE Team (
  SoId INT NOT NULL,
  TeId INT NOT NULL,
  PRIMARY KEY (SoId,TeId),
    CONSTRAINT fk_ServiceOrder_Team
    FOREIGN KEY (SoId)
    REFERENCES ServiceOrder (SoId),
  CONSTRAINT fk_ServiceOrder_Technician
    FOREIGN KEY (TeId)
    REFERENCES Technician (TeId)
    );
alter table Team auto_increment = 1;


-- -----------------------------------------------------
-- Tabela Material
-- -----------------------------------------------------
CREATE TABLE Material (
  `MtId` INT NOT NULL,
  `MtName` VARCHAR(45) NULL,
  `MtDescription` VARCHAR(45) NULL,
  `MtMaker` VARCHAR(45) NULL,
  `MtValue` FLOAT NULL,
  PRIMARY KEY (`MtId`));
alter table Material auto_increment = 1;


-- -----------------------------------------------------
-- Tabela MaterialList
-- -----------------------------------------------------
CREATE TABLE MaterialList (
  `SoId` INT NOT NULL,
  `MtId` INT NOT NULL,
  `MtQuantity` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`SoId`, `MtId`),
  CONSTRAINT `fk_ServiceOrder_MaterialList`
  FOREIGN KEY (`SoId`)
  REFERENCES `ServiceOrder` (`SoId`),
  CONSTRAINT `fk_ServiceOrder_Material`
  FOREIGN KEY (`MtId`)
  REFERENCES `Material` (`MtId`)
    );
alter table MaterialList auto_increment = 1;









-- INSERIR DADOS NAS TABELAS
 
 
 insert into Model
 (MoId,MoMaker,MoType,MoModel,MoSubModel)
Value
('1','Ford','Passeio','Mustang','GTX'),
('2','Ford','Passeio','Fiesta','Gl'),
('3','Ford','Passeio','Ka','1.0'),
('4','GM','Passeio','Corvette','GTO'),
('5','GM','Carga','S10','Turbo'),
('6','Fiat','Carga','Strada','LT'),
('7','Fiat','Passeio','Mob','1.0')
 ;
 
 -- 'Passeio', 'Carga', 'Agrícola'
 
insert into Driver
(DrId,DrName,DrFone1,DrFone2,DrAdress)
Value
('1','Marcos Garrido','99829-9092','','rua da casa do marcos 21'),
('2','Paulo Socorro','90018-8987','3336-2324','rua da oficina do paulo 53'),
('3','Nico Amaral','98314-2221','','rua da casa do nico 54')
;
 
insert into Vehicle
(VeId,VePlate,MoId,DrId)
Value
('1','shx 8k34','2','3'),
('2','irg 8uh6','6','1')
;
 
insert into ServiceOrder
(SoId,SoValue,SoAproved,SoStatus,SoPayed,SoDelivery,VeId)
Value
('1','200','Não aprovado','Na fila','Não pago','Não entregue','2'),
('2','550','Aprovado','Finalizado','Pago','Entregue','1')
;

-- 'Não aprovado', 'Aprovado'
-- 'Na fila', 'Em execução', 'Finalizado'
-- 'Não pago', 'Pago'
-- 'Não entregue','Entregue'


 insert into Employe
 (EmId,EmName,EmAddress,EmFone)
Value
('1','José Bezerra','avenida do josé 56','8585-2828'),
('2','Marcio Gaspar','alameda do marcio 77','3434-8787'),
('3','Gustavo Silva','rua do gustavo 22','9876-8753')
;
 
 insert into Technician
 (TeId,TeSpecialty,TeValue,EmId)
Value
('1','Mecânico Motor','30','1'),
('2','Mecânico Suspensão','20','2')
;
 
 insert into Team
 (SoId,TeId)
Value
('1','2'),
('2','1')
;
 
insert into Material
(MtId,MtName,MtDescription,MtMaker,MtValue)
Value
('1','Bico injetor',"jogo com 4 unidades",'Galtec','150'),
('2','Amortecedor',"traseiro",'Monroe','300'),
('3','Mola helicoidal',"dianteira",'Jard','200'),
('4','Pistão ford',"para ford",'Male','97'),
('5','Escapamento',"genérico",'Toks','250')
;
 
insert into MaterialList
(SoId,MtId,MtQuantity)
 Value
 ('1','1','1'),
 ('1','3','1'),
 ('1','5','1'),
 ('2','2','3'),
 ('2','4','5'),
 ('2','1','3')
 ;
 
 
 -- QUERIES
 SELECT * FROM Model;
 SELECT * FROM Driver;
 SELECT * FROM Vehicle;
  SELECT * FROM ServiceOrder;
 SELECT * FROM Employe;
 SELECT * FROM Technician;
 SELECT * FROM Team;
 SELECT * FROM Material;
 SELECT * FROM MaterialList;
 
 -- QUAIS MATERIAIS FORAM UTILIZADOS A ORDEM DE SERVIÇO 2
 
 SELECT s.SoId,MtName,MtQuantity,MtValue,(MtQuantity*MtValue) as 'Total'
 from
 ServiceOrder s join MaterialList ml join Material l
 where s.SoId = ml.SoId and ml.MtId=l.MtId and s.SoId='2';
 
 -- QUAIS MATERIAIS FORAM UTILIZADOS EM TODAS AS ORDENS DE SERVIÇO
 
 SELECT s.SoId,MtName,MtQuantity,MtValue,(MtQuantity*MtValue) as 'Total'
 from
 ServiceOrder s join MaterialList ml join Material l
 where
 s.SoId = ml.SoId and ml.MtId=l.MtId
 order by
 SoId asc, Total desc;
 
 SELECT VePlate,s.SoId,SoStatus,SoAproved,SoDelivery,TeSpecialty,EmName
 FROM
 Vehicle v join ServiceOrder s join Team t join Technician te join Employe e
 WHERE
 v.VeId=s.VeId and s.SoId=t.SoId and t.TeId=te.TeId and te.EmId=e.EmId
 HAVING s.SoAproved='Aprovado'
 