INSERT INTO destinations (
    name,
    location,
    district,
    province,
    category,
    description,
    image_url
)
VALUES

(
    'Sigiriya Rock Fortress',
    'Sigiriya, Sri Lanka',
    'Matale',
    'Central Province',
    'Historical',
    'An ancient rock fortress and UNESCO World Heritage Site known for its frescoes and remarkable architecture.',
    NULL
),

(
    'Temple of the Sacred Tooth Relic',
    'Kandy, Sri Lanka',
    'Kandy',
    'Central Province',
    'Religious',
    'A historic Buddhist temple in Kandy that houses the Sacred Tooth Relic.',
    NULL
),

(
    'Galle Fort',
    'Galle, Sri Lanka',
    'Galle',
    'Southern Province',
    'Historical',
    'A historic fortified old town reflecting Portuguese and Dutch colonial heritage.',
    NULL
),

(
    'Dambulla Cave Temple',
    'Dambulla, Sri Lanka',
    'Matale',
    'Central Province',
    'Religious',
    'A historic cave temple complex known for Buddhist murals and statues.',
    NULL
),

(
    'Polonnaruwa Ancient City',
    'Polonnaruwa, Sri Lanka',
    'Polonnaruwa',
    'North Central Province',
    'Historical',
    'An ancient Sri Lankan capital containing important archaeological monuments.',
    NULL
);

INSERT INTO experiences (
    destination_id,
    title,
    description,
    location,
    category,
    price,
    duration_hours,
    max_participants,
    image_url
)
VALUES

(
    (
        SELECT id
        FROM destinations
        WHERE name = 'Sigiriya Rock Fortress'
        LIMIT 1
    ),
    'Traditional Pottery Workshop',
    'Learn traditional Sri Lankan pottery techniques from local craftspeople.',
    'Sigiriya',
    'Craft',
    3500.00,
    2.00,
    10,
    NULL
),

(
    (
        SELECT id
        FROM destinations
        WHERE name = 'Sigiriya Rock Fortress'
        LIMIT 1
    ),
    'Sri Lankan Village Cooking',
    'Prepare traditional Sri Lankan dishes with a local family.',
    'Sigiriya',
    'Food',
    4500.00,
    3.00,
    8,
    NULL
),

(
    (
        SELECT id
        FROM destinations
        WHERE name = 'Temple of the Sacred Tooth Relic'
        LIMIT 1
    ),
    'Handloom Weaving Experience',
    'Discover traditional handloom weaving techniques with local artisans.',
    'Kandy',
    'Craft',
    3000.00,
    2.50,
    6,
    NULL
);