-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04/08/2024 às 23:29
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `banco_hackathon`
--
CREATE DATABASE IF NOT EXISTS `banco_hackathon` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `banco_hackathon`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `agenda`
--

CREATE TABLE `agenda` (
  `id` int(11) NOT NULL,
  `idoso_id` int(11) NOT NULL,
  `agente_de_saude_id` int(11) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `agenda`
--

INSERT INTO `agenda` (`id`, `idoso_id`, `agente_de_saude_id`, `data`, `hora`, `descricao`) VALUES
(1, 2, 2, '2022-12-12', '12:30:00', 'vfbrtht'),
(2, 2, 3, '2024-08-03', '14:25:00', 'Consulta de rotina'),
(3, 2, 2, '2020-10-10', '12:12:12', 'fwegfwe');

-- --------------------------------------------------------

--
-- Estrutura para tabela `agente_de_saude`
--

CREATE TABLE `agente_de_saude` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `Telefone` varchar(11) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `especialidade` varchar(100) NOT NULL,
  `data_contratacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `agente_de_saude`
--

INSERT INTO `agente_de_saude` (`id`, `nome`, `Telefone`, `cpf`, `especialidade`, `data_contratacao`) VALUES
(2, 'Jorge de Sousa', '666666666', '88888888', 'Pediatria', '2016-05-23'),
(3, 'Joao', '55555877', '11112321', 'Medicina Psiquiatrica', '1998-04-23');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cuidador`
--

CREATE TABLE `cuidador` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `data_registro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cuidador`
--

INSERT INTO `cuidador` (`id`, `nome`, `telefone`, `cpf`, `data_registro`) VALUES
(3, 'Manoel Gomes', '44888956', '112579845', '2015-03-25'),
(4, 'Jose de Souza', '779564485', '552214855', '2006-10-30');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cuidador_has_idoso`
--

CREATE TABLE `cuidador_has_idoso` (
  `id` int(11) NOT NULL,
  `idoso_id` int(11) NOT NULL,
  `cuidador_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cuidador_has_idoso`
--

INSERT INTO `cuidador_has_idoso` (`id`, `idoso_id`, `cuidador_id`) VALUES
(1, 2, 3),
(2, 1, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico`
--

CREATE TABLE `historico` (
  `id` int(11) NOT NULL,
  `idoso_id` int(11) DEFAULT NULL,
  `vacina_id` int(11) NOT NULL,
  `doencas_preexistentes` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `historico`
--

INSERT INTO `historico` (`id`, `idoso_id`, `vacina_id`, `doencas_preexistentes`) VALUES
(1, 1, 5, 'Alergia a abelhas'),
(2, 2, 4, 'Rinite e sinusite e bronquite'),
(4, 1, 5, 'Nemhuma');

-- --------------------------------------------------------

--
-- Estrutura para tabela `idosos`
--

CREATE TABLE `idosos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `idosos`
--

INSERT INTO `idosos` (`id`, `nome`, `telefone`, `email`) VALUES
(1, 'Idoso Teste', '999999999', 'teste@gmail'),
(2, 'Idoso segundo teste', '55555555', 'teste@hotmail');

-- --------------------------------------------------------

--
-- Estrutura para tabela `lembretes`
--

CREATE TABLE `lembretes` (
  `id` int(11) NOT NULL,
  `id_agenda` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vacina`
--

CREATE TABLE `vacina` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_validade` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `vacina`
--

INSERT INTO `vacina` (`id`, `nome`, `data_validade`) VALUES
(4, 'Pfizer', '2025-12-11'),
(5, 'Astra Zeneca', '2024-11-05');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `f1` (`idoso_id`),
  ADD KEY `f2` (`agente_de_saude_id`);

--
-- Índices de tabela `agente_de_saude`
--
ALTER TABLE `agente_de_saude`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cuidador`
--
ALTER TABLE `cuidador`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cuidador_has_idoso`
--
ALTER TABLE `cuidador_has_idoso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk1` (`idoso_id`),
  ADD KEY `fk2` (`cuidador_id`);

--
-- Índices de tabela `historico`
--
ALTER TABLE `historico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idoso_id` (`idoso_id`),
  ADD KEY `historico_ibfk_2` (`vacina_id`);

--
-- Índices de tabela `idosos`
--
ALTER TABLE `idosos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `lembretes`
--
ALTER TABLE `lembretes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `b1` (`id_agenda`);

--
-- Índices de tabela `vacina`
--
ALTER TABLE `vacina`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `agente_de_saude`
--
ALTER TABLE `agente_de_saude`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `cuidador`
--
ALTER TABLE `cuidador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `cuidador_has_idoso`
--
ALTER TABLE `cuidador_has_idoso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `historico`
--
ALTER TABLE `historico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `idosos`
--
ALTER TABLE `idosos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `lembretes`
--
ALTER TABLE `lembretes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vacina`
--
ALTER TABLE `vacina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `f1` FOREIGN KEY (`idoso_id`) REFERENCES `idosos` (`id`),
  ADD CONSTRAINT `f2` FOREIGN KEY (`agente_de_saude_id`) REFERENCES `agente_de_saude` (`id`);

--
-- Restrições para tabelas `cuidador_has_idoso`
--
ALTER TABLE `cuidador_has_idoso`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`idoso_id`) REFERENCES `idosos` (`id`),
  ADD CONSTRAINT `fk2` FOREIGN KEY (`cuidador_id`) REFERENCES `cuidador` (`id`);

--
-- Restrições para tabelas `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `historico_ibfk_1` FOREIGN KEY (`idoso_id`) REFERENCES `idosos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `historico_ibfk_2` FOREIGN KEY (`vacina_id`) REFERENCES `vacina` (`id`);

--
-- Restrições para tabelas `lembretes`
--
ALTER TABLE `lembretes`
  ADD CONSTRAINT `b1` FOREIGN KEY (`id_agenda`) REFERENCES `agenda` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
