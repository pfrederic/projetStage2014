-- Script : Modification de la base pour la file d'attente de l'envoie des fichier en SFTP
-- Auteur : F.Pignoly
-- Date création : 23/01/2014
-- Date modification : 23/01/2014

-- Ajout des tables
CREATE TABLE exportCommande (
id_export_commande			int auto_increment,
nom_fichier					varchar(50),
date_crea					date,
date_update					date,
statut						int,
nb_tentatives				int,
PRIMARY KEY (id_export_commande)
 );
 
CREATE TABLE statutExport (
statut_code					int auto_increment,
statut_lib					varchar(25),
PRIMARY KEY (statut_code)
 );
 
 -- Ajout d'un champs dans la table de commande
 ALTER TABLE commande
 ADD id_export_commande int;
 
-- Ajout des contraintes d'intégrités
ALTER TABLE exportCommande
ADD foreign key (statut) references statutExport(statut_code);

ALTER TABLE commande
ADD foreign key (id_export_commande) references exportCommande(id_export_commmande);

-- Ajout de queqlques données de base
INSERT INTO statutExport VALUES(NULL, "En attente"),(NULL, "Envoyé");