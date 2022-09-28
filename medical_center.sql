-- Medical center

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE centers 
(
    id SERIAL PRIMARY KEY,
    center_name TEXT NOT NULL,
    address TEXT NOT NULL
);

CREATE TABLE doctors 
(
    id SERIAL PRIMARY KEY,
    doctor_first_name TEXT NOT NULL,
    doctor_last_name TEXT NOT NULL,
    employer_id INTEGER REFERENCES centers ON DELETE CASCADE,
    specialty TEXT
);

CREATE TABLE patients 
(
    id SERIAL PRIMARY KEY,
    patient_first_name TEXT NOT NULL,
    patient_last_name TEXT NOT NULL,
    birthdate DATE
);

CREATE TABLE diagnoses 
(
    id SERIAL PRIMARY KEY,
    diagnosis TEXT NOT NULL,
    diagnosis_date DATE
);

CREATE TABLE patients_doctors 
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients ON DELETE CASCADE,
    doctor_id INTEGER NOT NULL REFERENCES doctors ON DELETE CASCADE
);

CREATE TABLE patients_diagnoses 
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients ON DELETE CASCADE,
    diagnosis_id INTEGER NOT NULL REFERENCES diagnoses ON DELETE CASCADE
);