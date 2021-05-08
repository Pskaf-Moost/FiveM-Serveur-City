USE `es_extended`;

ALTER TABLE `users` ADD COLUMN `arrested_time` longtext COLLATE utf8mb4_bin DEFAULT '{"pjail":0,"prison":0}';