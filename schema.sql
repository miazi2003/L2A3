-- ==================================================
-- Database: football_ticket_booking
-- PostgreSQL Schema
-- ==================================================
-- Users table
-- Stores registered users who can make ticket bookings.
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    role VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20)
);

-- Matches table
-- Stores football match details and ticket pricing information.
CREATE TABLE Matches (
    match_id SERIAL PRIMARY KEY,
    fixture VARCHAR(150),
    tournament_category VARCHAR(100),
    base_ticket_price NUMERIC(10, 2) NOT NULL,
    match_status VARCHAR(50) NOT NULL
);

-- Bookings table
-- Stores ticket bookings made by users for specific matches.
CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    match_id INTEGER NOT NULL,
    seat_number VARCHAR(20),
    payment_status VARCHAR(50),
    total_cost NUMERIC(10, 2),

    CONSTRAINT fk_bookings_user
        FOREIGN KEY (user_id)
        REFERENCES Users(user_id),

    CONSTRAINT fk_bookings_match
        FOREIGN KEY (match_id)
        REFERENCES Matches(match_id)
);
