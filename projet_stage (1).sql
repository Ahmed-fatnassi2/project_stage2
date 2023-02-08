-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 08 fév. 2023 à 17:58
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_stage`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `name`) VALUES
(1, 'pizza'),
(2, 'sandwitch'),
(6, 'sucrée'),
(7, 'café'),
(8, 'jus');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `ingredients`
--

CREATE TABLE `ingredients` (
  `id_ingredient` int(11) NOT NULL,
  `name_ig` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ingredients`
--

INSERT INTO `ingredients` (`id_ingredient`, `name_ig`) VALUES
(1, 'amande'),
(2, 'beurre de cacaouéte'),
(3, 'fraise'),
(4, 'tomate'),
(5, 'piment'),
(6, 'olive'),
(7, 'thon'),
(8, 'fromage'),
(9, 'lait'),
(10, 'sucre'),
(11, 'chocolat'),
(12, 'kafteji'),
(13, 'fritte'),
(14, 'eau'),
(15, 'cacao'),
(16, 'escalopes'),
(17, 'bannane'),
(18, 'noix'),
(19, 'chocolat chaux');

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id_ordre` int(11) NOT NULL,
  `total` double NOT NULL,
  `means_paiement` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `order_cmd`
--

CREATE TABLE `order_cmd` (
  `id_order_cmd` int(11) NOT NULL,
  `total_paiement` float NOT NULL,
  `means_paiement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `order_cmd`
--

INSERT INTO `order_cmd` (`id_order_cmd`, `total_paiement`, `means_paiement`) VALUES
(2, 20, 1);

-- --------------------------------------------------------

--
-- Structure de la table `order_cmds`
--

