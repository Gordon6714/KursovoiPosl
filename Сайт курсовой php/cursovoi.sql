-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 23 2022 г., 01:22
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cursovoi`
--

-- --------------------------------------------------------

--
-- Структура таблицы `adress`
--

CREATE TABLE `adress` (
  `id_adressa` int(11) NOT NULL,
  `adress` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `adress`
--

INSERT INTO `adress` (`id_adressa`, `adress`) VALUES
(1, 'Карла Маркса'),
(2, 'Проспект Победы'),
(3, 'Суворова');

-- --------------------------------------------------------

--
-- Структура таблицы `bilet`
--

CREATE TABLE `bilet` (
  `id_bileta` int(11) NOT NULL,
  `id_filma` int(11) NOT NULL,
  `id_adress` int(11) NOT NULL,
  `id_mesto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `bilet`
--

INSERT INTO `bilet` (`id_bileta`, `id_filma`, `id_adress`, `id_mesto`) VALUES
(1, 1, 2, 2),
(5, 2, 1, 4),
(2, 2, 2, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `film`
--

CREATE TABLE `film` (
  `id_filma` int(11) NOT NULL,
  `nazvanie` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `film`
--

INSERT INTO `film` (`id_filma`, `nazvanie`) VALUES
(1, 'film1'),
(2, 'film2'),
(3, 'film3'),
(4, 'film4');

-- --------------------------------------------------------

--
-- Структура таблицы `mesto`
--

CREATE TABLE `mesto` (
  `id_mesta` int(11) NOT NULL,
  `mesto` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `mesto`
--

INSERT INTO `mesto` (`id_mesta`, `mesto`) VALUES
(1, 'A1'),
(2, 'B1'),
(3, 'C1'),
(4, 'A2'),
(5, 'B2'),
(6, 'C2');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`id_adressa`);

--
-- Индексы таблицы `bilet`
--
ALTER TABLE `bilet`
  ADD PRIMARY KEY (`id_bileta`),
  ADD KEY `id_filma` (`id_filma`,`id_adress`,`id_mesto`),
  ADD KEY `id_adress` (`id_adress`),
  ADD KEY `id_mesto` (`id_mesto`);

--
-- Индексы таблицы `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_filma`);

--
-- Индексы таблицы `mesto`
--
ALTER TABLE `mesto`
  ADD PRIMARY KEY (`id_mesta`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `adress`
--
ALTER TABLE `adress`
  MODIFY `id_adressa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `bilet`
--
ALTER TABLE `bilet`
  MODIFY `id_bileta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `film`
--
ALTER TABLE `film`
  MODIFY `id_filma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `mesto`
--
ALTER TABLE `mesto`
  MODIFY `id_mesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bilet`
--
ALTER TABLE `bilet`
  ADD CONSTRAINT `bilet_ibfk_1` FOREIGN KEY (`id_adress`) REFERENCES `adress` (`id_adressa`),
  ADD CONSTRAINT `bilet_ibfk_2` FOREIGN KEY (`id_mesto`) REFERENCES `mesto` (`id_mesta`),
  ADD CONSTRAINT `bilet_ibfk_3` FOREIGN KEY (`id_filma`) REFERENCES `film` (`id_filma`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
