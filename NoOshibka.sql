-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Ноя 19 2024 г., 11:45
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `NoOshibka`
--

-- --------------------------------------------------------

--
-- Структура таблицы `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `auto_number` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `request`
--

INSERT INTO `request` (`id`, `user_id`, `status_id`, `auto_number`, `text`, `created_at`) VALUES
(1, 1, 3, '213', '123', '2024-10-15 14:39:03'),
(2, 1, 2, '123', '12312', '2024-10-15 14:39:17'),
(3, 1, 3, '123', '1231', '2024-10-15 14:39:21'),
(4, 2, 2, '213', '123', '2024-10-15 14:46:17'),
(5, 7, 2, 'QW1234567890ABC', '12345678 сломалось', '2024-10-15 14:55:47'),
(6, 7, 3, '12312', '123', '2024-10-15 14:58:15'),
(7, 7, 3, '3', '2', '2024-10-15 14:58:23'),
(8, 5, 2, '123', '123', '2024-10-22 12:26:47'),
(9, 14, 3, '123', 'все плохо(', '2024-10-29 13:06:52'),
(10, 14, 1, '123', '123', '2024-11-14 14:25:06'),
(11, 14, 1, '123124', '1243124', '2024-11-14 14:25:24'),
(12, 14, 1, '124124', '124124', '2024-11-14 14:25:27'),
(13, 14, 3, '21412', '1244214', '2024-11-14 14:25:31'),
(14, 8, 1, '123', '123', '2024-11-19 13:26:54');

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`id`, `code`, `name`) VALUES
(1, 'user', 'Пользователь'),
(2, 'admin', 'Administrator');

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `status`
--

INSERT INTO `status` (`id`, `code`, `name`) VALUES
(1, 'new', 'Новый'),
(2, 'ok', 'Подтвержденно'),
(3, 'delete', 'Отклоннено');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `role_id`, `username`, `password`, `email`, `first_name`, `last_name`, `middle_name`, `phone`) VALUES
(1, 2, 'copp', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin@admin.ru', 'Иван', 'Иванович', 'Иванов', '+7(913)-999-99-99'),
(2, 1, '123', '202cb962ac59075b964b07152d234b70', '123@11', '123', '123', '123', '123'),
(3, 1, '12311', '35e2dcdbea1950a7a290dd0c282da0a0', '123@1111', '123111', '123111', '12311', '123111'),
(4, 1, '1234', '81dc9bdb52d04dc20036dbd8313ed055', '12@11', '12', '12', '12', '12'),
(5, 1, '123456', 'e10adc3949ba59abbe56e057f20f883e', '123@67890', '67', '67', '67', '676767'),
(7, 1, 'login', '4297f44b13955235245b2497399d7a93', 'fas@das', 'глеб', 'тот', 'кто', '+7(948)-578-52-18'),
(8, 1, 'log', 'e10adc3949ba59abbe56e057f20f883e', 'fas@dasss', 'глеб', 'тот', 'кто', '+7(948)-578-52-18'),
(9, 1, 'ws', 'e10adc3949ba59abbe56e057f20f883e', 'fas@das1', 'глеб', 'тот', 'кто', '+7(948)-578-52-18'),
(10, 1, 'qwe', 'e10adc3949ba59abbe56e057f20f883e', 'fa12s@das', 'глеб', 'тот', 'кто', '+7(948)-578-52-18'),
(11, 1, 'asd', 'e10adc3949ba59abbe56e057f20f883e', 'fasa@das', 'глеб', 'тот', 'кто', '+7(948)-578-52-18'),
(12, 1, 'zxc', 'e10adc3949ba59abbe56e057f20f883e', 'fas11@das', 'глеб', 'тот', 'кто', '+7(948)-578-52-18'),
(13, 1, 'qwer', 'e10adc3949ba59abbe56e057f20f883e', 'fas123@das', 'глеб', 'тот', 'кто', '+7(948)-578-52-18'),
(14, 1, 'log12', 'e10adc3949ba59abbe56e057f20f883e', 'fas@das12.ru', 'Иван', 'Иванов', 'Иванович', '+7(999)-675-56-43');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
