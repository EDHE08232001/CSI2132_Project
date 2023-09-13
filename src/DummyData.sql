-- Insert data into Hotel_Chain table
INSERT INTO public.Hotel_Chain (chain_id, name, street_number, street_name, unit_number, city, state, country, postal_code)
VALUES
('C001', 'Hilton', 123, 'Main St', 0, 'New York City', 'NY', 'USA', '10001'),
('C002', 'Marriott', 456, 'Oak Ave', 1, 'Los Angeles', 'CA', 'USA', '90001'),
('C003', 'InterContinental', 789, 'Maple Rd', 2, 'Chicago', 'IL', 'USA', '60007'),
('C004', 'Sheraton', 321, 'Cedar St', 3, 'Houston', 'TX', 'USA', '77002'),
('C005', 'Holiday Inn', 654, 'Birch Blvd', 4, 'Miami', 'FL', 'USA', '33101');

-- Insert data into Hotel table
INSERT INTO public.Hotel (hotel_id, chain_id, street_number, street_name, unit_number, city, state, country, postal_code, rating, email, category)
VALUES
('H001A', 'C001', 100, 'Broadway', 5, 'New York City', 'NY', 'USA', '10001', 4, 'hilton1@gmail.com', 'Luxury Hotel'),
('H001B', 'C001', 200, 'Park Ave', 6, 'New York City', 'NY', 'USA', '10022', 3, 'hilton2@gmail.com', 'Business Hotel'),
('H002A', 'C002', 300, 'Sunset Blvd', 7, 'Los Angeles', 'CA', 'USA', '90028', 4, 'marriott1@gmail.com', 'Casino Hotel'),
('H002B', 'C002', 400, 'Wilshire Blvd', 8, 'Los Angeles', 'CA', 'USA', '90010', 3, 'marriott2@gmail.com', 'Luxury Hotel'),
('H003A', 'C003', 500, 'Michigan Ave', 9, 'Chicago', 'IL', 'USA', '60611', 5, 'intercon1@gmail.com', 'Luxury Hotel'),
('H003B', 'C003', 600, 'State St', 10, 'Chicago', 'IL', 'USA', '60605', 4, 'intercon2@gmail.com', 'Business Hotel'),
('H004A', 'C004', 700, 'Main St', 11, 'Houston', 'TX', 'USA', '77002', 3, 'sheraton1@gmail.com', 'Casino Hotel'),
('H004B', 'C004', 800, 'Smith St', 12, 'Houston', 'TX', 'USA', '77006', 3, 'sheraton2@gmail.com', 'Business Hotel'),
('H005A', 'C005', 900, 'Collins Ave', 13, 'Miami', 'FL', 'USA', '33139', 4, 'holidayinn1@gmail.com', 'Casino Hotel'),
('H005B', 'C005', 1000, 'Ocean Dr', 14, 'Miami', 'FL', 'USA', '33139', 3, 'holidayinn2@gmail.com', 'Business Hotel');

-- Insert data into Room table
INSERT INTO public.Room (room_number, hotel_id, price, capacity, max_capacity)
VALUES
(0, 'H001A', 358.79, 2, 3),
(1, 'H001B', 600.56, 7, 10),
(2, 'H002A', 567.67, 4, 7),
(3, 'H002B', 865.89, 6, 10),
(4, 'H003A', 847.86, 9, 12),
(5, 'H003B', 789.56, 2, 3),
(6, 'H004A', 890.60, 5, 6),
(7, 'H004B', 1000.67, 2, 3),
(8, 'H005A', 890.5, 4, 5),
(9, 'H005B', 89.90, 3, 5);

-- Insert dummy data for Person table
INSERT INTO public.Person (SIN, first_name, last_name, middle_name, street_number, street_name, unit_number, city, state, country, postal_code)
VALUES
('111-111-111', 'John', 'Doe', 'A', 123, 'Main St', 1, 'Toronto', 'ON', 'Canada', 'M1M 1M1'),
('222-222-222', 'Jane', 'Doe', 'B', 456, 'Broadway', 2, 'New York', 'NY', 'USA', '10001'),
('333-333-333', 'Bob', 'Smith', 'C', 789, 'Granville St', NULL, 'Vancouver', 'BC', 'Canada', 'V6Z 1G2'),
('444-444-444', 'Alice', 'Smith', 'D', 246, 'Queen St', NULL, 'Auckland', NULL, 'New Zealand', '1010'),
('555-555-555', 'Jack', 'Johnson', NULL, 789, 'Main St', 3, 'Los Angeles', 'CA', 'USA', '90001'),
('666-666-666', 'Jill', 'Johnson', 'E', 123, 'Yonge St', NULL, 'Toronto', 'ON', 'Canada', 'M5B 1M4'),
('777-777-777', 'Mike', 'Lee', NULL, 246, 'Pender St', 4, 'Vancouver', 'BC', 'Canada', 'V6B 2T4'),
('888-888-888', 'Lisa', 'Wang', NULL, 123, 'Burrard St', 5, 'Vancouver', 'BC', 'Canada', 'V6Z 1Y6'),
('999-999-999', 'David', 'Wang', 'F', 456, 'Robson St', 6, 'Vancouver', 'BC', 'Canada', 'V6B 1A7'),
('000-000-000', 'Emily', 'Chen', NULL, 246, 'Davie St', 7, 'Vancouver', 'BC', 'Canada', 'V6E 1N4');

