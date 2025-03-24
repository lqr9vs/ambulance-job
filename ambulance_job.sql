-- Add the ambulance job to the jobs table
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('ambulance', 'Ambulance', 1);

-- Add ambulance job grades
INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('ambulance', 0, 'recruit', 'Recruit', 500, '{}', '{}'),
('ambulance', 1, 'paramedic', 'Paramedic', 750, '{}', '{}'),
('ambulance', 2, 'doctor', 'Doctor', 1000, '{}', '{}'),
('ambulance', 3, 'surgeon', 'Surgeon', 1250, '{}', '{}'),
('ambulance', 4, 'boss', 'Chief', 1500, '{}', '{}');
