
-- psql -f load_data.sql ironfin_development

copy movies from '/Users/nnguyen/Documents/_Dev/IronFin/db/raw_data/movie.del' with (FORMAT csv);

copy actors from '/Users/nnguyen/Documents/_Dev/IronFin/db/raw_data/actor1.del' with (FORMAT csv);

copy actors from '/Users/nnguyen/Documents/_Dev/IronFin/db/raw_data/actor2.del' with (FORMAT csv);

copy actors from '/Users/nnguyen/Documents/_Dev/IronFin/db/raw_data/actor3.del' with (FORMAT csv);

copy directors from '/Users/nnguyen/Documents/_Dev/IronFin/db/raw_data/director.del' with (FORMAT csv);

copy movie_actors from '/Users/nnguyen/Documents/_Dev/IronFin/db/raw_data/movieactor1.del' with (FORMAT csv);

copy movie_actors from '/Users/nnguyen/Documents/_Dev/IronFin/db/raw_data/movieactor2.del' with (FORMAT csv);

copy movie_directors from '/Users/nnguyen/Documents/_Dev/IronFin/db/raw_data/moviedirector.del' with (FORMAT csv);

copy movie_genres from '/Users/nnguyen/Documents/_Dev/IronFin/db/raw_data/moviegenre.del' with (FORMAT csv);

