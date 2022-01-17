-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 17 jan. 2022 à 11:43
-- Version du serveur :  10.4.18-MariaDB
-- Version de PHP : 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `userdata`
--

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

CREATE TABLE `voiture` (
  `id_voiture` int(10) NOT NULL,
  `Marque` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `Modele` varchar(50) NOT NULL,
  `vitesses` varchar(50) NOT NULL,
  `nbr_places` varchar(50) NOT NULL,
  `Prix` int(10) NOT NULL,
  `Couleur` varchar(50) NOT NULL,
  `Disponibilite` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `voiture`
--

INSERT INTO `voiture` (`id_voiture`, `Marque`, `image`, `Modele`, `vitesses`, `nbr_places`, `Prix`, `Couleur`, `Disponibilite`) VALUES
(54, 'x3', 'image_picker5202344054361943610.png', '2020', '6', '6', 50000, 'hgray', 'NO DISPONIBLE '),
(55, 'BMW', 'image_picker4192752700468340137.png', '466', '6', '6', 6000, 'hh', 'vj'),
(57, 'MR', 'image_picker4731539015419410134.png', '2016', '5', '6', 50000, 'fh', 'chh'),
(58, '4X4', 'image_picker1019344972796697376.png', '2020', '6', '5', 6000, 'blanc ', 'DISPONIBLE '),
(61, 'test', 'image_picker6592460725965865067.png', '2022', '5', '6', 6000, 'rouge ', 'DISPONIBLE ');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `voiture`
--
ALTER TABLE `voiture`
  ADD PRIMARY KEY (`id_voiture`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `voiture`
--
ALTER TABLE `voiture`
  MODIFY `id_voiture` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
