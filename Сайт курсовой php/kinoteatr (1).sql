-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 29 2022 г., 17:41
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kinoteatr`
--

-- --------------------------------------------------------

--
-- Структура таблицы `adresa_kinoteatra`
--

CREATE TABLE `adresa_kinoteatra` (
  `if_adressa` int NOT NULL,
  `addres` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `adresa_kinoteatra`
--

INSERT INTO `adresa_kinoteatra` (`if_adressa`, `addres`) VALUES
(1, 'Карла Маркса'),
(2, 'Суворова'),
(3, 'Пр. Победы');

-- --------------------------------------------------------

--
-- Структура таблицы `bilet`
--

CREATE TABLE `bilet` (
  `id_bilet` int NOT NULL,
  `id_film` int NOT NULL,
  `id_mesto` int NOT NULL,
  `id_adress` int NOT NULL,
  `id_time` int NOT NULL,
  `id_status` int NOT NULL,
  `Stoim` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `bilet`
--

INSERT INTO `bilet` (`id_bilet`, `id_film`, `id_mesto`, `id_adress`, `id_time`, `id_status`, `Stoim`) VALUES
(1, 2, 2, 2, 0, 2, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `film`
--

CREATE TABLE `film` (
  `id_film` int NOT NULL,
  `name_film` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `film`
--

INSERT INTO `film` (`id_film`, `name_film`) VALUES
(1, 'film1'),
(2, 'film2'),
(3, 'film3'),
(4, 'film4');

-- --------------------------------------------------------

--
-- Структура таблицы `mesto`
--

CREATE TABLE `mesto` (
  `id_mesto` int NOT NULL,
  `ряд` text NOT NULL,
  `номер` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `mesto`
--

INSERT INTO `mesto` (`id_mesto`, `ряд`, `номер`) VALUES
(1, 'A', 1),
(2, 'B', 12);

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE `status` (
  `id_statusa` int NOT NULL,
  `name_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `status`
--

INSERT INTO `status` (`id_statusa`, `name_status`) VALUES
(1, 'Заказан'),
(2, 'Куплен'),
(3, 'Отменён');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `adresa_kinoteatra`
--
ALTER TABLE `adresa_kinoteatra`
  ADD PRIMARY KEY (`if_adressa`);

--
-- Индексы таблицы `bilet`
--
ALTER TABLE `bilet`
  ADD PRIMARY KEY (`id_bilet`),
  ADD KEY `id_mesto` (`id_mesto`,`id_adress`,`id_status`),
  ADD KEY `id_film` (`id_film`),
  ADD KEY `id_status` (`id_status`),
  ADD KEY `id_adress` (`id_adress`),
  ADD KEY `id_time` (`id_time`);

--
-- Индексы таблицы `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_film`);

--
-- Индексы таблицы `mesto`
--
ALTER TABLE `mesto`
  ADD PRIMARY KEY (`id_mesto`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_statusa`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `adresa_kinoteatra`
--
ALTER TABLE `adresa_kinoteatra`
  MODIFY `if_adressa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `bilet`
--
ALTER TABLE `bilet`
  MODIFY `id_bilet` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `film`
--
ALTER TABLE `film`
  MODIFY `id_film` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `mesto`
--
ALTER TABLE `mesto`
  MODIFY `id_mesto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `id_statusa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bilet`
--
ALTER TABLE `bilet`
  ADD CONSTRAINT `bilet_ibfk_2` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_statusa`),
  ADD CONSTRAINT `bilet_ibfk_3` FOREIGN KEY (`id_adress`) REFERENCES `adresa_kinoteatra` (`if_adressa`),
  ADD CONSTRAINT `bilet_ibfk_4` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  ADD CONSTRAINT `bilet_ibfk_5` FOREIGN KEY (`id_mesto`) REFERENCES `mesto` (`id_mesto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
