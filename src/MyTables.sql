-- -------------------------------
-- Table Structure for Hotel_Chain
-- -------------------------------
CREATE TABLE IF NOT EXISTS public.Hotel_Chain (
    chain_id VARCHAR PRIMARY KEY,
    name VARCHAR(50),
    street_number INTEGER CHECK (street_number >= 0 AND street_number < 1000),
    street_name VARCHAR(100),
    unit_number INTEGER CHECK (unit_number >= 0),
    city VARCHAR(100),
    state VARCHAR(2),
    country VARCHAR(50),
    postal_code VARCHAR(10)
);

-- -------------------------
-- Table Structure for Hotel
-- -------------------------
CREATE TABLE IF NOT EXISTS public.Hotel (
    hotel_id VARCHAR(5) PRIMARY KEY,
    chain_id VARCHAR,
    street_number INTEGER,
    street_name VARCHAR(100),
    unit_number INTEGER,
    city VARCHAR(100),
    state VARCHAR(2),
    country VARCHAR(20),
    postal_code VARCHAR(10),
    rating INTEGER CHECK (rating >= 1 AND rating <= 5),
    email VARCHAR,
    category VARCHAR check (category = 'Luxury Hotel' OR category = 'Casino Hotel' OR category = 'Business Hotel'),
    CONSTRAINT fk_chain_id FOREIGN KEY (chain_id) REFERENCES Hotel_Chain(chain_id)
);

-- ------------------------
-- Table Structure for Room
-- ------------------------
CREATE TABLE IF NOT EXISTS public.Room (
    room_number INTEGER PRIMARY KEY CHECK (room_number >= 0),
    hotel_id VARCHAR,
    price FLOAT(2),
    capacity INTEGER,
    max_capacity INTEGER CHECK (max_capacity > capacity),
    CONSTRAINT fk_hotel_id FOREIGN KEY (hotel_id) REFERENCES Hotel(hotel_id)
);

ALTER TABLE public.Room
ALTER COLUMN price TYPE DOUBLE PRECISION;

CREATE TABLE IF NOT EXISTS public.RoomsByCity (
    room_number INTEGER PRIMARY KEY CHECK (room_number >= 0),
    hotel_id VARCHAR,
    price FLOAT(2),
    capacity INTEGER,
    max_capacity INTEGER CHECK (max_capacity > capacity),
    CONSTRAINT fk_hotel_id FOREIGN KEY (hotel_id) REFERENCES Hotel(hotel_id)
);

CREATE TABLE IF NOT EXISTS public.RoomsByHotel (
    room_number INTEGER PRIMARY KEY CHECK (room_number >= 0),
    hotel_id VARCHAR,
    price FLOAT(2),
    capacity INTEGER,
    max_capacity INTEGER CHECK (max_capacity > capacity),
    CONSTRAINT fk_hotel_id FOREIGN KEY (hotel_id) REFERENCES Hotel(hotel_id)
);


-- --------------------------
-- Table Structure for Person
-- --------------------------
CREATE TABLE IF NOT EXISTS public.Person (
    SIN VARCHAR PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR,
    middle_name VARCHAR,
    street_number INTEGER CHECK (street_number > 0),
    street_name VARCHAR,
    unit_number INTEGER CHECK (unit_number > 0),
    city VARCHAR,
    state VARCHAR(2),
    country VARCHAR,
    postal_code VARCHAR
);

-- ----------------------------
-- Table Structure for Employee
-- ----------------------------
CREATE TABLE IF NOT EXISTS public.Employee (
    employee_id VARCHAR PRIMARY KEY,
    supervisor_id VARCHAR,
    SIN VARCHAR,
    hotel_id VARCHAR(5),
    salary FLOAT CHECK (salary >= 0),
    CONSTRAINT fk_SIN FOREIGN KEY (SIN) REFERENCES Person(SIN),
    CONSTRAINT fk_hotel_id FOREIGN KEY (hotel_id) REFERENCES Hotel(hotel_id)
);

-- ----------------------------
-- Table Structure for Customer
-- ----------------------------
CREATE TABLE IF NOT EXISTS public.Customer (
    SIN VARCHAR PRIMARY KEY,
    registration_date DATE,
    CONSTRAINT fk_SIN FOREIGN KEY (SIN) REFERENCES Person(SIN)
);

-- ---------------------------
-- Table Structure for Booking
-- ---------------------------
CREATE TABLE IF NOT EXISTS public.Booking (
    booking_id VARCHAR PRIMARY KEY,
    check_in_date DATE,
    check_out_date DATE,
    room_number INTEGER,
    hotel_id VARCHAR,
    CONSTRAINT fk_room_number FOREIGN KEY (room_number) REFERENCES Room(room_number),
    CONSTRAINT fk_hotel_id FOREIGN KEY (hotel_id) references Hotel(hotel_id),
    total_price FLOAT
);

-- ---------------------------
-- Table Structure for Renting
-- ---------------------------
CREATE TABLE IF NOT EXISTS public.Renting (
    booking_id VARCHAR PRIMARY KEY,
    cc_number INTEGER,
    expiry_date DATE,
    CONSTRAINT fk_booking_id FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
    CONSTRAINT fk_expiry_date FOREIGN KEY (expiry_date) REFERENCES Booking(check_out_date)
);

-- --------------------------------
-- Table Structure for Hotel x Room
-- --------------------------------
CREATE TABLE IF NOT EXISTS public.Hotel_Room_Join (
    hotel_id VARCHAR(5),
    chain_id VARCHAR,
    street_number INTEGER,
    street_name VARCHAR(100),
    unit_number INTEGER,
    city VARCHAR(100),
    state VARCHAR(2),
    country VARCHAR(20),
    postal_code VARCHAR(10),
    rating INTEGER,
    email VARCHAR,
    category VARCHAR,
    room_number INTEGER,
    price FLOAT(2),
    capacity INTEGER,
    max_capacity INTEGER
);