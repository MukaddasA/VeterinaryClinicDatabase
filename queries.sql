-- Find Client information by id
SELECT *
FROM clients
WHERE client_id = 'Client123';



-- Find Doctor information by vcn_no
SELECT *
FROM doctors
WHERE vcn_no = 'VCN123';


-- Find all patients associated with a client
SELECT patients.patient_id, species.name AS species, breeds.name AS breed, patients.sex, patients.age_group
FROM patients
JOIN species ON patients.species_id = species.id
JOIN breeds ON patients.breed_id = breeds.id
WHERE patients.client_id = 'Client123';



-- Find all cases associated with a patient
SELECT cases.date, cases.status, diagnosis.name AS diagnosis, cases.case_type, cases.notes
FROM cases
JOIN diagnosis ON cases.diagnosis_id = diagnosis.id
WHERE cases.patient_id = 'Patient123';


-- Find all medication in a prescription
SELECT pharmacy_inventory.generic_name, prescribedmeds.quantity, prescribedmeds.frequency, prescribedmeds.route
FROM prescribedmeds
JOIN pharmacy_inventory ON prescribedmeds.medication_id = pharmacy_inventory.item_id
WHERE prescribedmeds.prescription_id = 'Prescription123';



-- Find the total reciepts issued by date grouped by payment method
SELECT SUM(total_amount) AS total_amount, payment_method
FROM receipts
WHERE date = '2023-10-26'
GROUP BY payment_method;


-- Count the number of cases by diagnosis
SELECT diagnosis.name AS diagnosis, COUNT(cases.id) AS case_count
FROM cases
JOIN diagnosis ON cases.diagnosis_id = diagnosis.id
GROUP BY diagnosis.name;

-- Add a new client
INSERT INTO clients (client_id, first_name, last_name, address, phone_no)
VALUES ('Client123', 'Mukaddas', 'Ahmad', '123 Orange Street', '12345678901');

-- Add a new patient
INSERT INTO patients (patient_id, client_id, species_id, breed_id, sex, age_group)
VALUES ('Patient123', 'Client123', 1, 1, 'Male', 'Young');

-- Add a new doctor
INSERT INTO doctors (vcn_no, first_name, last_name, phone_no, email, year_graduated)
VALUES ('VCN123', 'Mukaddas', 'Ahmad', '12345678901', 'ahmad@example.com', 2000);


-- Add a new case
INSERT INTO cases (patient_id, date, status, diagnosis_id, case_type, notes, doctor_vcn_no)
VALUES ('Patient123', '2023-10-26', 'New', 1, 'Medical', 'Notes for the case', 'VCN123');


-- Add a new prescription
INSERT INTO prescriptions (patient_id, prescribing_doctor_vcn_no, date)
VALUES ('Patient123', 'VCN123', '2023-10-26');

-- Add a new item to the inventory
INSERT INTO pharmacy_inventory (trade_name, generic_name, category, unit, cost_price_per_unit, sale_price_per_unit, barcode, expiration_date)
VALUES ('Tylodox', 'TylosinDoxycycline', 'Antibiotics', 'gram', '0.02', '0.025', '1234567890', '2024-12-31');


-- Update client information
UPDATE clients
SET address = '456 Orange Street', phone_no = '9876543210'
WHERE client_id = 'Client123';


-- Delete patient record
DELETE FROM patients
WHERE patient_id = 'Patient123';
