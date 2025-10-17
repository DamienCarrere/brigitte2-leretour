-- Jeu de données réaliste pour la base 'brigitte2'
START TRANSACTION;

-- ORDRES
INSERT INTO ordre (id, nom) VALUES
(1, 'Carnivores'),
(2, 'Primates'),
(3, 'Oiseaux'),
(4, 'Reptiles'),
(5, 'Amphibiens');

-- FAMILLES
INSERT INTO famille (id, ordre_id, nom) VALUES
(1, 1, 'Felidae'),
(2, 1, 'Canidae'),
(3, 2, 'Hominidae'),
(4, 3, 'Psittacidae'),
(5, 3, 'Accipitridae'),
(6, 4, 'Crocodylidae'),
(7, 4, 'Colubridae');

-- ESPECES
INSERT INTO espece (id, famille_id, nom) VALUES
(1, 1, 'Panthera leo'),
(2, 1, 'Panthera tigris'),
(3, 2, 'Canis lupus'),
(4, 3, 'Homo sapiens'),
(5, 4, 'Ara ararauna'),
(6, 5, 'Aquila chrysaetos'),
(7, 6, 'Crocodylus niloticus'),
(8, 7, 'Python regius');

-- ORIGINES
INSERT INTO origine (id, nom) VALUES
(1, 'Afrique'),
(2, 'Asie'),
(3, 'Amérique du Sud'),
(4, 'Europe'),
(5, 'Océanie');

-- EMPLOYÉS
INSERT INTO employe (id, nom, prenom, poste) VALUES
(1, 'Dupont', 'Lucie', 'Vétérinaire'),
(2, 'Martin', 'Jean', 'Soigneur'),
(3, 'Durand', 'Sophie', 'Soigneuse'),
(4, 'Morel', 'Hugo', 'Responsable des reptiles'),
(5, 'Bernard', 'Claire', 'Guide animalier'),
(6, 'Petit', 'Louis', 'Responsable oiseaux');

-- ALLÉES
INSERT INTO allee (id, employe_id, numero) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 4, 3),
(4, 6, 4);

-- CAGES
INSERT INTO cage (id, allee_id, numero) VALUES
(1, 1, 101),
(2, 1, 102),
(3, 2, 201),
(4, 2, 202),
(5, 3, 301),
(6, 3, 302),
(7, 4, 401),
(8, 4, 402);

-- ADOPTANTS
INSERT INTO adoptant (id, nom, prenom, adresse, telephone, email) VALUES
(1, 'Lefebvre', 'Paul', '12 rue des Lilas, Lyon', '0611223344', 'paul.lefebvre@example.com'),
(2, 'Moreau', 'Emma', '45 avenue de Paris, Nantes', '0622334455', 'emma.moreau@example.com');

-- CARNETS DE SANTÉ
INSERT INTO carnet_de_sante (id, date_vaccination) VALUES
(1, '2025-01-15'),
(2, '2024-11-02'),
(3, '2025-03-10'),
(4, '2024-07-22'),
(5, '2025-05-30'),
(6, '2024-12-01'),
(7, '2025-06-18'),
(8, '2025-04-05');

-- ANIMAUX
INSERT INTO animal (id, espece_id, origine_id, carnet_de_sante_id, cage_id, adoptant_id, nom, age, date_arrivee, sexe, adoptable) VALUES
(1, 1, 1, 1, 1, NULL, 'Simba', 6, '2020-05-14', 'Mâle', 0),
(2, 2, 2, 2, 2, NULL, 'Shere Khan', 9, '2018-08-09', 'Mâle', 0),
(3, 3, 4, 3, 3, 1, 'Luna', 4, '2022-03-10', 'Femelle', 1),
(4, 5, 3, 4, 7, NULL, 'Rio', 3, '2023-06-22', 'Mâle', 1),
(5, 6, 4, 5, 8, NULL, 'Aquila', 5, '2021-04-17', 'Femelle', 0),
(6, 7, 1, 6, 5, NULL, 'Snappy', 12, '2015-09-28', 'Mâle', 0),
(7, 8, 2, 7, 6, NULL, 'Pythonette', 7, '2017-11-03', 'Femelle', 0),
(8, 3, 4, 8, 4, 2, 'Rex', 2, '2024-05-12', 'Mâle', 1);

-- MALADIES
INSERT INTO maladie (id, nom, description) VALUES
(1, 'Grippe féline', 'Infection virale bénigne chez les félins'),
(2, 'Parasites intestinaux', 'Présence de vers ou parasites dans le système digestif'),
(3, 'Infection respiratoire', 'Difficulté à respirer, toux fréquente'),
(4, 'Blessure mineure', 'Petite coupure ou plaie à surveiller');

-- ANIMAL_MALADIE
INSERT INTO animal_maladie (animal_id, maladie_id) VALUES
(1, 1),
(2, 4),
(3, 2),
(6, 3);

-- MENUS
INSERT INTO menu (id, nom, type) VALUES
(1, 'Viande rouge', 'Carnivore'),
(2, 'Fruits tropicaux', 'Frugivore'),
(3, 'Graines et noix', 'Granivore'),
(4, 'Rongeurs vivants', 'Carnivore'),
(5, 'Poissons frais', 'Piscivore');

-- ANIMAL_MENU
INSERT INTO animal_menu (animal_id, menu_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 5),
(6, 4),
(7, 4),
(8, 2);

-- CAGE_EMPLOYE
INSERT INTO cage_employe (cage_id, employe_id) VALUES
(1, 2),
(2, 2),
(3, 3),
(4, 3),
(5, 4),
(6, 4),
(7, 6),
(8, 6);

COMMIT;