CREATE TABLE `order_cmds` (
  `id` int(11) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `total_paiement` varchar(255) DEFAULT NULL,
  `means_paiement` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `order_detail`
--

CREATE TABLE `order_detail` (
  `id_order_detail` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_num` int(11) NOT NULL,
  `order_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `order_detail`
--

INSERT INTO `order_detail` (`id_order_detail`, `quantity`, `product_num`, `order_num`) VALUES
(2, 1, 7, 2);

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `id_order_detail` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `order_detail_preference`
--

CREATE TABLE `order_detail_preference` (
  `id_order_detail_preference` int(11) NOT NULL,
  `ingredient_for_change` varchar(11) NOT NULL,
  `order_num` int(11) NOT NULL,
  `qt_ig` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `order_detail_preference`
--

INSERT INTO `order_detail_preference` (`id_order_detail_preference`, `ingredient_for_change`, `order_num`, `qt_ig`) VALUES
(2, 'sucre', 2, 0);

-- --------------------------------------------------------

--
-- Structure de la table `order_detail_preferences`
--

CREATE TABLE `order_detail_preferences` (
  `id` int(11) NOT NULL,
  `id_order_pr` int(11) DEFAULT NULL,
  `ingredient_for_change` varchar(255) DEFAULT NULL,
  `qt_ig` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `paiement_method`
--

CREATE TABLE `paiement_method` (
  `id_paiement_method` int(11) NOT NULL,
  `name_meth` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `paiement_method`
--

INSERT INTO `paiement_method` (`id_paiement_method`, `name_meth`) VALUES
(1, 'especes'),
(2, 'chicket'),
(3, 'carte_bancaire'),
(4, 'ticket_resto');

-- --------------------------------------------------------

--
-- Structure de la table `paiement_methods`
--

CREATE TABLE `paiement_methods` (
  `id` int(11) DEFAULT NULL,
  `name_meth` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` double NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `src` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id_product`, `name`, `price`, `id_categorie`, `src`) VALUES
(2, 'buttermilk pancakes', 16, 6, './images/item-1.jpeg'),
(3, 'Pizza Neptune', 14, 1, './images/pizza.jpg'),
(4, 'capucin', 2, 7, './images/capucin.jpg'),
(6, 'sandwitch_kafteji', 6, 2, './images/sandwitch_kefteji.png'),
(7, 'Express', 2, 7, './images/espresso.jpeg'),
(9, 'Sandwitch_Thon', 4, 2, './images/sandwitch_thon.jpg'),
(10, 'creme', 3, 7, './images/creme.jpg'),
(11, 'Sandwitch_escalopes', 8, 2, './images/sandwitch_escaloppe.jpeg'),
(12, 'Citronade', 3, 8, './images/citronnade.jpg'),
(13, 'crepe au chocolat', 5, 6, './images/crepe.jpg'),
(15, 'gaufre', 5, 6, './images/gaufre.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `id_categorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `product_ingredients`
--

CREATE TABLE `product_ingredients` (
  `product_num` int(11) NOT NULL,
  `ingredient_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `product_ingredients`
--

INSERT INTO `product_ingredients` (`product_num`, `ingredient_num`) VALUES
(2, 1),
(2, 2),
(2, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(4, 9),
(4, 10),
(6, 4),
(6, 5),
(6, 6),
(6, 12),
(7, 10),
(7, 14),
(9, 3),
(9, 4),
(9, 7),
(9, 13),
(10, 9),
(10, 10),
(11, 4),
(11, 5),
(11, 6),
(11, 13),
(11, 16),
(12, 10),
(13, 1),
(13, 17),
(13, 18),
(13, 19),
(15, 11),
(15, 17),
(15, 18);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id_role`, `name`) VALUES
(1, 'client'),
(2, 'cuisinier'),
(3, 'buvetier');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20230120092730-create-categorie.js'),
('20230120092923-create-ingredients.js'),
('20230120093433-create-order-cmd.js'),
('20230120093743-create-order-detail-preference.js'),
('20230120093903-create-role.js'),
('20230120103404-create-paiement-method.js'),
('20230120104504-create-order-cmd.js'),
('20230121134738-create-product.js'),
('20230121142439-product-categorie-association.js'),
('20230122015006-create-order-detail.js'),
('20230122015700-create-user.js'),
('20230122191512-user-role-association.js'),
('20230122193013-order_cmd-paiement_method-association.js'),
('20230122203159-order_detail_preference-order_detail-association.js'),
('20230123130931-order_detail-product-association.js'),
('20230123133422-order_detail_preference-order_detail-association.js'),
('20230123133824-order_cmd-paiement_method-association.js'),
('20230123150840-order_detail-order_cmd-association.js'),
('20230123152217-create-product-ingredients.js'),
('20230123152852-product_ingredients-product-association.js'),
('20230123153646-product_ingredients-ingredients-association.js');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `num_user` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `num_user`, `name`, `password`, `id_role`) VALUES
(3, 1, 'ahmed', '123456789', 1),
(4, 2, 'mohamed', '0000', 3);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `num_user` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `id_role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id_ingredient`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id_ordre`);

--
-- Index pour la table `order_cmd`
--
ALTER TABLE `order_cmd`
  ADD PRIMARY KEY (`id_order_cmd`),
  ADD KEY `means_paiement` (`means_paiement`);

--
-- Index pour la table `order_cmds`
--
ALTER TABLE `order_cmds`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id_order_detail`),
  ADD KEY `id_produit` (`product_num`),
  ADD KEY `id_order` (`order_num`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `order_detail_preference`
--
ALTER TABLE `order_detail_preference`
  ADD PRIMARY KEY (`id_order_detail_preference`),
  ADD KEY `order_num` (`order_num`);

--
-- Index pour la table `order_detail_preferences`
--
ALTER TABLE `order_detail_preferences`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `paiement_method`
--
ALTER TABLE `paiement_method`
  ADD PRIMARY KEY (`id_paiement_method`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id-categorie` (`id_categorie`);

--
-- Index pour la table `product_ingredients`
--
ALTER TABLE `product_ingredients`
  ADD PRIMARY KEY (`product_num`,`ingredient_num`),
  ADD KEY `id_ingredient` (`ingredient_num`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Index pour la table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_r` (`id_role`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id_ingredient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id_ordre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order_cmd`
--
ALTER TABLE `order_cmd`
  MODIFY `id_order_cmd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `order_cmds`
--
ALTER TABLE `order_cmds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id_order_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order_detail_preference`
--
ALTER TABLE `order_detail_preference`
  MODIFY `id_order_detail_preference` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `order_detail_preferences`
--
ALTER TABLE `order_detail_preferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `paiement_method`
--
ALTER TABLE `paiement_method`
  MODIFY `id_paiement_method` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `order_cmd`
--
ALTER TABLE `order_cmd`
  ADD CONSTRAINT `order_cmd_ibfk_1` FOREIGN KEY (`means_paiement`) REFERENCES `paiement_method` (`id_paiement_method`);

--
-- Contraintes pour la table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`product_num`) REFERENCES `product` (`id_product`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`order_num`) REFERENCES `order_cmd` (`id_order_cmd`);

--
-- Contraintes pour la table `order_detail_preference`
--
ALTER TABLE `order_detail_preference`
  ADD CONSTRAINT `order_detail_preference_ibfk_1` FOREIGN KEY (`order_num`) REFERENCES `order_detail` (`id_order_detail`),
  ADD CONSTRAINT `order_detail_preference_ibfk_2` FOREIGN KEY (`order_num`) REFERENCES `order_detail` (`id_order_detail`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`);

--
-- Contraintes pour la table `product_ingredients`
--
ALTER TABLE `product_ingredients`
  ADD CONSTRAINT `product_ingredients_ibfk_1` FOREIGN KEY (`product_num`) REFERENCES `product` (`id_product`),
  ADD CONSTRAINT `product_ingredients_ibfk_2` FOREIGN KEY (`ingredient_num`) REFERENCES `ingredients` (`id_ingredient`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
