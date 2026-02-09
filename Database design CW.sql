
DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS paintings;
DROP TABLE IF EXISTS exhibitions;
DROP TABLE IF EXISTS Lcollecton;
DROP TABLE IF EXISTS Pcollection;
DROP TABLE IF EXISTS Pexhibition;
DROP TABLE IF EXISTS Partist;
CREATE TABLE IF NOT EXISTS artists (
ARid INT PRIMARY KEY,
Fname VARCHAR(50) NOT NULL,
Lname VARCHAR(50) NOT NULL,
DoB DATE,
Astatus VARCHAR(50) DEFAULT "Inactive",
Astyle VARCHAR(50)

)ENGINE=InnoDB;

INSERT INTO artists (ARid,Fname,Lname,DoB,Astatus,Astyle)
VALUES
	(22365,"Leonardo"," Da Vinci","1452-04-15","Inactive","Sfumato technique"),
	(21489,"Michelangelo","Simoni","1475-03-06","Inactive","Frescoes"),
	(23690,"Rembrandt","Rijn","1606-07-15","Inactive","Baroque style"),
	(24691,"Johannes","Vermeer","1632-10-31","Inactive","Baroque style"),
	(25690,"Jean-Antoine","Watteau","1684-10-10","Inactive","Baroque style"),
	(26690,"Eugene","Delacroix","1798-04-26","Inactive","Flochetage"),
	(23692,"Claude","Monet","1840-11-14","Inactive","Impressionism"),
	(23693,"Georges","Seurat","1859-12-02","Inactive","pointilism"),
	(27677,"Vincent","van Gogh","1853-03-30","Inactive","Post-Impressionism"),
	(27660,"Edvard","Munch","1863-12-12","Inactive","Post-Impressionism"),
	(27650,"Pablo","Picasso","1881-10-25","Inactive","Collage"),
	(27990,"Frida","Kahlo","1907-07-06","Inactive","Realism");
	

CREATE TABLE IF NOT EXISTS paintings(
Pid INT PRIMARY KEY,
Pname VARCHAR(500) NOT NULL,
VlueUSD VARCHAR(500),
Dcription  VARCHAR(500),
Pstyle VARCHAR(500),
ACQdetails VARCHAR(500)

)ENGINE=InnoDB;

INSERT INTO paintings (Pid,Pname,VlueUSD,Dcription,Pstyle,ACQdetails)
VALUES
	(12365,"Mona Lisa","priceless","Renaissance depiction of the Virgin Mary","Sfumato","Loaned from Louvre Museum"),
	(11489,"Last Supper","450000000","Symbolizes the last meal shared with Christ","Frescoes","Bought from Santa Maria delle Grazie"),
	(13690,"Vitruvian Man","1000000000","Man portrayed in different stances simultaneously","Baroque","Bought from the Accademia Gallery"),
	(14691,"Self Portrait","450000000","Portrait of Leonardo da Vinci","Baroque","Loaned From Library of Turin"),
	(15690,"Guernica","200000000","Violent scene between half-man and half-animal creatures","Baroque","Bought from Museo Reina Sofia"),
	(16690,"The Weeping Woman","100000000","Tribute to Dora Maar","Flochetage","Bought from Tate Gallery"),
	(13692,"Starry Night","100000000","Landscape painting of an expressive night sky over a small hillside village ","Impressionism","Bought from The Museum of Modern Art"),
	(13693,"Sunflowers","72000000","Sunflowers in a vase","Pointilism","Loaned from Van Gogh Museum"),
	(17677,"Self-Portrait","71000000","One of the final portraits of himself before his death","Post-Impressionism","Bought from Musee d'Orsay"),
	(17660,"The Creation of Adam","undefined","Inspired biblical scenes taken from the book of genesis ","Post-Impressionism","Bought from Sistine Chapel"),
	(17650,"The Last Judgement","269000","Commisioned by Pope Clement VII","Fresco","Loaned from Sistine Chapel"),
	(17990,"The Two Fridas","undefined","In this painting Frida explores two sides of herself","Realism","Bought from Mexico city");
	

CREATE TABLE IF NOT EXISTS exhibitions (
Eid INT PRIMARY KEY,
Ename VARCHAR(500) NOT NULL,
Etheme VARCHAR(500),
Sdate  DATE,
DurationYRS FLOAT(2,1)

)ENGINE=InnoDB;

INSERT INTO exhibitions (Eid,Ename,Etheme,Sdate,DurationYRS)
VALUES
	(42365,"Sfumato","Leonardo da Vinci","2020-03-20","5.5"),
	(41489,"Collage","Pablo Picasso","2020-03-20","6"),
	(43690,"Post-Impressionism","Van Gogh","2020-03-20","6"),
	(44691,"Frescoes","Michelangelo","2022-08-10","7.5"),
	(45690,"Realism","Frida Kahlo","2022-10-10","2.5");
	
CREATE TABLE IF NOT EXISTS Lcollection (
FKpaintID INT,

FOREIGN KEY(FKpaintID) REFERENCES paintings(Pid)



)ENGINE=InnoDB;


INSERT INTO Lcollection (FKpaintID)
VALUES
	(12365),
	(14691),
	(13693),
	(17650);
	
CREATE TABLE IF NOT EXISTS Pcollection (
FKpaintID2 INT,

FOREIGN KEY(FKpaintID2) REFERENCES paintings(Pid)



)ENGINE=InnoDB;


INSERT INTO Pcollection (FKpaintID2)
VALUES
	(11489),
	(13690),
	(15690),
	(16690),
	(13692),
	(17677),
	(17660),
	(17990);
	




CREATE TABLE IF NOT EXISTS Pexhibition (
    FKexhibitionID INT,
    FKpaintID3 INT,
    FOREIGN KEY (FKpaintID3) REFERENCES paintings(Pid),
    FOREIGN KEY (FKexhibitionID) REFERENCES exhibitions(Eid)
) ENGINE=InnoDB;

INSERT INTO Pexhibition (FKpaintID3,FKexhibitionID)
VALUES
	(12365,42365),
	(11489,42365),
	(13690,42365),
	(14691,42365),
	(15690,41489),
	(16690,41489),
	(13692,43690),
	(13693,43690),
	(17677,43690),
	(17660,44691),
	(17650,44691),
	(17990,45690);

	
CREATE TABLE IF NOT EXISTS Partist (
    FKartistID INT,
    FKpaintID4 INT,
    FOREIGN KEY (FKpaintID4) REFERENCES paintings(Pid),
    FOREIGN KEY (FKartistID) REFERENCES artists(ARid)
) ENGINE=InnoDB;

INSERT INTO Partist (FKpaintID4, FKartistID)
VALUES
	(12365,22365),
	(11489,22365),
	(13690,22365),
	(14691,22365),
	(15690,27650),
	(16690,27650),
	(13692,27677),
	(13693,27677),
	(17677,27677),
	(17660,21489),
	(17650,21489),
	(17990,27990);




	

	

	

