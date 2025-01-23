SQL Queries and ER Diagrams for different stages of a database.

Overview

The project aimed to optimize the database schema of a pet boarding business system, enabling efficient management of key data such as:

    Pet bookings and related information
    Pet owners' details
    Boarding schedules and service times

The system was developed using MySQL and MySQL Workbench to ensure fast and reliable data storage and retrieval, supporting a range of database operations such as booking management, report generation, and scheduling updates.
Technologies Used

    MySQL: Used as the relational database management system to store and retrieve data.
    MySQL Workbench: Used for database design, management, and visualization of the schema.
    SQL: Language used for querying and managing the data in the database.

Features

    Pet Booking Management: Efficiently stores information about pets, including breed, age, and booking status.
    Owner Information: Tracks details about pet owners, such as name, contact information, and pets under their care.
    Scheduling System: Manages pet boarding schedules, ensuring that pets are assigned to the correct boarding slots and available staff.
    Data Retrieval: Optimized queries to quickly fetch data for reports and real-time updates.

Database Schema

The database schema consists of the following key tables:

    Owners: Stores information about pet owners (e.g., name, contact info).
    Pets: Stores information about pets (e.g., pet name, breed, age).
    Bookings: Tracks pet bookings, including booking date, pet assignment, and status.
    Schedules: Manages boarding schedules, including pet assignment to specific slots and service times.

Relationships:

    One owner can have multiple pets.
    A pet can have multiple bookings, but each booking is for a single pet.
    A booking is associated with a specific schedule.
