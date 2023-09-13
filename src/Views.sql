CREATE VIEW Hotel_Chain_Count AS
SELECT c.chain_id, c.name, COUNT(h.hotel_id) AS num_hotels
FROM Hotel_Chain c
LEFT JOIN Hotel h ON c.chain_id = h.chain_id
GROUP BY c.chain_id, c.name;

CREATE VIEW Hotel_Occupancy AS
SELECT h.hotel_id, COUNT(r.room_number) AS num_rooms,
    COUNT(b.booking_id) AS num_bookings,
    COUNT(b.booking_id) / COUNT(r.room_number)::float AS occupancy_rate
FROM Hotel h
LEFT JOIN Room r ON h.hotel_id = r.hotel_id
LEFT JOIN Booking b ON r.room_number = b.room_number AND r.hotel_id = b.hotel_id
GROUP BY h.hotel_id;

CREATE VIEW Hotel_Revenue AS
SELECT h.hotel_id, SUM(b.total_price) AS total_revenue
FROM Hotel h
LEFT JOIN Booking b ON h.hotel_id = b.hotel_id
GROUP BY h.hotel_id;
