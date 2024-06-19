CREATE TABLE IF NOT EXISTS user (
  usr_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  usr_username VARCHAR(64) NOT NULL,
  usr_password VARCHAR(255) NOT NULL,
  usr_salt VARCHAR(100) NOT NULL,
  usr_email VARCHAR(64) NOT NULL UNIQUE,
  PRIMARY KEY (usr_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DELETE FROM user;
INSERT INTO user (usr_username, usr_password, usr_salt, usr_email)
VALUES ('hpatel', 'fa618ff05c687488bd740bd958a03380b47f75d61bd2172afa428954df92b55b', '1pdj4md7n24zr5u3wy3olp1r1a6p7otw', 'hpatel@mail.com'),
	('kkaneki', 'de67fbed51baa01ec9843db58bffafd28dfb02619875626002ccfe4533d353a1', 'k974s9egj23sujb7jhltggqh0dnss2eh', 'student2@mail.com'),
    ('eyeager', 'f5a05548ea49258d40eecf7afabc04b55f68953d5dc67bfd9dc90df7b51c7574', 'nhug7j4pps5zjceyjzgan5ftbnnngipf', 'kkaneki@mail.com'),
	('awalker', '397080a248bf517bfbe5b3b994eb566cd37e8cb24121331c14ee92b351bcbb80', '7qk5hbkh2hpo7252ncuv2mxpk8mded0p', 'awalker@mail.com'),
    ('kleonard', 'e744fd8303d95446446aaffc9ebc321f22bcbdbf2cd5419526bd0cbd1ef65920', 'hlejo01eq93t1862nxmr1a4cv6naypw7', 'kleonard@mail.com'),
	('student6', 'a6fa7595806d1b9b971d5676600bb4fbdd7297c6c998a6f326bf2c9013522aaa', 'vkvw3thggkw8vbgjtzz5px8eztlrvcji', 'student6@mail.com'),
    ('student7', 'e4f6c53a2ac696f0b788e8ae9559f5a7d490e7516d68b99d2e401223d199eb95', 'g6mr1ki2acyp6x3yjsb59hscei665gw3', 'student7@mail.com'),
	('student8', '1d897ca84ebdc0306ce6a174b7046b68c9b26cdb0484f0f72b6bc08fa2da5d64', 'y8u3n885aghdc2jw4s0u888uqvkxnec7', 'student8@mail.com'),
    ('student9', '4038a883f19299ba24169b7cede15b299f7e5e30bc082601391978cb197fef74', 'bjg3r5e5hi8s5twkm9pwif5cfcjps74h', 'student9@mail.com'),
	('student10', '432fc1b8bd3a4fa81895a321f0c7bac68d02d16de4e89757e55d143958a69196', 'lbw50wgv28lsgl7vor3pl95p2lvdc6a0 ', 'student10@mail.com');

CREATE TABLE IF NOT EXISTS Workouts (
  workout_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  usr_id INT(10) UNSIGNED NOT NULL,
  workout_date DATE NOT NULL,
  PRIMARY KEY (workout_id),
  FOREIGN KEY (usr_id) REFERENCES user(usr_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DELETE FROM Workouts;
INSERT INTO Workouts (usr_id, workout_date)
VALUES ((SELECT usr_id FROM user WHERE usr_username = 'hpatel'), '2024-06-18');


CREATE TABLE IF NOT EXISTS Exercises (
    exercise_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    exercise_name VARCHAR(100) NOT NULL,
    exercise_description TEXT,
    PRIMARY KEY (exercise_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DELETE FROM Exercises;
INSERT INTO Exercises (exercise_name, exercise_description)
VALUES ('Squat', 'Legs - Quads, Hamstrings, Glutes, Core'),
    ('Bench Press', 'Chest, Triceps, Shoulders'),
    ('Deadlift', 'Core, Forearms, Full Body');

CREATE TABLE IF NOT EXISTS WorkoutExercises (
    workoutExercise_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    workout_id INT(10) UNSIGNED NOT NULL,
    exercise_id INT(10) UNSIGNED NOT NULL,
    weights DECIMAL(5, 2),
    reps INT,
    numSets INT,
    PRIMARY KEY (workoutExercise_id),
    FOREIGN KEY (workout_id) REFERENCES Workouts(workout_id),
    FOREIGN KEY (exercise_id) REFERENCES Exercises(exercise_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DELETE FROM WorkoutExercises;
INSERT INTO WorkoutExercises (workout_id, exercise_id, weights, reps, numSets)
VALUES (1, 1, 225.0, 5, 3),
    (1, 2, 135.0, 10, 3);