-- Query 1
-- Retrieve available Champions League matches.
SELECT
    match_id,
    fixture,
    base_ticket_price
FROM Matches
WHERE tournament_category = 'Champions League'
  AND match_status = 'Available';

-- Query 2
-- Search users by full name using LIKE and ILIKE.
SELECT
    user_id,
    full_name,
    email
FROM Users
WHERE LOWER(full_name) LIKE LOWER('Tanvir%')
   OR full_name ILIKE '%Haque%';

-- Query 3
-- Retrieve bookings with missing payment status and replace NULL with Action Required.
SELECT
    booking_id,
    user_id,
    match_id,
    COALESCE(payment_status, 'Action Required') AS systematic_status
FROM Bookings
WHERE payment_status IS NULL;

-- Query 4
-- Retrieve booking information with user full name and match fixture.
SELECT
    b.booking_id,
    u.full_name,
    m.fixture,
    b.total_cost
FROM Bookings AS b
INNER JOIN Users AS u
    ON b.user_id = u.user_id
INNER JOIN Matches AS m
    ON b.match_id = m.match_id;

-- Query 5
-- Display every user, including users who never booked.
SELECT
    u.user_id,
    u.full_name,
    b.booking_id
FROM Users AS u
LEFT JOIN Bookings AS b
    ON u.user_id = b.user_id;

-- Query 6
-- Find bookings whose total cost is greater than the average total cost.
SELECT
    booking_id,
    match_id,
    total_cost
FROM Bookings
WHERE total_cost > (
    SELECT AVG(total_cost)
    FROM Bookings
);

-- Query 7
-- Retrieve the next two most expensive matches after skipping the highest priced match.
SELECT
    match_id,
    fixture,
    base_ticket_price
FROM Matches
ORDER BY base_ticket_price DESC
LIMIT 2
OFFSET 1;