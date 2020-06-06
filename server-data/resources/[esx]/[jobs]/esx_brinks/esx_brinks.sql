

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES ('society_brinks', 'Brinks', 1);
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES ('831', 'society_brinks', '10000', NULL);
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES ('society_brinks', 'Brinks', 1);
INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES ('190', 'society_brinks', 'sacbillets', '0', NULL);
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES ('society_brinks', 'Brinks', 1);
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES ('1290', 'society_brinks', NULL, '{}');

INSERT INTO `job_grades` VALUES ('162', 'brinks', '0', 'interim', 'Convoyeur de fonds', '1300', '{}', '{}');
INSERT INTO `job_grades` VALUES ('163', 'brinks', '1', 'employee', 'Manager', '2000', '{}', '{}');
INSERT INTO `job_grades` VALUES ('164', 'brinks', '2', 'chief', 'Gérant Convoyeur', '2500', '{}', '{}');
INSERT INTO `job_grades` VALUES ('165', 'brinks', '3', 'boss', 'Patron', '3000', '{}', '{}');

INSERT INTO `jobs` VALUES ('brinks', 'Union Depository', '0');
INSERT INTO `items` VALUES ('sacbillets', 'Sac de Billets', '1', '0', '1');
