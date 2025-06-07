-- Insertion des utilisateurs (mots de passe hashés en SHA-256)
-- admin123 -> jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=
-- user123 -> 6l+JUG4Xn1LwNWda9kS9Ug9KWUgw1aKKGqGqcfv7jEk=
INSERT INTO utilisateurs (login, mot_de_passe, nom, role) 
VALUES ('admin', 'jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=', 'Administrateur', 'ADMIN');

INSERT INTO utilisateurs (login, mot_de_passe, nom, role) 
VALUES ('user', '6l+JUG4Xn1LwNWda9kS9Ug9KWUgw1aKKGqGqcfv7jEk=', 'Utilisateur', 'USER');

-- Insertion des marques
INSERT INTO Marque (nom, origine) VALUES ('Samsung', 'Corée du Sud');
INSERT INTO Marque (nom, origine) VALUES ('Apple', 'États-Unis');
INSERT INTO Marque (nom, origine) VALUES ('Xiaomi', 'Chine');

-- Insertion des produits
INSERT INTO Produit (reference, marque_nom, denomination, prix, poids, volume) 
VALUES ('SAM-S23-001', 'Samsung', 'Galaxy S23', 999.99, 0.168, 0.146);

INSERT INTO Produit (reference, marque_nom, denomination, prix, poids, volume) 
VALUES ('APP-IP14-001', 'Apple', 'iPhone 14', 1099.99, 0.172, 0.146);

INSERT INTO Produit (reference, marque_nom, denomination, prix, poids, volume) 
VALUES ('XIA-13P-001', 'Xiaomi', '13 Pro', 899.99, 0.229, 0.163);

-- Création des stocks
INSERT INTO Stock (nom, liste_de_stock_json) 
VALUES ('Magasin Paris', '{"liste":[{"refProduit":"SAM-S23-001","quantite":50},{"refProduit":"APP-IP14-001","quantite":30}]}');

INSERT INTO Stock (nom, liste_de_stock_json) 
VALUES ('Magasin Lyon', '{"liste":[{"refProduit":"XIA-13P-001","quantite":40},{"refProduit":"SAM-S23-001","quantite":25}]}'); 