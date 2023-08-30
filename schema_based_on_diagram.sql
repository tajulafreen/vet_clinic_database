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
    FOREIGN_KEY(medical_history_id) REFERENCES medical_histories(id) 
); 

CREATE TABLE invoice_items (
    id serial PRIMARY KEY NOT NULL,
    unit_price DECIMAL(10,2),
    quantity NOT NULL,
    total_price DECIMAL(10,2),
    FOREIGN_KEY(invoice_id) REFERENCES invoices(id)
    FOREIGN_KEY(treatment_id) REFERENCES medical_histories_treatments(id)
); 

CREATE TABLE medical_history_treatments (
  medical_history_id INT REFERENCES medical_histories(id),
  treatment_id INT REFERENCES treatments(id),
  PRIMARY KEY (medical_history_id, treatment_id)
);


------------------------- create foreign keys

CREATE INDEX idx_p_id ON medical_histories (patient_id),
       idx_in_mh_id ON invoices (medical_history_id),
       idx_in_id ON invoice_items (invoice_id),
       idx_int_tr_id ON invoice_items (treatment_id),
       idx_ht_mh_id ON history_and_treatments (medical_history_id),
       idx_ht_tr_id ON history_and_treatments (treatment_id);
