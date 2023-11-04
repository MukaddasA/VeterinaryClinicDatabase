-- Clients table to capture the personal identifiable information of clients
CREATE TABLE `clients` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `client_id` VARCHAR(20) UNIQUE,
    `first_name` VARCHAR(64),
    `last_name` VARCHAR(64),
    `address` VARCHAR(64),
    `phone_no` CHAR(11),
    PRIMARY KEY (`id`)
);



-- Doctors table to capture the personal identifiable information of doctors (The vcn_no is a unique identifier of doctors registered with the veterinary council)
CREATE TABLE `doctors` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `vcn_no` VARCHAR(32) UNIQUE,
    `first_name` VARCHAR(64),
    `last_name` VARCHAR(64),
    `phone_no` CHAR(11),
    `email` VARCHAR(32),
    `year_graduated` YEAR,
    PRIMARY KEY (`id`)
);




-- Species table lists all the species of animals presented to the clinic (Unit classifies the species into three)
CREATE TABLE `species` (
   `id` INT UNSIGNED AUTO_INCREMENT,
   `name` VARCHAR(32) UNIQUE NOT NULL,
   `unit` ENUM('Avian', 'Large Animal', 'Small Animal'),
   PRIMARY KEY (`id`)
);



-- Breed table lists all the breed of animals presented to the clinic
CREATE TABLE `breeds` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(32) UNIQUE NOT NULL,
    PRIMARY KEY (`id`)
);



-- Diagnosis Table to capture common diagnosis encountered in the clinic
CREATE TABLE `diagnosis` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(64) UNIQUE NOT NULL,
    PRIMARY KEY (`id`)
);



-- Patients table to capture demographics of patients
CREATE TABLE `patients` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `patient_id` VARCHAR(20) UNIQUE,
    `client_id` VARCHAR(20),
    `species_id` INT UNSIGNED,
    `breed_id` INT UNSIGNED,
    `sex` ENUM('Male', 'Female'),
    `age_group` ENUM('Young', 'Adult'),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
    FOREIGN KEY (`species_id`) REFERENCES `species` (`id`),
    FOREIGN KEY (`breed_id`) REFERENCES `breeds` (`id`)
);



-- Cases table to capture cases presented to the clinic (status identifies a new case or an updated case,case_type identifies cases managed medically or surgically)
CREATE TABLE `cases` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `patient_id` VARCHAR(20),
    `date` DATE,
    `status` ENUM('New', 'Updated'),
    `diagnosis_id` INT UNSIGNED,
    `case_type` ENUM('Medical', 'Surgical'),
    `notes` VARCHAR(255),
    `doctor_vcn_no` VARCHAR(32),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
    FOREIGN KEY (`doctor_vcn_no`) REFERENCES `doctors` (`vcn_no`)
);



-- Table to keep track of pharmacy inventory
-- Consider setting category in the front end to cover ( 'Antibiotics', Antiparasitics',Analgesics/Pain Medications,Anti-Inflammatories,Antifungals,Antivirals,Antiseptics,Anesthetics/Sedatives,Antiemetics,Diuretics,Hormones,Cardiovascular Medications,Gastrointestinal Medications,Intravenous (IV) Fluids,Respiratory Medications,Dermatological Medications,Ophthalmic Medications,Vaccines,Behavioral Medications,Anthelmintics,Immunosuppressants,Other Specialty Medications) And unit to cover (Ml,Gram,Wrap(5g),Bolus,Bag)

CREATE TABLE  `pharmacy_inventory` (
    `item_id` INT UNSIGNED AUTO_INCREMENT,
    `trade_name` VARCHAR(255) NOT NULL,
    `generic_name` VARCHAR(255) NOT NULL,
    `category` VARCHAR(64),
    `unit` VARCHAR(32),
    `cost_price_per_unit` DECIMAL (10, 2),
    `sale_price_per_unit` DECIMAL (10, 2),
    `barcode` VARCHAR(255) UNIQUE,
    `expiration_date` DATE,
    PRIMARY KEY (`item_id`)
);


-- Prescription table to keep track of prescriptions
CREATE TABLE `prescriptions` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `patient_id` VARCHAR(20),
    `prescribing_doctor_vcn_no` VARCHAR(32),
    `date` DATE,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`patient_id`) REFERENCES `patients`(`patient_id`),
    FOREIGN KEY (`prescribing_doctor_vcn_no`) REFERENCES `doctors`(`vcn_no`)
);


-- A juction table to link many to many relationship associated with prescription and medication
-- Consider limiting input via front end on coulnm frequency(12 hourly,8 hourly,Once,Bi-weekly,Weekly etc) and route (IV,IM,PO,SC,etc)
CREATE TABLE `prescribedmeds` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `prescription_id` INT UNSIGNED,
    `medication_id` INT UNSIGNED,
    `quantity` INT UNSIGNED,
    `frequency` VARCHAR(32),
    `route` VARCHAR(32),
    `date` DATE,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`),
    FOREIGN KEY (`medication_id`) REFERENCES `pharmacy_inventory` (`item_id`)
);


-- A reciepts table to keep track of payments
CREATE TABLE `receipts` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `patient_id` VARCHAR(20),
    `prescription_id` INT UNSIGNED,
    `date` DATE,
    `total_amount` DECIMAL (10, 2),
    `payment_method` ENUM('Cash', 'Card'),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
    FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`)
);



-- Indexes to speed up common searches
CREATE INDEX `client_name_search` ON `clients` (`client_id`, `first_name`, `last_name`);
CREATE INDEX `patient_id_search` ON `patients` (`client_id`, `patient_id`) ;
CREATE INDEX `case_search` ON `cases` (`patient_id`, `date`, `doctor_vcn_no`);
CREATE INDEX `drug_search` ON `pharmacy_inventory` (`item_id`, `trade_name`, `generic_name`, `barcode`);
CREATE INDEX `prescription_search` ON `prescribedmeds` (`prescription_id`, `medication_id`, `date`);
CREATE INDEX `amount_search` ON `receipts` (`date`, `patient_id`, `payment_method`, `prescription_id`);


-- View to access patient information
CREATE VIEW patient_details AS
SELECT patients.patient_id, patients.client_id, patients.species_id, patients.breed_id, patients.sex, patients.age_group, clients.first_name AS client_first_name, clients.last_name AS client_last_name
FROM patients
JOIN clients ON patients.client_id = clients.client_id;
