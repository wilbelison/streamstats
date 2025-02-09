CREATE TABLE `data_movies_infos`(
    `id` INT NOT NULL COMMENT 'Código Base',
    `imdb_id` INT NOT NULL COMMENT 'Código IMDB',
    `adult` BOOLEAN NOT NULL COMMENT 'Classificação de Filme Adulto',
    `belongs_to_collection` TEXT NULL COMMENT 'Nome da Coleção',
    `budget` INT NOT NULL COMMENT 'Valor em USD',
    `genres` TEXT NOT NULL COMMENT 'Generos do Filme',
    `homepage` TEXT NOT NULL COMMENT 'Link do Filme',
    `original_language` TEXT NOT NULL COMMENT 'Idioma Original',
    `original_title` TEXT NOT NULL COMMENT 'Nome do Filme',
    `overview` TEXT NULL COMMENT 'Resumo',
    `popularity` INT NOT NULL COMMENT 'Nota de Popularidade',
    `poster_path` TEXT NOT NULL COMMENT 'Imagem do Poster',
    `production_companies` TEXT NOT NULL COMMENT 'Informação de Estúdios',
    `production_countries` TEXT NOT NULL COMMENT 'Informação de Países',
    `release_date` DATE NOT NULL COMMENT 'Data de Lançamento',
    `revenue` INT NOT NULL COMMENT 'Receita',
    `runtime` INT NOT NULL COMMENT 'Tempo de Filme',
    `spoken_languages` TEXT NOT NULL COMMENT 'Idiomas',
    `status` TEXT NOT NULL COMMENT 'Se foi lançado',
    `tagline` TEXT NOT NULL COMMENT 'Breve chamada',
    `title` TEXT NOT NULL COMMENT 'Nome do filme',
    `video` BOOLEAN NOT NULL,
    `vote_average` INT NOT NULL COMMENT 'Nota Média',
    `vote_count` INT NOT NULL COMMENT 'Total de Votos',
    PRIMARY KEY(`imdb_id`)
);
CREATE TABLE `data_ids_imdb_tmdb`(
    `movieId` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Código Filme Database',
    `tmdb_id` INT NOT NULL COMMENT 'Código TMDB',
    `imdb_id` INT NOT NULL COMMENT 'Código IMDB',
    PRIMARY KEY(`imdb_id`)
);
CREATE TABLE `tmdb_popularity`(
    `id (tmdb_id)` INT NOT NULL COMMENT 'Código TMDB',
    `budget` INT NOT NULL COMMENT 'Valor em USD',
    `genres` TEXT NOT NULL COMMENT 'Generos do Filme',
    `homepage` TEXT NULL COMMENT 'Link',
    `keywords` TEXT NOT NULL COMMENT 'Palavras Chaves',
    `original_language` TEXT NOT NULL COMMENT 'Idioma Original',
    `original_title` TEXT NOT NULL COMMENT 'Nome do Filme',
    `overview` TEXT NOT NULL COMMENT 'Resumo do Filme',
    `popularity` INT NOT NULL COMMENT 'Popularidade',
    `production_companies` TEXT NOT NULL COMMENT 'Informação de Estúdios',
    `production_countries` TEXT NOT NULL COMMENT 'Informação de Países',
    `release_date` DATE NOT NULL COMMENT 'Data de Lançamento',
    `revenue` INT NOT NULL COMMENT 'Receita',
    `runtime` INT NOT NULL COMMENT 'Tempo de Filme',
    `spoken_languages` TEXT NOT NULL COMMENT 'Idiomas Falado',
    `status` TEXT NOT NULL COMMENT 'Se foi lançado',
    `tagline` TEXT NOT NULL COMMENT 'Breve chamada',
    `title` BIGINT NOT NULL COMMENT 'Nome do Filme',
    `vote_average` BIGINT NOT NULL COMMENT 'Nota Média',
    `vote_count` BIGINT NOT NULL COMMENT 'Número de Votos',
    PRIMARY KEY(`id (tmdb_id)`)
);
CREATE TABLE `imdb_score_ratings`(
    `index` INT NOT NULL,
    `titleId (imdb_id)` TEXT NOT NULL COMMENT 'Código IMDB (a tconst, an alphanumeric unique identifier of the title)',
    `title` TEXT NOT NULL COMMENT 'Nome do Filme (the original title)',
    `averageRating` INT NOT NULL COMMENT 'Nota Média (weighted average of all the individual user ratings)',
    `numVotes` INT NOT NULL COMMENT 'Numero de Votos (number of votes the title has received)',
    PRIMARY KEY(`titleId (imdb_id)`)
);
CREATE TABLE `movies_amazon`(
    `imdb_id` INT NOT NULL COMMENT 'The title ID on IMDB',
    `id` INT NOT NULL COMMENT 'The title ID on JustWatch',
    `title` TEXT NOT NULL COMMENT 'Name of the Movie or Show',
    `type` TEXT NOT NULL COMMENT 'Movie or Show',
    `description` TEXT NULL COMMENT 'Description of the Movie or Show',
    `release_year` DATE NOT NULL COMMENT 'Release Year of the Movie or Show',
    `age_certification` TEXT NULL COMMENT 'Age Certification of the Movie or Show',
    `runtime` INT NOT NULL COMMENT 'Runtime of the Movie or Episode of the Show',
    `genres` TEXT NOT NULL COMMENT 'Genres of the Movie or Show',
    `production_countries` TEXT NOT NULL COMMENT 'Production Countries of the Movie or Show',
    `seasons` TEXT NOT NULL COMMENT 'Number of Seasons of the Show',
    `imdb_score` BIGINT NOT NULL COMMENT 'Score on IMDB',
    `imdb_votes` INT NOT NULL COMMENT 'Votes on IMDB',
    `tmdb_popularity` INT NOT NULL COMMENT 'Popularity on TMDB',
    `tmdb_score` INT NOT NULL COMMENT 'Score on TMDB',
    PRIMARY KEY(`imdb_id`)
);
ALTER TABLE
    `movies_amazon` ADD UNIQUE `movies_amazon_id_unique`(`id`);
