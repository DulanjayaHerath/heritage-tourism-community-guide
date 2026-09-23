CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    phone VARCHAR(20),
    country VARCHAR(100),
    role VARCHAR(20) NOT NULL DEFAULT 'tourist',
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT valid_user_role
        CHECK (role IN ('tourist', 'provider', 'admin'))
);

CREATE TABLE IF NOT EXISTS destinations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    location VARCHAR(200) NOT NULL,
    district VARCHAR(100),
    province VARCHAR(100),
    category VARCHAR(100),
    description TEXT,
    image_url TEXT,
    latitude DECIMAL(10, 7),
    longitude DECIMAL(10, 7),
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT valid_latitude
        CHECK (latitude BETWEEN -90 AND 90),

    CONSTRAINT valid_longitude
        CHECK (longitude BETWEEN -180 AND 180)
);

CREATE TABLE IF NOT EXISTS experiences (
    id SERIAL PRIMARY KEY,

    destination_id INTEGER REFERENCES destinations(id)
        ON DELETE SET NULL,

    title VARCHAR(200) NOT NULL,
    description TEXT,
    location VARCHAR(200),
    category VARCHAR(100),
    price DECIMAL(10, 2) NOT NULL DEFAULT 0,
    duration_hours DECIMAL(5, 2),
    max_participants INTEGER,
    image_url TEXT,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT valid_experience_price
        CHECK (price >= 0),

    CONSTRAINT valid_experience_capacity
        CHECK (max_participants IS NULL OR max_participants > 0),

    CONSTRAINT valid_experience_duration
        CHECK (duration_hours IS NULL OR duration_hours > 0)
);

CREATE TABLE IF NOT EXISTS favourites (
    id SERIAL PRIMARY KEY,

    user_id INTEGER NOT NULL REFERENCES users(id)
        ON DELETE CASCADE,

    destination_id INTEGER NOT NULL REFERENCES destinations(id)
        ON DELETE CASCADE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT unique_user_favourite
        UNIQUE (user_id, destination_id)
);

CREATE TABLE IF NOT EXISTS bookings (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    experience_id INTEGER NOT NULL REFERENCES experiences(id),
    booking_date DATE NOT NULL,
    participants INTEGER NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT valid_booking_participants
        CHECK (participants > 0),

    CONSTRAINT valid_booking_price
        CHECK (total_price >= 0),

    CONSTRAINT valid_booking_status
        CHECK (
            status IN (
                'pending',
                'confirmed',
                'cancelled',
                'completed'
            )
        )
);

CREATE INDEX IF NOT EXISTS idx_destinations_name
ON destinations(name);

CREATE INDEX IF NOT EXISTS idx_experiences_destination
ON experiences(destination_id);

CREATE INDEX IF NOT EXISTS idx_favourites_user
ON favourites(user_id);

CREATE INDEX IF NOT EXISTS idx_bookings_user
ON bookings(user_id);

CREATE INDEX IF NOT EXISTS idx_bookings_experience
ON bookings(experience_id);