DROP DATABASE IF EXISTS embermojo;
CREATE DATABASE embermojo;
USE embermojo;

CREATE TABLE speaker (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(512) NULL
);

CREATE TABLE presentation (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(512) NULL,
  speaker_id INT NOT NULL,

  FOREIGN KEY (speaker_id) REFERENCES speaker (id)
);

INSERT INTO speaker
  (name)
VALUES
  ("Bugs Bunny"),
  ("Wile E. Coyote"),
  ("Yosemite Sam");

INSERT INTO presentation
  (title, speaker_id)
VALUES
  ("What's up with Docs?", 1),
  ("Of course, you know, this means war.", 1),
  ("Getting the most from the Acme categlog.", 2),
  ("Shaaaad up!", 3),
  ("Ah hates rabbits.", 3),
  ("The Great horni-todes", 3);