CREATE TABLE `movies_hbo`(
    `imdb_id` INT NOT NULL COMMENT 'The title ID on IMDB',
    `id` INT NOT NULL COMMENT 'The title ID on JustWatch',
    `title` TEXT NOT NULL COMMENT 'Name of the Movie or Show',
    `type` TEXT NOT NULL COMMENT 'Movie or Show',
    `description` TEXT NULL COMMENT 'Description of the Movie or Show',
    `release_year` DATE NOT NULL COMMENT 'Release Year of the Movie or Show',
    `age_certification` TEXT NULL COMMENT 'Age Certification of the Movie or Show',
    `runtime` INT NOT NULL COMMENT 'Runtime of the Movie or Episode of the Show',
    `genres` TEXT NOT NULL COMMENT 'Genres of the Movie or Show',
    `production_countries` TEXT NOT NULL COMMENT 'Production Countries of the Movie or Show',
    `seasons` TEXT NOT NULL COMMENT 'Number of Seasons of the Show',
    `imdb_score` BIGINT NOT NULL COMMENT 'Score on IMDB',
    `imdb_votes` INT NOT NULL COMMENT 'Votes on IMDB',
    `tmdb_popularity` INT NOT NULL COMMENT 'Popularity on TMDB',
    `tmdb_score` INT NOT NULL COMMENT 'Score on TMDB',
    PRIMARY KEY(`imdb_id`)
);
CREATE TABLE `movies_netflix`(
    `imdb_id` INT NOT NULL COMMENT 'The title ID on IMDB',
    `id` INT NOT NULL COMMENT 'The title ID on JustWatch',
    `title` TEXT NOT NULL COMMENT 'Name of the Movie or Show',
    `type` TEXT NOT NULL COMMENT 'Movie or Show',
    `description` TEXT NULL COMMENT 'Description of the Movie or Show',
    `release_year` DATE NOT NULL COMMENT 'Release Year of the Movie or Show',
    `age_certification` TEXT NULL COMMENT 'Age Certification of the Movie or Show',
    `runtime` INT NOT NULL COMMENT 'Runtime of the Movie or Episode of the Show',
    `genres` TEXT NOT NULL COMMENT 'Genres of the Movie or Show',
    `production_countries` TEXT NOT NULL COMMENT 'Production Countries of the Movie or Show',
    `seasons` TEXT NOT NULL COMMENT 'Number of Seasons of the Show',
    `imdb_score` BIGINT NOT NULL COMMENT 'Score on IMDB',
    `imdb_votes` INT NOT NULL COMMENT 'Votes on IMDB',
    `tmdb_popularity` INT NOT NULL COMMENT 'Popularity on TMDB',
    `tmdb_score` INT NOT NULL COMMENT 'Score on TMDB',
    PRIMARY KEY(`imdb_id`)
);
CREATE TABLE `movies_disney`(
    `imdb_id` INT NOT NULL COMMENT 'The title ID on IMDB',
    `id` INT NOT NULL COMMENT 'The title ID on JustWatch',
    `title` TEXT NOT NULL COMMENT 'Name of the Movie or Show',
    `type` TEXT NOT NULL COMMENT 'Movie or Show',
    `description` TEXT NULL COMMENT 'Description of the Movie or Show',
    `release_year` DATE NOT NULL COMMENT 'Release Year of the Movie or Show',
    `age_certification` TEXT NULL COMMENT 'Age Certification of the Movie or Show',
    `runtime` INT NOT NULL COMMENT 'Runtime of the Movie or Episode of the Show',
    `genres` TEXT NOT NULL COMMENT 'Genres of the Movie or Show',
    `production_countries` TEXT NOT NULL COMMENT 'Production Countries of the Movie or Show',
    `seasons` TEXT NOT NULL COMMENT 'Number of Seasons of the Show',
    `imdb_score` BIGINT NOT NULL COMMENT 'Score on IMDB',
    `imdb_votes` INT NOT NULL COMMENT 'Votes on IMDB',
    `tmdb_popularity` INT NOT NULL COMMENT 'Popularity on TMDB',
    `tmdb_score` INT NOT NULL COMMENT 'Score on TMDB',
    PRIMARY KEY(`imdb_id`)
);
CREATE TABLE `movies_paramount`(
    `imdb_id` INT NOT NULL COMMENT 'The title ID on IMDB',
    `id` INT NOT NULL COMMENT 'The title ID on JustWatch',
    `title` TEXT NOT NULL COMMENT 'Name of the Movie or Show',
    `type` TEXT NOT NULL COMMENT 'Movie or Show',
    `description` TEXT NULL COMMENT 'Description of the Movie or Show',
    `release_year` DATE NOT NULL COMMENT 'Release Year of the Movie or Show',
    `age_certification` TEXT NULL COMMENT 'Age Certification of the Movie or Show',
    `runtime` INT NOT NULL COMMENT 'Runtime of the Movie or Episode of the Show',
    `genres` TEXT NOT NULL COMMENT 'Genres of the Movie or Show',
    `production_countries` TEXT NOT NULL COMMENT 'Production Countries of the Movie or Show',
    `seasons` TEXT NOT NULL COMMENT 'Number of Seasons of the Show',
    `imdb_score` BIGINT NOT NULL COMMENT 'Score on IMDB',
    `imdb_votes` INT NOT NULL COMMENT 'Votes on IMDB',
    `tmdb_popularity` INT NOT NULL COMMENT 'Popularity on TMDB',
    `tmdb_score` INT NOT NULL COMMENT 'Score on TMDB',
    PRIMARY KEY(`imdb_id`)
);
ALTER TABLE
    `data_movies_infos` ADD CONSTRAINT `data_movies_infos_imdb_id_foreign` FOREIGN KEY(`imdb_id`) REFERENCES `movies_hbo`(`imdb_id`);
