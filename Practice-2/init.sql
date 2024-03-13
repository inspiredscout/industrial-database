CREATE TABLE property_types (
    type_id SERIAL PRIMARY KEY,
    type_name VARCHAR
);

CREATE TABLE districts (
    district_id SERIAL PRIMARY KEY,
    district_name VARCHAR
);

CREATE TABLE building_materials (
    material_id SERIAL PRIMARY KEY,
    material_name VARCHAR
);

CREATE TABLE real_estate_objects (
    object_id SERIAL PRIMARY KEY,
    district_id BIGINT,
    address VARCHAR,
    floor BIGINT,
    room_count BIGINT,
    type_id BIGINT,
    status BIGINT,
    cost BIGINT,
    description TEXT,
    material_id BIGINT,
    area BIGINT,
    posting_date TIMESTAMP
);

CREATE TABLE evaluation_criteria (
    criterion_id SERIAL PRIMARY KEY,
    criterion_name VARCHAR
);

CREATE TABLE evaluations (
    evaluation_id SERIAL PRIMARY KEY,
    object_id BIGINT,
    evaluation_date TIMESTAMP,
    criterion_id BIGINT,
    evaluation DOUBLE PRECISION
);

CREATE TABLE realtors (
    realtor_id SERIAL PRIMARY KEY,
    last_name VARCHAR,
    first_name VARCHAR,
    patronymic VARCHAR,
    contact_phone VARCHAR
);

CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    object_id BIGINT,
    sale_date TIMESTAMP,
    realtor_id BIGINT,
    cost DOUBLE PRECISION
);