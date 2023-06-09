-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Jun-2023 às 03:03
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `read_book`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idUsuario` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `admins`
--

INSERT INTO `admins` (`id`, `idUsuario`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-06-02 00:12:04', '2023-06-02 00:12:04'),
(2, 4, '2023-06-03 01:57:08', '2023-06-03 01:57:08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `livros`
--

CREATE TABLE `livros` (
  `id_livro` bigint(20) UNSIGNED NOT NULL,
  `id_usuario` bigint(20) UNSIGNED NOT NULL,
  `img_livro` varchar(255) DEFAULT NULL,
  `nome_livro` varchar(255) NOT NULL,
  `descricao_livro` text DEFAULT NULL,
  `lido` varchar(255) NOT NULL,
  `tempo_lido` varchar(255) NOT NULL,
  `paginas_lidas` varchar(255) NOT NULL,
  `total_paginas` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `livros`
--

INSERT INTO `livros` (`id_livro`, `id_usuario`, `img_livro`, `nome_livro`, `descricao_livro`, `lido`, `tempo_lido`, `paginas_lidas`, `total_paginas`, `created_at`, `updated_at`) VALUES
(2, 1, 'http://books.google.com/books/content?id=ud06EAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'A Biblioteca da Meia-Noite', 'A Biblioteca da Meia-Noite é um romance incrível que fala dos infinitos rumos que a vida pode tomar e da busca incessante pelo rumo certo. Nesta edição limitada, você ganha outro exemplar do livro embalado para presente. Aos 35 anos, Nora Seed é uma mulher cheia de talentos e poucas conquistas. Arrependida das escolhas que fez no passado, ela vive se perguntando o que poderia ter acontecido caso tivesse vivido de maneira diferente. Após ser demitida e seu gato ser atropelado, Nora vê pouco sentido em sua existência e decide colocar um ponto final em tudo. Porém, quando se vê na Biblioteca da Meia-Noite, Nora ganha uma oportunidade única de viver todas as vidas que poderia ter vivido. Neste lugar entre a vida e a morte, e graças à ajuda de uma velha amiga, Nora pode, finalmente, se mudar para a Austrália, reatar relacionamentos antigos – ou começar outros –, ser uma estrela do rock, uma glaciologista, uma nadadora olímpica... enfim, as opções são infinitas. Mas será que alguma dessas outras vidas é realmente melhor do que a que ela já tem? Em A Biblioteca da Meia-Noite, Nora Seed se vê exatamente na situação pela qual todos gostaríamos de poder passar: voltar no tempo e desfazer algo de que nos arrependemos. Diante dessa possibilidade, Nora faz um mergulho interior viajando pelos livros da Biblioteca da Meia-Noite até entender o que é verdadeiramente importante na vida e o que faz, de fato, com que ela valha a pena ser vivida. \"Uma celebração entusiástica do poder que os livros têm de mudar vidas.\" – Sunday Times \"Um cenário de possibilidades ilimitadas, de novos caminhos trilhados, de novas vidas vividas, de um mundo totalmente diferente disponível para nós de alguma forma, em algum lugar, pode ser exatamente do que precisamos nesses tempos difíceis e turbulentos.\" – The New York Times \"Um romance extremamente original e instigante sobre a importância de valorizar a vida que você tem.\" – Independent \"Instigante e inspirador. Explora a nossa relação com o arrependimento e com o que realmente faz uma vida ser perfeita.\" – Harper\'s Bazaar \"Uma história sobre segundas chances e viver com arrependimentos. Muito envolvente.\" – Stylist \"Eu amei A Biblioteca da Meia-Noite. Ele condensa coisas importantes e tristes – morte, saúde mental, filosofia existencial – em um livro excepcional, prazeroso e de aquecer o coração.\" – Pandora Sykes', 'sim', '5 dias', '308', '308', '2023-06-03 04:29:59', '2023-06-04 00:48:19'),
(3, 3, 'http://books.google.com/books/content?id=taFjEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Antes que o café esfrie', 'Quem você gostaria de encontrar, uma única e última vez, se fosse possível viajar no tempo? Em uma ruazinha estreita e silenciosa de Tóquio, num subsolo, existe um estabelecimento que, há mais de 100 anos, serve um café cuidadosamente preparado. Graças a uma lenda urbana, o local recebe diversos frequentadores que esperam ansiosamente para viver uma experiência única: fazer uma viagem no tempo. Aqueles que retornam ao passado devem estar cientes dos riscos e também das regras, já que a jornada exige que o cliente se sente numa cadeira específica e reencontre somente pessoas que já tenham visitado o estabelecimento. Mesmo assim, quatro personagens aproveitam a oportunidade para tentar resolver dramas do passado. A experiência é imperdível, mas o tempo é curto. Mais precisamente, até o café esfriar. Antes que o Café Esfrie é um romance do autor japonês Toshikazu Kawaguchi e best‐ seller do USA Today e do Times de Londres. Alcançou o 1o lugar na lista de mais vendidos (ficção literária internacional) da rede de livrarias Waterstones, no Reino Unido, e foi o romance traduzido mais vendido de 2020. No Japão, ultrapassou a incrível marca de 1 milhão de livros vendidos e segue fazendo sucesso em outros países como Taiwan, França e Itália.', 'não', '0 dias', '0', '208', '2023-06-03 04:47:42', '2023-06-03 04:47:42'),
(4, 1, 'http://books.google.com/books/content?id=luSmDwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api', 'Todas as suas (im)perfeições', 'Uma história de amor perfeita é suficiente para manter vivo o casamento entre duas pessoas imperfeitas? Quando a dança começa, a sincronia é perfeita, os passos seguem o ritmo, as mãos não se soltam, os olhos jamais se deixam. Mas a música pode acabar a qualquer momento... É possível valsar no silêncio? Quinn e Graham se conhecem no pior dia de suas vidas; ela chega mais cedo de uma viagem para surpreender o noivo, ele testemunha a traição da namorada. E é assim que ambos acabam no corredor de um prédio, trocando confidências, biscoitos da sorte e palavras de conforto. Fim da dança... se o destino não tivesse outros planos para os dois. Meses mais tarde, os acordes tocam para o casal mais uma vez e eles se reencontram. Graham está convencido de que são almas gêmeas. Quinn jamais se sentiu dessa forma antes. A intensidade do sentimento os assusta, mas, ainda assim, eles mergulham de cabeça. O casamento é tudo o que sonhavam, a parceria perfeita. Mesmo nos momentos difíceis, sabem que podem contar com o outro. Nenhum deles desiste do amor que sentem. Até que a primeira nota dissonante abala a sinfonia do casal. Quinn parece estar disposta a trocar tudo o que é pela única coisa que não consegue ser: mãe. A luta do casal por um filho arrisca os alicerces da relação. Quinn não pode engravidar. Graham não é um candidato para adoção por conta de um erro do passado. O impasse os deixa parados no salão, no silêncio. A orquestra está em suspenso. Os dois parecem surdos para a música do amor de ambos. Será que é possível voltar a ouvir? A dançar? Ou será que vão descobrir a mais triste verdade de todas... que, às vezes, apenas amar não é o bastante?', 'sim', '15 dias', '304', '304', '2023-06-04 00:49:04', '2023-06-05 03:13:00'),
(13, 3, NULL, 'O poder do silêncio', 'Meu teste', 'não', '0 dias', '0', NULL, '2023-06-05 03:31:56', '2023-06-05 04:00:02');

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_05_08_223709_create_livros_table', 1),
(6, '2023_06_02_000818_create_admins_table', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'João', 'joao@gmail.com', NULL, '$2y$10$7LtRaeprENOy0nesfeX5MuOvH6D96qtgtwcmpcyBrSBcaYPeRUTrS', NULL, '2023-06-02 03:11:30', '2023-06-03 04:43:56'),
(3, 'Elaine Cristina Alves De Souza', 'elaine@gmail.com', NULL, '$2y$10$67pSzwpsRZN7EuNjV85FU.t3fl.BqQiPgpQ/KrZ6s/68WW96f7.Py', '1l7nd6Y1FwJQbVdogC4Ld2AiBfjr4nJYYvVOCqxYNJnjTDgvwdYnaaAMuljg', '2023-06-03 04:44:58', '2023-06-05 03:30:09'),
(4, 'Adelson Barbosa  Santos', 'adelson@gmail.com', NULL, '$2y$10$ZnZ7VNRgPqBVGUNZf7TWV.yu1IE0H.JBnb7vv36nhtI51GeuW9lGm', 'tqekED7uMbhHYtygzXJiaRAmCoxkvc62iUWttGwM5k9d0WNyuRIvbkrfjjhs', '2023-06-03 04:56:51', '2023-06-03 04:56:51');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admins_idusuario_foreign` (`idUsuario`);

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices para tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id_livro`),
  ADD KEY `livros_id_usuario_foreign` (`id_usuario`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Índices para tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `id_livro` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_idusuario_foreign` FOREIGN KEY (`idUsuario`) REFERENCES `users` (`id`);

--
-- Limitadores para a tabela `livros`
--
ALTER TABLE `livros`
  ADD CONSTRAINT `livros_id_usuario_foreign` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