ALTER TABLE
    `data_movies_infos` ADD CONSTRAINT `data_movies_infos_imdb_id_foreign` FOREIGN KEY(`imdb_id`) REFERENCES `movies_paramount`(`imdb_id`);
ALTER TABLE
    `data_movies_infos` ADD CONSTRAINT `data_movies_infos_imdb_id_foreign` FOREIGN KEY(`imdb_id`) REFERENCES `movies_disney`(`imdb_id`);
ALTER TABLE
    `data_movies_infos` ADD CONSTRAINT `data_movies_infos_imdb_id_foreign` FOREIGN KEY(`imdb_id`) REFERENCES `movies_netflix`(`imdb_id`);
ALTER TABLE
    `data_ids_imdb_tmdb` ADD CONSTRAINT `data_ids_imdb_tmdb_tmdb_id_foreign` FOREIGN KEY(`tmdb_id`) REFERENCES `tmdb_popularity`(`id (tmdb_id)`);
ALTER TABLE
    `movies_amazon` ADD CONSTRAINT `movies_amazon_imdb_id_foreign` FOREIGN KEY(`imdb_id`) REFERENCES `data_movies_infos`(`imdb_id`);
ALTER TABLE
    `data_movies_infos` ADD CONSTRAINT `data_movies_infos_imdb_id_foreign` FOREIGN KEY(`imdb_id`) REFERENCES `imdb_score_ratings`(`titleId (imdb_id)`);
ALTER TABLE
    `data_ids_imdb_tmdb` ADD CONSTRAINT `data_ids_imdb_tmdb_imdb_id_foreign` FOREIGN KEY(`imdb_id`) REFERENCES `data_movies_infos`(`imdb_id`);