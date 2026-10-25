
CREATE DATABASE HospitalDB;

USE HospitalDB;

CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Department(department_id)
);

CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15)
);

CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    FOREIGN KEY (patient_id)
        REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id)
        REFERENCES Doctor(doctor_id)
);

INSERT INTO Department VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics');

INSERT INTO Doctor VALUES
(101, 'Dr. Amit Sharma', 'Heart Specialist', 1),
(102, 'Dr. Priya Patil', 'Neurologist', 2),
(103, 'Dr. Rahul Deshmukh', 'Bone Specialist', 3);

INSERT INTO Patient VALUES
(201, 'Anita More', 25, 'Female', '9876543210'),
(202, 'Rohan Patil', 32, 'Male', '9876543211'),
(203, 'Sneha Shah', 28, 'Female', '9876543212');

INSERT INTO Appointment VALUES
(301, 201, 101, '2026-10-26', '10:00:00'),
(302, 202, 102, '2026-10-26', '11:00:00'),
(303, 203, 103, '2026-10-27', '12:00:00');

SELECT * FROM Department;

SELECT * FROM Doctor;

SELECT * FROM Patient;

SELECT * FROM Appointment;

SELECT
    Patient.patient_name,
    Doctor.doctor_name,
    Department.department_name,
    Appointment.appointment_date,
    Appointment.appointment_time
FROM Appointment
JOIN Patient
    ON Appointment.patient_id = Patient.patient_id
JOIN Doctor
    ON Appointment.doctor_id = Doctor.doctor_id
JOIN Department
    ON Doctor.department_id = Department.department_id;
  
