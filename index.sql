CREATE TABLE learners (
  learner_id SERIAL PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  joined_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE skills (
  skill_id SERIAL PRIMARY KEY,
  skill_name VARCHAR(100) NOT NULL
);

CREATE TABLE learner_skills (
  learner_id INT REFERENCES learners(learner_id),
  skill_id INT REFERENCES skills(skill_id),
  added_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (learner_id, skill_id)
);

CREATE TABLE skill_ratings (
  learner_id INT,
  skill_id INT,
  rated_by INT,
  rating INT CHECK (
    rating BETWEEN 1
    AND 5
  ),
  rated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (learner_id, skill_id, rated_by),
  FOREIGN KEY (learner_id, skill_id) REFERENCES learner_skills(learner_id, skill_id),
  FOREIGN KEY (rated_by) REFERENCES learners(learner_id)
);
