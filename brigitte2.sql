-- phpMyAdmin SQL Dump
-- version 5.2.2deb1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 17 oct. 2025 à 11:44
-- Version du serveur : 11.8.3-MariaDB-1+b1 from Debian
-- Version de PHP : 8.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `brigitte2`
--

-- --------------------------------------------------------

--
-- Structure de la table `adoptant`
--

CREATE TABLE `adoptant` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `adoptant`
--

INSERT INTO `adoptant` (`id`, `nom`, `prenom`, `adresse`, `telephone`, `email`) VALUES
(1, 'Lefebvre', 'Paul', '12 rue des Lilas, Lyon', '0611223344', 'paul.lefebvre@example.com'),
(2, 'Moreau', 'Emma', '45 avenue de Paris, Nantes', '0622334455', 'emma.moreau@example.com');

-- --------------------------------------------------------

--
-- Structure de la table `allee`
--

CREATE TABLE `allee` (
  `id` int(11) NOT NULL,
  `employe_id` int(11) DEFAULT NULL,
  `numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `allee`
--

INSERT INTO `allee` (`id`, `employe_id`, `numero`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 4, 3),
(4, 6, 4);

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

CREATE TABLE `animal` (
  `id` int(11) NOT NULL,
  `espece_id` int(11) NOT NULL,
  `origine_id` int(11) NOT NULL,
  `carnet_de_sante_id` int(11) NOT NULL,
  `cage_id` int(11) NOT NULL,
  `adoptant_id` int(11) DEFAULT NULL,
  `nom` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `date_arrivee` date NOT NULL,
  `sexe` varchar(255) NOT NULL,
  `adoptable` tinyint(1) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `animal`
--

INSERT INTO `animal` (`id`, `espece_id`, `origine_id`, `carnet_de_sante_id`, `cage_id`, `adoptant_id`, `nom`, `age`, `date_arrivee`, `sexe`, `adoptable`, `img`) VALUES
(1, 1, 1, 1, 1, NULL, 'Simba', 6, '2020-05-14', 'Mâle', 0, 'https://w0.peakpx.com/wallpaper/784/626/HD-wallpaper-lion-bokeh-king-of-beasts-predators-wildlife-beast-lions-panthera-leo.jpg'),
(2, 2, 2, 2, 2, NULL, 'Shere Khan', 9, '2018-08-09', 'Mâle', 0, 'https://tigers-world.com/wp-content/uploads/Bengal.jpg'),
(3, 3, 4, 3, 3, 1, 'Luna', 4, '2022-03-10', 'Femelle', 1, 'https://thumbs.dreamstime.com/b/un-loup-de-la-vall%C3%A9e-du-mackenzie-canis-lupus-occidentalis-dans-d%C3%A9frichage-il-s-agit-d-une-sous-esp%C3%A8ce-gris-et-plus-grand-286404238.jpg'),
(4, 5, 3, 4, 7, NULL, 'Rio', 3, '2023-06-22', 'Mâle', 1, 'https://w0.peakpx.com/wallpaper/758/1001/HD-wallpaper-blue-yellow-macaw-parrot-beautiful-yellow-bird-parrots-ara-ararauna.jpg'),
(5, 6, 4, 5, 8, NULL, 'Aquila', 5, '2021-04-17', 'Femelle', 0, 'https://res.cloudinary.com/dr0zfbman/images/f_auto,q_auto:good/v1683160971/WordPress%20Content/aquila-Yathin-S-Krishnappa_537968da/aquila-Yathin-S-Krishnappa_537968da.jpg?_i=AA'),
(6, 7, 1, 6, 5, NULL, 'Snappy', 12, '2015-09-28', 'Mâle', 0, 'https://res.cloudinary.com/dr0zfbman/images/w_850,h_500,c_scale/f_auto,q_auto:good/v1744097008/WordPress%20Content/Crocodylidae-pxhere-1/Crocodylidae-pxhere-1.jpg?_i=AA'),
(7, 8, 2, 7, 6, NULL, 'Pythonette', 7, '2017-11-03', 'Femelle', 0, 'https://illegalwildlifetrade.net/wp-content/uploads/2021/08/photo_4__daniel_natusch.jpg'),
(8, 3, 4, 8, 4, 2, 'Rex', 2, '2024-05-12', 'Mâle', 1, 'https://img.interempresas.net/fotos/3069809.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `animal_maladie`
--

CREATE TABLE `animal_maladie` (
  `animal_id` int(11) NOT NULL,
  `maladie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `animal_maladie`
--

INSERT INTO `animal_maladie` (`animal_id`, `maladie_id`) VALUES
(1, 1),
(2, 4),
(3, 2),
(6, 3);

-- --------------------------------------------------------

--
-- Structure de la table `animal_menu`
--

CREATE TABLE `animal_menu` (
  `animal_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `animal_menu`
--

INSERT INTO `animal_menu` (`animal_id`, `menu_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 5),
(6, 4),
(7, 4),
(8, 2);

-- --------------------------------------------------------

--
-- Structure de la table `cage`
--

CREATE TABLE `cage` (
  `id` int(11) NOT NULL,
  `allee_id` int(11) NOT NULL,
  `numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cage`
--

INSERT INTO `cage` (`id`, `allee_id`, `numero`) VALUES
(1, 1, 101),
(2, 1, 102),
(3, 2, 201),
(4, 2, 202),
(5, 3, 301),
(6, 3, 302),
(7, 4, 401),
(8, 4, 402);

-- --------------------------------------------------------

--
-- Structure de la table `cage_employe`
--

CREATE TABLE `cage_employe` (
  `cage_id` int(11) NOT NULL,
  `employe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cage_employe`
--

INSERT INTO `cage_employe` (`cage_id`, `employe_id`) VALUES
(1, 2),
(2, 2),
(3, 3),
(4, 3),
(5, 4),
(6, 4),
(7, 6),
(8, 6);

-- --------------------------------------------------------

--
-- Structure de la table `carnet_de_sante`
--

CREATE TABLE `carnet_de_sante` (
  `id` int(11) NOT NULL,
  `date_vaccination` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carnet_de_sante`
--

INSERT INTO `carnet_de_sante` (`id`, `date_vaccination`) VALUES
(1, '2025-01-15'),
(2, '2024-11-02'),
(3, '2025-03-10'),
(4, '2024-07-22'),
(5, '2025-05-30'),
(6, '2024-12-01'),
(7, '2025-06-18'),
(8, '2025-04-05');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20251016141331', '2025-10-16 14:13:45', 1300),
('DoctrineMigrations\\Version20251017102908', '2025-10-17 10:29:20', 145);

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `poste` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`id`, `nom`, `prenom`, `poste`) VALUES
(1, 'Dupont', 'Lucie', 'Vétérinaire'),
(2, 'Martin', 'Jean', 'Soigneur'),
(3, 'Durand', 'Sophie', 'Soigneuse'),
(4, 'Morel', 'Hugo', 'Responsable des reptiles'),
(5, 'Bernard', 'Claire', 'Guide animalier'),
(6, 'Petit', 'Louis', 'Responsable oiseaux');

-- --------------------------------------------------------

--
-- Structure de la table `espece`
--

CREATE TABLE `espece` (
  `id` int(11) NOT NULL,
  `famille_id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `espece`
--

INSERT INTO `espece` (`id`, `famille_id`, `nom`) VALUES
(1, 1, 'Panthera leo'),
(2, 1, 'Panthera tigris'),
(3, 2, 'Canis lupus'),
(4, 3, 'Homo sapiens'),
(5, 4, 'Ara ararauna'),
(6, 5, 'Aquila chrysaetos'),
(7, 6, 'Crocodylus niloticus'),
(8, 7, 'Python regius');

-- --------------------------------------------------------

--
-- Structure de la table `famille`
--

CREATE TABLE `famille` (
  `id` int(11) NOT NULL,
  `ordre_id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `famille`
--

INSERT INTO `famille` (`id`, `ordre_id`, `nom`) VALUES
(1, 1, 'Felidae'),
(2, 1, 'Canidae'),
(3, 2, 'Hominidae'),
(4, 3, 'Psittacidae'),
(5, 3, 'Accipitridae'),
(6, 4, 'Crocodylidae'),
(7, 4, 'Colubridae');

-- --------------------------------------------------------

--
-- Structure de la table `maladie`
--

CREATE TABLE `maladie` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `maladie`
--

INSERT INTO `maladie` (`id`, `nom`, `description`) VALUES
(1, 'Grippe féline', 'Infection virale bénigne chez les félins'),
(2, 'Parasites intestinaux', 'Présence de vers ou parasites dans le système digestif'),
(3, 'Infection respiratoire', 'Difficulté à respirer, toux fréquente'),
(4, 'Blessure mineure', 'Petite coupure ou plaie à surveiller');

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menu`
--

INSERT INTO `menu` (`id`, `nom`, `type`) VALUES
(1, 'Viande rouge', 'Carnivore'),
(2, 'Fruits tropicaux', 'Frugivore'),
(3, 'Graines et noix', 'Granivore'),
(4, 'Rongeurs vivants', 'Carnivore'),
(5, 'Poissons frais', 'Piscivore');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ordre`
--

CREATE TABLE `ordre` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ordre`
--

INSERT INTO `ordre` (`id`, `nom`) VALUES
(1, 'Carnivores'),
(2, 'Primates'),
(3, 'Oiseaux'),
(4, 'Reptiles'),
(5, 'Amphibiens');

-- --------------------------------------------------------

--
-- Structure de la table `origine`
--

CREATE TABLE `origine` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `origine`
--

INSERT INTO `origine` (`id`, `nom`) VALUES
(1, 'Afrique'),
(2, 'Asie'),
(3, 'Amérique du Sud'),
(4, 'Europe'),
(5, 'Océanie');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adoptant`
--
ALTER TABLE `adoptant`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `allee`
--
ALTER TABLE `allee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_771FD92A1B65292` (`employe_id`);

--
-- Index pour la table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6AAB231F8B20F9C8` (`carnet_de_sante_id`),
  ADD KEY `IDX_6AAB231F2D191E7A` (`espece_id`),
  ADD KEY `IDX_6AAB231F87998E` (`origine_id`),
  ADD KEY `IDX_6AAB231F5A70E5B7` (`cage_id`),
  ADD KEY `IDX_6AAB231F8D8B49F9` (`adoptant_id`);

--
-- Index pour la table `animal_maladie`
--
ALTER TABLE `animal_maladie`
  ADD PRIMARY KEY (`animal_id`,`maladie_id`),
  ADD KEY `IDX_221B6D718E962C16` (`animal_id`),
  ADD KEY `IDX_221B6D71B4B1C397` (`maladie_id`);

--
-- Index pour la table `animal_menu`
--
ALTER TABLE `animal_menu`
  ADD PRIMARY KEY (`animal_id`,`menu_id`),
  ADD KEY `IDX_3A287BA78E962C16` (`animal_id`),
  ADD KEY `IDX_3A287BA7CCD7E912` (`menu_id`);

--
-- Index pour la table `cage`
--
ALTER TABLE `cage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_56A64E518E6975D2` (`allee_id`);

--
-- Index pour la table `cage_employe`
--
ALTER TABLE `cage_employe`
  ADD PRIMARY KEY (`cage_id`,`employe_id`),
  ADD KEY `IDX_79E207205A70E5B7` (`cage_id`),
  ADD KEY `IDX_79E207201B65292` (`employe_id`);

--
-- Index pour la table `carnet_de_sante`
--
ALTER TABLE `carnet_de_sante`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `espece`
--
ALTER TABLE `espece`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1A2A1B197A77B84` (`famille_id`);

--
-- Index pour la table `famille`
--
ALTER TABLE `famille`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_2473F2139291498C` (`ordre_id`);

--
-- Index pour la table `maladie`
--
ALTER TABLE `maladie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `ordre`
--
ALTER TABLE `ordre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `origine`
--
ALTER TABLE `origine`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adoptant`
--
ALTER TABLE `adoptant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `allee`
--
ALTER TABLE `allee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `animal`
--
ALTER TABLE `animal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `cage`
--
ALTER TABLE `cage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `carnet_de_sante`
--
ALTER TABLE `carnet_de_sante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `employe`
--
ALTER TABLE `employe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `espece`
--
ALTER TABLE `espece`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `famille`
--
ALTER TABLE `famille`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `maladie`
--
ALTER TABLE `maladie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ordre`
--
ALTER TABLE `ordre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `origine`
--
ALTER TABLE `origine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `allee`
--
ALTER TABLE `allee`
  ADD CONSTRAINT `FK_771FD92A1B65292` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`id`);

--
-- Contraintes pour la table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `FK_6AAB231F2D191E7A` FOREIGN KEY (`espece_id`) REFERENCES `espece` (`id`),
  ADD CONSTRAINT `FK_6AAB231F5A70E5B7` FOREIGN KEY (`cage_id`) REFERENCES `cage` (`id`),
  ADD CONSTRAINT `FK_6AAB231F87998E` FOREIGN KEY (`origine_id`) REFERENCES `origine` (`id`),
  ADD CONSTRAINT `FK_6AAB231F8B20F9C8` FOREIGN KEY (`carnet_de_sante_id`) REFERENCES `carnet_de_sante` (`id`),
  ADD CONSTRAINT `FK_6AAB231F8D8B49F9` FOREIGN KEY (`adoptant_id`) REFERENCES `adoptant` (`id`);

--
-- Contraintes pour la table `animal_maladie`
--
ALTER TABLE `animal_maladie`
  ADD CONSTRAINT `FK_221B6D718E962C16` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_221B6D71B4B1C397` FOREIGN KEY (`maladie_id`) REFERENCES `maladie` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `animal_menu`
--
ALTER TABLE `animal_menu`
  ADD CONSTRAINT `FK_3A287BA78E962C16` FOREIGN KEY (`animal_id`) REFERENCES `animal` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_3A287BA7CCD7E912` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `cage`
--
ALTER TABLE `cage`
  ADD CONSTRAINT `FK_56A64E518E6975D2` FOREIGN KEY (`allee_id`) REFERENCES `allee` (`id`);

--
-- Contraintes pour la table `cage_employe`
--
ALTER TABLE `cage_employe`
  ADD CONSTRAINT `FK_79E207201B65292` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_79E207205A70E5B7` FOREIGN KEY (`cage_id`) REFERENCES `cage` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `espece`
--
ALTER TABLE `espece`
  ADD CONSTRAINT `FK_1A2A1B197A77B84` FOREIGN KEY (`famille_id`) REFERENCES `famille` (`id`);

--
-- Contraintes pour la table `famille`
--
ALTER TABLE `famille`
  ADD CONSTRAINT `FK_2473F2139291498C` FOREIGN KEY (`ordre_id`) REFERENCES `ordre` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
