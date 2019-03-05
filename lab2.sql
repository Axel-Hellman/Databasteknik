DROP TABLE IF EXISTS theatres;
CREATE TABLE theatres (
   t_name TEXT,
   cap INTEGER,

   PRIMARY KEY(t_name)
);


DROP TABLE IF EXISTS movies;
CREATE TABLE movies (
   imdb TEXT, 
   title TEXT,
   prod_year INTEGER,
   run_time INTEGER,

   PRIMARY KEY(imdb)
);


DROP TABLE IF EXISTS performances;
CREATE TABLE performances (
   p_id TEXT DEFAULT (lower(hex(randomblob(16)))),
   start_time TIME,
   start_date DATE,
   
   imdb TEXT,
   t_name TEXT,
   PRIMARY KEY(p_id),
   FOREIGN KEY (imdb) REFERENCES movies (imdb),
   FOREIGN KEY (t_name) REFERENCES theatres (t_name)
);


DROP TABLE IF EXISTS tickets;
CREATE TABLE tickets (
   ticket_id TEXT DEFAULT (lower(hex(randomblob(16)))),
   
   p_id TEXT,
   user_name TEXT,
   PRIMARY KEY(ticket_id),
   FOREIGN KEY (p_id) REFERENCES performances (p_id),
   FOREIGN KEY (user_name) REFERENCES customers (user_name)
);


DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
   user_name TEXT,
   c_name TEXT,
   pass INTEGER,

   PRIMARY KEY(user_name)
);

INSERT 
INTO theatres (t_name, cap)
VALUES ('SF_Bio', 200),
       ('Filmstaden', 400);

INSERT 
INTO movies (imdb, title, prod_year, run_time)
VALUES ('034256', 'Inception', 2010, 148),
       ('937548', 'Spotlight', 2015, 129);

INSERT 
INTO performances (start_time, start_date, imdb, t_name)
VALUES ('17:00', '2019-02-01', '034256', 'Filmstaden'),
       ('21:00', '2019-04-13', '937548', 'SF_Bio');
                                   
INSERT 
INTO customers (user_name, c_name, pass)
VALUES ('movieMan13', 'Marcus_Hedebark', 'movie54'),
       ('iLoveMovies', 'Olle_Römer', 'batman2');

INSERT
INTO tickets (p_id, user_name)
VALUES ('c972ad3788214c530e95a88680a8d62b', 'movieMan13');
