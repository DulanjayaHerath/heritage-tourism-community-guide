# 🏛️ Heritage Tourism and Community Guide Platform

### Discover Hidden Heritage. Experience Local Culture. Empower Communities.

A digital tourism platform designed to promote lesser-known heritage destinations and authentic community-based tourism experiences in Sri Lanka.

The platform connects tourists with local communities, cultural attractions, traditional craftspeople, and rural entrepreneurs, creating opportunities for sustainable tourism and community economic development.

---

## 📖 Project Overview

Sri Lanka is home to a rich cultural heritage, historical landmarks, traditional villages, and diverse local communities. However, tourism activities are often concentrated around well-known destinations such as Sigiriya, Galle, and Kandy.

Many lesser-known heritage sites and rural tourism experiences receive limited digital exposure, making it difficult for tourists to discover them and for local communities to benefit from tourism.

The Heritage Tourism and Community Guide Platform aims to address this challenge by providing a centralized digital platform where tourists can discover, explore, and book authentic local experiences while directly supporting community-based tourism providers.

The system is designed to support both a mobile application and a web application through a shared backend and database.

---

## 🎯 Project Objectives

- Promote lesser-known historical and cultural destinations in Sri Lanka.
- Improve the digital visibility of rural tourism experiences.
- Connect tourists directly with local entrepreneurs and community providers.
- Support sustainable and community-based tourism.
- Provide interactive heritage maps and audio guides.
- Simplify the discovery and booking of local experiences.
- Establish trust through verified providers and authentic reviews.
- Create a scalable tourism platform accessible through mobile and web applications.

---

## ✨ Key Features

### 👤 Tourist Features

- User registration and authentication
- Discover heritage destinations
- Explore authentic local experiences
- Search and filter destinations and experiences
- View detailed destination information
- Interactive heritage maps
- Audio guides for heritage locations
- Save favourite destinations and experiences
- Book community-based tourism experiences
- View and manage bookings
- Submit verified reviews and ratings
- Manage personal profiles

### 🏡 Community Provider Features

- Provider registration and authentication
- Community provider profile management
- Submit experiences for approval
- Create and manage tourism experiences
- Upload experience images and descriptions
- Set prices and participant limits
- Manage availability
- Accept and manage bookings
- View customer reviews
- Track bookings and earnings

### 🛡️ Administrator Features

- Admin dashboard
- User management
- Community provider verification
- Heritage destination management
- Experience approval and moderation
- Booking monitoring
- Review moderation
- Report and complaint management
- Platform statistics and analytics

---

## 🌍 Community-Based Experiences

The platform aims to promote authentic experiences such as:

| Category | Examples |
|----------|----------|
| Cultural Heritage | Historical sites, ancient temples, traditional villages |
| Traditional Crafts | Pottery, weaving, wood carving, handicrafts |
| Local Cuisine | Village cooking classes, traditional meals |
| Nature & Adventure | Community-led nature trails, village walks |
| Agriculture | Traditional farming experiences, plantation visits |
| Cultural Activities | Local festivals, traditional performances |

---

## 🛠️ Technology Stack

The platform is planned around the following technologies.

| Component | Technology |
|-----------|------------|
| Mobile Application | Flutter & Dart |
| Web Application | React.js |
| Backend | Node.js & Express.js |
| Database | PostgreSQL |
| API Architecture | REST API |
| Authentication | JWT-based Authentication |
| Maps | OpenStreetMap |
| Version Control | Git & GitHub |

Additional libraries and services will be introduced as development progresses.

---

## 🏗️ System Architecture

The platform follows a shared backend architecture, allowing the mobile and web applications to access the same services and database.

```text
                   HERITAGE TOURISM PLATFORM
                              |
              +---------------+---------------+
              |                               |
       Flutter Mobile App              React Web App
              |                               |
              +---------------+---------------+
                              |
                         REST API
                              |
                    Node.js + Express
                              |
                         PostgreSQL
                              |
              +---------------+---------------+
              |               |               |
            Users         Experiences       Bookings
              |               |               |
           Reviews        Heritage Sites    Payments
```

This architecture enables users to access their accounts, bookings, and tourism information across both mobile and web platforms.

---

## 📂 Project Structure

The planned repository structure is:

```text
heritage-tourism/
│
├── mobile/
│   └── Flutter mobile application
│
├── frontend/
│   └── React web application
│
├── backend/
│   └── Node.js and Express REST API
│
├── docs/
│   └── Project documentation
│
└── README.md
```

The structure may evolve as development continues.

---

## 🚀 Development Roadmap

### Phase 1 — Project Planning
- [x] Identify the problem
- [x] Define the proposed solution
- [x] Identify target users
- [x] Select the technology stack

### Phase 2 — Mobile Application
- [ ] Flutter project setup
- [ ] Home and discovery screens
- [ ] Heritage destination details
- [ ] Experience discovery
- [ ] Search and filtering
- [ ] Favourites
- [ ] Authentication
- [ ] Booking interface
- [ ] User profile

### Phase 3 — Backend Development
- [ ] Express server setup
- [ ] REST API development
- [ ] Database integration
- [ ] Authentication and authorization
- [ ] Heritage destination management
- [ ] Experience management
- [ ] Booking management
- [ ] Reviews and ratings

### Phase 4 — Web Application
- [ ] React frontend development
- [ ] API integration
- [ ] Responsive user interface
- [ ] Provider dashboard
- [ ] Admin dashboard

### Phase 5 — Advanced Features
- [ ] Interactive heritage maps
- [ ] Audio guides
- [ ] Offline-friendly content
- [ ] Multilingual support
- [ ] Payment gateway integration
- [ ] Notifications

### Phase 6 — Testing and Deployment
- [ ] Unit testing
- [ ] API testing
- [ ] Integration testing
- [ ] User acceptance testing
- [ ] Performance optimization
- [ ] Deployment

---

## 🔮 Future Enhancements

Potential future improvements include:

- AI-powered tourism recommendations
- Personalized heritage itineraries
- Multilingual audio guides in Sinhala, Tamil, and English
- Offline heritage route navigation
- Location-based experience recommendations
- Community tourism analytics
- Digital storytelling for heritage preservation
- Integration with local tourism organizations

---

## 🌱 Expected Impact

The Heritage Tourism and Community Guide Platform aims to contribute to:

**Cultural Preservation:** Increasing awareness of lesser-known historical and cultural attractions.

**Community Empowerment:** Creating digital opportunities for rural entrepreneurs and traditional craftspeople.

**Sustainable Tourism:** Encouraging visitors to explore destinations beyond major tourism hotspots.

**Economic Development:** Supporting direct connections between tourists and local service providers.

**Digital Inclusion:** Helping small community tourism businesses establish an online presence.

---

## 📌 Project Status

🚧 **Currently Under Development**

The project is being developed incrementally, beginning with the Flutter mobile application, followed by backend integration and web application development.

Features and documentation will be updated as development progresses.

---

## 📄 License

This project is developed for educational and academic purposes.

License information will be added when finalized.