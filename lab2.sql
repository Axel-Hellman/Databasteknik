

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

CREATE TABLE IF NOT EXISTS performanses (
   p_id TEXT DEFALT (lower(hex(randomblob(16))))
   start_time INTEGER
   start_date INTEGER
   
   PRIMARY KEY(p_id)
   FOREIGN KEY (imdb) REFERENCES movies (imdb)
   FOREIGN KEY (t_name) REFERENCES theatres (t_name)
);

CREATE TABLE IF NOT EXISTS tickets (
   ticket_id TEXT DEFALT (lower(hex(randomblob(16))))
   
   PRIMARY KEY(ticket_id)
   FOREIGN KEY (p_id) REFERENCES performanses (p_id)
   FOREIGN KEY (user_name) REFERENCES customers (user_name)
);

CREATE TABLE IF NOT EXISTS customers (
   user_name TEXT 
   c_name TEXT
   pass INTEGER

   PRIMARY KEY(user_name)
);


