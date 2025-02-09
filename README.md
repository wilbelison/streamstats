# StreamStats: Análise Comparativa de Streaming
## Projeto Final - Curso SQL

### 1. Introdução
O mercado de streaming tem experimentado um crescimento exponencial nos últimos anos, com múltiplas plataformas oferecendo conteúdo original e licenciado. Esta proliferação de serviços criou um novo desafio para os consumidores: como escolher a plataforma que melhor atende suas necessidades e preferências?

O StreamStats surge como uma solução para este desafio, oferecendo uma análise comparativa detalhada dos principais serviços de streaming disponíveis no mercado: Netflix, Amazon Prime, Disney+, HBO Max e Paramount+.

### 2. Objetivo
- Desenvolver uma base de dados relacional que permita análise comparativa entre diferentes plataformas de streaming
- Criar ferramentas analíticas para avaliar a qualidade e diversidade do conteúdo
- Facilitar a tomada de decisão dos consumidores através de dados estruturados
- Fornecer insights sobre tendências e padrões no mercado de streaming

### 3. Situação-problema
Os consumidores enfrentam diversos desafios no atual cenário de streaming:
- Dificuldade em comparar catálogos entre diferentes plataformas
- Custos crescentes para manter múltiplas assinaturas
- Falta de transparência sobre a qualidade do conteúdo disponível
- Complexidade em encontrar conteúdo específico entre diferentes serviços

### 4. Modelo de negócio
O StreamStats opera como uma plataforma de análise comparativa que:
- Agrega dados de múltiplas fontes (IMDB, TMDB, JustWatch)
- Permite comparação direta entre serviços de streaming
- Oferece análises personalizadas baseadas em preferências do usuário
- Fornece insights sobre custo-benefício das diferentes plataformas

### 5. Diagrama E-R
O banco de dados é composto por 8 tabelas principais:
- data_movies_infos: Informações detalhadas sobre filmes
- data_ids_imdb_tmdb: Mapeamento entre IDs do IMDB e TMDB
- tmdb_popularity: Dados de popularidade do TMDB
- imdb_score_ratings: Avaliações do IMDB
- movies_amazon: Catálogo da Amazon Prime
- movies_netflix: Catálogo da Netflix
- movies_disney: Catálogo da Disney+
- movies_hbo: Catálogo da HBO Max
- movies_paramount: Catálogo da Paramount+

### 6. Estrutura das Tabelas

#### data_movies_infos
| Coluna | Descrição | Tipo | Chave |
|--------|-----------|------|-------|
| id | Código Base | INT | - |
| imdb_id | Código IMDB | INT | PK/FK |
| adult | Classificação Adulto | BOOLEAN | - |
| budget | Orçamento (USD) | INT | - |
| genres | Gêneros | TEXT | - |
[...continua com todas as tabelas...]

https://docs.google.com/presentation/d/1qgoydPNZ5wSUq0sAQ_3-_OWpN3oni0VaQXHvxrFzSS8/edit?usp=sharing

### 7. Scripts de Criação
Os scripts de criação do banco de dados e suas tabelas estão disponíveis no arquivo `create_database.sql`.

### 8. Scripts de Inserção
Os dados são importados de arquivos CSV do Kaggle.

https://www.kaggle.com/datasets/rounakbanik/the-movies-dataset
https://www.kaggle.com/datasets/shreyasur29/imdbratings
https://www.kaggle.com/datasets/tmdb/tmdb-movie-metadata
https://www.kaggle.com/datasets/victorsoeiro/hbo-max-tv-shows-and-movies
https://www.kaggle.com/datasets/victorsoeiro/amazon-prime-tv-shows-and-movies
https://www.kaggle.com/datasets/victorsoeiro/disney-tv-shows-and-movies
https://www.kaggle.com/datasets/victorsoeiro/paramount-tv-shows-and-movies
https://www.kaggle.com/datasets/victorsoeiro/netflix-tv-shows-and-movies


### 9. Relatórios e Análises
O sistema oferece diversos relatórios analíticos, incluindo:
- Distribuição de conteúdo por plataforma
- Análise comparativa de ratings
- Tendências de lançamentos
- Análise de gêneros populares
- Comparação de custo-benefício

Scripts disponíveis no arquivo scripts.sql

### 10. Ferramentas e Tecnologias
- MySQL 8.0: Sistema de gerenciamento de banco de dados
- MySQL Workbench: Ferramenta de modelagem e administração
- Git: Controle de versão
- DrawSQL: Modelagem do diagrama ER