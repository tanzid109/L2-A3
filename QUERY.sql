-- =========================================================================
-- 1. CREATE USERS TABLE
-- =========================================================================
CREATE TABLE IF NOT EXISTS Users(
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    role VARCHAR(50) NOT NULL CHECK (role IN ('Ticket Manager', 'Football Fan')),
    phone_number VARCHAR(20)
);

-- =========================================================================
-- 2. CREATE MATCHES TABLE
-- =========================================================================

CREATE TABLE IF NOT EXISTS Matches (
    match_id SERIAL PRIMARY KEY,
    fixture VARCHAR(200) NOT NULL,
    tournament_category VARCHAR(100) NOT NULL,
    base_ticket_price NUMERIC(10, 2) NOT NULL CHECK (base_ticket_price >= 0),
    match_status VARCHAR(50) CHECK (match_status IN ('Available', 'Selling Fast', 'Sold Out', 'Postponed'))
);

-- =========================================================================
-- 3. CREATE BOOKINGS TABLE
-- =========================================================================
CREATE TABLE IF NOT EXISTS Bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id SMALLINT NOT NULL REFERENCES Users(user_id) ,
    match_id SMALLINT NOT NULL REFERENCES Matches(match_id),
    seat_number VARCHAR(50),
    payment_status VARCHAR(50) CHECK (payment_status IN ('Pending', 'Confirmed', 'Cancelled', 'Refunded')),
    total_cost DECIMAL(10, 2) NOT NULL CHECK (total_cost >=0)
);
