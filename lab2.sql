

CREATE TABLE IF NOT EXISTS theatres (
   t_name TEXT
   cap INTEGER

   PRIMARY KEY(t_name)
);

CREATE TABLE IF NOT EXISTS movies (
   imdb TEXT 
   title TEXT
   prod_year INTEGER
   run_time INTEGER

   PRIMARY KEY(imdb)
);

CREATE TABLE IF NOT EXISTS performances (
   p_id TEXT DEFAULT (lower(hex(randomblob(16))))
   start_time TIME
   start_date DATE
   
   PRIMARY KEY(p_id)
   FOREIGN KEY (imdb) REFERENCES movies (imdb)
   FOREIGN KEY (t_name) REFERENCES theatres (t_name)
);

CREATE TABLE IF NOT EXISTS tickets (
   ticket_id TEXT DEFALT (lower(hex(randomblob(16))))
   
   PRIMARY KEY(ticket_id)
   FOREIGN KEY (p_id) REFERENCES performances (p_id)
   FOREIGN KEY (user_name) REFERENCES customers (user_name)
);

CREATE TABLE IF NOT EXISTS customers (
   user_name TEXT 
   c_name TEXT
   pass INTEGER

   PRIMARY KEY(user_name)
);

INSERT INTO theatres (t_name, cap)
VALUES (SF Bio, 200)
VALUES (Filmstaden, 400);

INSERT INTO movies (imdb, title, prod_year, run_time)
VALUES ("034256", "Inception", 2010, 148)
VALUES ("937548", "Spotlight", 2015, 129);

INSERT INTO performances (start_time, start_date)
VALUES ('17:00', '2019–02-01')
VALUES ('21:00', '2019-04-13');
                                   
INSERT INTO customers (user_name, c_name, pass)
VALUES ("movieMan13", "Marcus Hedebark", "movie54")
VALUES ("iLoveMovies", "Olle Römer", "batman2");
