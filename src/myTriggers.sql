--Trigger to enforce the maximum capacity constraint
CREATE OR REPLACE FUNCTION check_capacity() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.capacity > NEW.max_capacity THEN
        RAISE EXCEPTION 'The capacity cannot exceed the maximum capacity';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER capacity_trigger BEFORE INSERT OR UPDATE ON Room
FOR EACH ROW EXECUTE FUNCTION check_capacity();

--Trigger to calculate the total price of a booking
CREATE OR REPLACE FUNCTION update_booking_total_price() RETURNS TRIGGER AS $$
BEGIN
  NEW.total_price = (NEW.check_out_date - NEW.check_in_date) * (SELECT price FROM Room WHERE room_number = NEW.room_number);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER calculate_booking_total_price
BEFORE INSERT OR UPDATE ON Booking
FOR EACH ROW
EXECUTE FUNCTION update_booking_total_price();


--Trigger to enforce the check-in and check-out dates
CREATE OR REPLACE FUNCTION check_dates() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.check_in_date >= NEW.check_out_date THEN
        RAISE EXCEPTION 'The check-in date must be before the check-out date';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER dates_trigger BEFORE INSERT OR UPDATE ON Booking
FOR EACH ROW EXECUTE FUNCTION check_dates();

--Trigger to ensure that a hotel cannot be deleted if it has active bookings
CREATE OR REPLACE FUNCTION check_bookings() RETURNS TRIGGER AS $$
DECLARE
    booking_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO booking_count
    FROM Booking
    WHERE Booking.hotel_id = OLD.hotel_id AND Booking.check_out_date >= current_date;
    IF booking_count > 0 THEN
        RAISE EXCEPTION 'Cannot delete hotel, active bookings exist';
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER bookings_trigger BEFORE DELETE ON Hotel
FOR EACH ROW EXECUTE FUNCTION check_bookings();

--Trigger to enforce the category constraint
CREATE OR REPLACE FUNCTION check_category() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.category NOT IN ('Luxury Hotel', 'Casino Hotel', 'Business Hotel') THEN
        RAISE EXCEPTION 'The category must be one of: Luxury Hotel, Casino Hotel, Business Hotel';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER category_trigger BEFORE INSERT OR UPDATE ON Hotel
FOR EACH ROW EXECUTE FUNCTION check_category();

--Trigger to enforce the salary constraint
CREATE OR REPLACE FUNCTION check_salary() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.salary < 15 THEN
        RAISE EXCEPTION 'The salary must be greater than or equal to the minimum wage ($15 per hour)';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER salary_trigger BEFORE INSERT OR UPDATE ON Employee
FOR EACH ROW EXECUTE FUNCTION check_salary();

--Trigger to prevent a room from being double booked
CREATE OR REPLACE FUNCTION check_room_availability() RETURNS TRIGGER AS $$
BEGIN
  IF EXISTS (SELECT 1 FROM Booking WHERE Booking.room_number = NEW.room_number AND Booking.hotel_id = NEW.hotel_id) THEN
    RAISE EXCEPTION 'The room is already booked!';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER room_booking_trigger
BEFORE INSERT ON Booking
FOR EACH ROW
EXECUTE FUNCTION check_room_availability();
