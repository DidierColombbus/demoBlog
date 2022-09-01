-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 01 sep. 2022 à 08:40
-- Version du serveur : 5.7.33
-- Version de PHP : 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blog`
--
CREATE DATABASE IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `blog`;

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
  `id` int(3) NOT NULL,
  `image` varchar(255) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `contenu` longtext NOT NULL,
  `auteur` varchar(255) NOT NULL,
  `date_parution` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id`, `image`, `titre`, `contenu`, `auteur`, `date_parution`) VALUES
(1, 'https://images.unsplash.com/photo-1624671417794-529334e12c4d?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=1025&amp;q=80', 'Obi Wan et Sky, les plus beaux', 'Lorem ipsum dolor sit amet. Non deleniti Quis qui blanditiis quisquam eum molestiae expedita et rerum sint? ', 'Béchir DALY', '2022-06-23'),
(4, 'https://images.unsplash.com/photo-1570824104453-508955ab713e?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=711&amp;q=80', 'J\'ai trop de chats, au secours ?', 'Lorem ipsum dolor sit amet. Non deleniti Quis qui blanditiis quisquam eum molestiae expedita et rerum sint? Quo soluta porro aut omnis obcaecati  nobis corrupti  fugit quasi et quibusdam voluptatem. ', 'Béchir DALY', '2022-06-22'),
(5, 'https://images.unsplash.com/photo-1618566669283-ced9344422db?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=1172&amp;q=80', 'Faut-il laisser sortir son chat ?', 'Et assumenda temporibus aut minima provident et officiis impedit eum rerum totam sed consequuntur facere et deserunt quas non  dolorem. Ut quisquam ipsa eos fuga recusandae et quidem fuga. Ad unde labore non asperiores molestiae aut culpa dicta. ', 'Béchir DALY', '2022-06-23'),
(6, 'https://images.unsplash.com/photo-1609062639746-71067f14ca95?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=1974&amp;q=80', 'Les chats orange sont-ils forcément des femelles ?', 'Lorem ipsum dolor sit amet. Non deleniti Quis qui blanditiis quisquam eum molestiae expedita et rerum sint? Quo soluta porro aut omnis obcaecati  nobis corrupti  fugit quasi et quibusdam voluptatem. Qui ullam molestiae est molestias molestiae sed consequatur molestias et impedit facere. Nam officiis fugiat sit tempora fuga ut tempora ullam. ', 'Béchir DALY', '2022-06-23');

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

CREATE TABLE `membres` (
  `id_membre` int(3) NOT NULL,
  `pseudo` varchar(20) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `civilite` enum('m','f') NOT NULL,
  `ville` varchar(20) NOT NULL,
  `code_postal` int(11) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `statut` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `membres`
--

INSERT INTO `membres` (`id_membre`, `pseudo`, `mdp`, `nom`, `prenom`, `email`, `civilite`, `ville`, `code_postal`, `adresse`, `statut`) VALUES
(3, 'bechir91', '$2y$10$fccEwXf044F1qNduIQ0tDOwzdq4TSnkD1nKnvS6HAWI1cCJB6QfVS', 'daly', 'bechir', 'bechirdaly@gmail.com', 'm', 'evry', 91000, '1 rue de la resistance ', 0),
(7, 'Kim', 'azerty', 'Kardashian', 'Kim', 'Kimkar@yahoo.fr', 'm', 'Paris', 75000, '15 avenue des champs elysées', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `membres`
--
ALTER TABLE `membres`
  ADD PRIMARY KEY (`id_membre`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `membres`
--
ALTER TABLE `membres`
  MODIFY `id_membre` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
