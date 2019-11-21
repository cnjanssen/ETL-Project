-- Create zip  table
CREATE TABLE zipburough
  zipID SERIAL PRIMARY KEY,
  zipcode INT
);


-- Create zipburough junction table
CREATE TABLE zipburough
  id SERIAL PRIMARY KEY,
  language VARCHAR(20),
  rating INT
);