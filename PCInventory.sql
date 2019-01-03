DROP DATABASE IF EXISTS m104;
CREATE DATABASE IF NOT EXISTS m104;

use m104;
CREATE TABLE IF NOT EXISTS Hersteller (							
	hid INT AUTO_INCREMENT,
	hersteller VARCHAR(140) UNIQUE,
	telnr VARCHAR(140) UNIQUE,
	email VARCHAR(140) UNIQUE,
	PRIMARY KEY (hid)
);
	
CREATE TABLE IF NOT EXISTS Modell (				
	mid INT AUTO_INCREMENT,
	modell VARCHAR(140) UNIQUE,
	hersteller INT,
	FOREIGN KEY (hersteller) REFERENCES Hersteller(hid),
	PRIMARY KEY (mid)
);
	
CREATE TABLE IF NOT EXISTS Personalcomputer (					
	pid INT AUTO_INCREMENT,
	seriennummer INT UNIQUE,
	cpughz DOUBLE,
	gbram INT,
	gbhd INT,
	modell INT,
	FOREIGN KEY (modell) REFERENCES Modell(mid),
	PRIMARY KEY (pid)
);
	
CREATE TABLE IF NOT EXISTS Komponente (							
	kid INT AUTO_INCREMENT,
	komponente VARCHAR(140) UNIQUE,
	PRIMARY KEY (kid)
);

CREATE TABLE IF NOT EXISTS Komponente_PC (						
	kid INT,
	pcid INT,
	FOREIGN KEY (pcid) REFERENCES  Personalcomputer(pid),
	FOREIGN KEY (kid) REFERENCES Komponente(kid),
	PRIMARY KEY (kid,pcid)
);				
