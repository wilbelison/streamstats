-- Criação de Views

-- View para análise comparativa entre plataformas
CREATE VIEW vw_platform_comparison AS
SELECT 
    'Netflix' as platform,
    COUNT(*) as total_content,
    AVG(imdb_score) as avg_rating,
    COUNT(CASE WHEN type = 'Movie' THEN 1 END) as movies,
    COUNT(CASE WHEN type = 'Show' THEN 1 END) as shows
FROM movies_netflix
UNION ALL
SELECT 
    'Amazon Prime' as platform,
    COUNT(*) as total_content,
    AVG(imdb_score) as avg_rating,
    COUNT(CASE WHEN type = 'Movie' THEN 1 END) as movies,
    COUNT(CASE WHEN type = 'Show' THEN 1 END) as shows
FROM movies_amazon
UNION ALL
SELECT 
    'Disney+' as platform,
    COUNT(*) as total_content,
    AVG(imdb_score) as avg_rating,
    COUNT(CASE WHEN type = 'Movie' THEN 1 END) as movies,
    COUNT(CASE WHEN type = 'Show' THEN 1 END) as shows
FROM movies_disney;

-- View para análise de gêneros
CREATE VIEW vw_genre_analysis AS
SELECT 
    platform,
    genres,
    COUNT(*) as content_count,
    AVG(imdb_score) as avg_rating
FROM (
    SELECT 'Netflix' as platform, genres, imdb_score FROM movies_netflix
    UNION ALL
    SELECT 'Amazon Prime' as platform, genres, imdb_score FROM movies_amazon
    UNION ALL
    SELECT 'Disney+' as platform, genres, imdb_score FROM movies_disney
) all_content
GROUP BY platform, genres
ORDER BY platform, content_count DESC;

-- View para análise temporal
CREATE VIEW vw_temporal_analysis AS
SELECT 
    platform,
    YEAR(release_year) as year,
    COUNT(*) as releases,
    AVG(imdb_score) as avg_rating
FROM (
    SELECT 'Netflix' as platform, release_year, imdb_score FROM movies_netflix
    UNION ALL
    SELECT 'Amazon Prime' as platform, release_year, imdb_score FROM movies_amazon
    UNION ALL
    SELECT 'Disney+' as platform, release_year, imdb_score FROM movies_disney
) all_releases
GROUP BY platform, YEAR(release_year)
ORDER BY platform, year;

-- Procedures

-- Procedure para atualizar ratings
DELIMITER //
CREATE PROCEDURE sp_update_ratings(
    IN p_imdb_id INT,
    IN p_new_rating DECIMAL(3,1)
)
BEGIN
    UPDATE data_movies_infos
    SET vote_average = p_new_rating
    WHERE imdb_id = p_imdb_id;
    
    -- Atualizar em todas as tabelas de plataformas
    UPDATE movies_netflix
    SET imdb_score = p_new_rating
    WHERE imdb_id = p_imdb_id;
    
    UPDATE movies_amazon
    SET imdb_score = p_new_rating
    WHERE imdb_id = p_imdb_id;
    
    -- Repetir para outras plataformas
END //
DELIMITER ;

-- Procedure para buscar conteúdo por gênero
DELIMITER //
CREATE PROCEDURE sp_find_by_genre(
    IN p_genre VARCHAR(50)
)
BEGIN
    SELECT 
        'Netflix' as platform,
        title,
        release_year,
        imdb_score,
        runtime
    FROM movies_netflix
    WHERE genres LIKE CONCAT('%', p_genre, '%')
    UNION ALL
    SELECT 
        'Amazon Prime' as platform,
        title,
        release_year,
        imdb_score,
        runtime
    FROM movies_amazon
    WHERE genres LIKE CONCAT('%', p_genre, '%')
    -- Repetir para outras plataformas
    ORDER BY imdb_score DESC;
END //
DELIMITER ;

-- Índices para otimização

-- Índices para buscas por gênero
CREATE INDEX idx_netflix_genres ON movies_netflix(genres);
CREATE INDEX idx_amazon_genres ON movies_amazon(genres);
CREATE INDEX idx_disney_genres ON movies_disney(genres);

-- Índices para buscas por rating
CREATE INDEX idx_netflix_rating ON movies_netflix(imdb_score);
CREATE INDEX idx_amazon_rating ON movies_amazon(imdb_score);
CREATE INDEX idx_disney_rating ON movies_disney(imdb_score);

-- Índices para buscas temporais
CREATE INDEX idx_netflix_release ON movies_netflix(release_year);
CREATE INDEX idx_amazon_release ON movies_amazon(release_year);
CREATE INDEX idx_disney_release ON movies_disney(release_year);

-- Queries para Relatórios

-- Top 10 conteúdos por plataforma
CREATE VIEW vw_top_content AS
SELECT 
    platform,
    title,
    imdb_score,
    tmdb_score,
    type
FROM (
    SELECT 
        'Netflix' as platform,
        title,
        imdb_score,
        tmdb_score,
        type,
        ROW_NUMBER() OVER (PARTITION BY 'Netflix' ORDER BY imdb_score DESC) as rn
    FROM movies_netflix
    UNION ALL
    SELECT 
        'Amazon Prime' as platform,
        title,
        imdb_score,
        tmdb_score,
        type,
        ROW_NUMBER() OVER (PARTITION BY 'Amazon Prime' ORDER BY imdb_score DESC) as rn
    FROM movies_amazon
) ranked
WHERE rn <= 10;

-- Análise de produção por país
CREATE VIEW vw_country_analysis AS
SELECT 
    platform,
    production_countries,
    COUNT(*) as content_count,
    AVG(imdb_score) as avg_rating
FROM (
    SELECT 'Netflix' as platform, production_countries, imdb_score FROM movies_netflix
    UNION ALL
    SELECT 'Amazon Prime' as platform, production_countries, imdb_score FROM movies_amazon
) all_content
GROUP BY platform, production_countries
HAVING content_count > 5
ORDER BY platform, content_count DESC;