-- Insert dummy data for Employee table
INSERT INTO public.Employee (employee_id, supervisor_id, SIN, hotel_id, salary)
VALUES
('E00001', NULL, '111-111-111', 'H001A', 50000),
('E00002', 'E00001', '222-222-222', 'H002A', 60000),
('E00003', 'E00001', '333-333-333', 'H003A', 70000),
('E00004', 'E00002', '444-444-444', 'H004A', 55000),
('E00005', 'E00002', '555-555-555', 'H005A', 65000);

-- Insert dummy data for Customer table
INSERT INTO public.Customer (SIN, registration_date)
VALUES
('666-666-666', '2022-01-01'),
('777-777-777', '2021-12-01'),
('888-888-888', '2022-02-01'),
('999-999-999', '2022-03-01'),
('000-000-000', '2022-04-01');

-- Dummy data for Booking table
INSERT INTO public.Booking (booking_id, check_in_date, check_out_date, room_number, hotel_id, total_price)
VALUES
('B001', '2023-04-01', '2023-04-05', 0, 'H001A', NULL),
('B002', '2023-04-02', '2023-04-04', 2, 'H002A', NULL),
('B003', '2023-04-01', '2023-04-05', 4, 'H003A', NULL),
('B004', '2023-04-03', '2023-04-05', 6, 'H004A', NULL),
('B005', '2023-04-04', '2023-04-06', 8, 'H005A', NULL);

-- Dummy data for Renting table
INSERT INTO public.Renting (booking_id, cc_number, expiry_date)
VALUES
('B001', 12345, '2024-04-05'),
('B002', 23456, '2023-04-04'),
('B003', 34567, '2025-04-05'),
('B004', 45678, '2024-04-05'),
('B005', 56789, '2024-04-06');

-- Insert data into Room table
INSERT INTO public.Room (room_number, hotel_id, price, capacity, max_capacity)
VALUES

(611, 'H001A', 3578.79, 2, 3),
(612, 'H001B', 6070.56, 7, 10),
(621, 'H002A', 5677.67, 4, 7),
(633, 'H002B', 8675.89, 6, 10),
(644, 'H003A', 8477.86, 9, 12),
(651, 'H003B', 7879.56, 2, 3),
(662, 'H004A', 8790.60, 5, 6),
(673, 'H004B', 10700.67, 2, 3),
(684, 'H005A', 8970.5, 4, 5),
(695, 'H005B', 879.90, 3, 5),

(711, 'H001A', 3578.79, 2, 3),
(712, 'H001B', 6070.56, 7, 10),
(721, 'H002A', 5677.67, 4, 7),
(733, 'H002B', 8675.89, 6, 10),
(744, 'H003A', 8477.86, 9, 12),
(751, 'H003B', 7879.56, 2, 3),
(762, 'H004A', 8790.60, 5, 6),
(773, 'H004B', 10700.67, 2, 3),
(784, 'H005A', 8970.5, 4, 5),
(795, 'H005B', 879.90, 3, 5),

(811, 'H001A', 3578.79, 2, 3),
(812, 'H001B', 6070.56, 7, 10),
(821, 'H002A', 5677.67, 4, 7),
(833, 'H002B', 8675.89, 6, 10),
(844, 'H003A', 8477.86, 9, 12),
(851, 'H003B', 7879.56, 2, 3),
(862, 'H004A', 8790.60, 5, 6),
(873, 'H004B', 10700.67, 2, 3),
(884, 'H005A', 8970.5, 4, 5),
(895, 'H005B', 879.90, 3, 5),

(911, 'H001A', 3578.79, 2, 3),
(912, 'H001B', 6070.56, 7, 10),
(921, 'H002A', 5677.67, 4, 7),
(933, 'H002B', 8675.89, 6, 10),
(944, 'H003A', 8477.86, 9, 12),
(951, 'H003B', 7879.56, 2, 3),
(962, 'H004A', 8790.60, 5, 6),
(973, 'H004B', 10700.67, 2, 3),
(984, 'H005A', 8970.5, 4, 5),
(995, 'H005B', 879.90, 3, 5);

