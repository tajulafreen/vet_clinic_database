CREATE TABLE medical_histories (
    id serial PRIMARY KEY NOT NULL,
    admitted_at timestamp,
    patient_id int REFERENCES patients(id),
    status varchar(100) NOT NULL
); 

CREATE TABLE patients (
    id serial PRIMARY KEY NOT NULL,
    name VARCHAR(100),
    date_of_birth DATE,
); 

CREATE TABLE invoices (
    id serial PRIMARY KEY NOT NULL,
    total_amount DECIMAL(10,2),
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id serial PRIMARY KEY NOT NULL,
); 

CREATE TABLE invoice_items (
    id serial PRIMARY KEY NOT NULL,
    unit_price DECIMAL(10,2),
    quantity NOT NULL,
    total_price DECIMAL(10,2),
    invoice_id serial PRIMARY KEY NOT NULL,
    treatment_id serial PRIMARY KEY NOT NULL,
); 

CREATE TABLE treatments (
    id serial PRIMARY KEY NOT NULL,
    type VARCHAR(100),
    name VARCHAR(100),
);