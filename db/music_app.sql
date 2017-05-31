DROP TABLE IF EXISTS albums;
DROP TABLE artists;

CREATE TABLE artists (
id SERIAL8 PRIMARY KEY,
name VARCHAR(255)


);

CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,  --primary key won't allow duplicates and will increment itself automatically
  title VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT8 REFERENCES artists(id)
  
);
