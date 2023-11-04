# Veterinary Clinic Database

This project is a database for managing a veterinary clinic's data. It allows you to store and manage information about clients, doctors, patients, cases, diagnoses, prescriptions, pharmacy inventory, receipts, and more.

## Table of Contents

- [📜 Introduction](#-introduction)
- [🛠️ Built with](#%EF%B8%8F-built-with)
- [🧰 Database Features](#-database-features)
- [📊 Database Schema](#-database-schema)
- [🚀 Installation](#-installation)
- [📝 Usage](#-usage)
- [👨‍💼 Author](#-author)
- [🤝 Contributing](#-contributing)
- [⭐️ Support](#-support)
- [📄 License](#-license)


  
## 📜 Introduction

Managing a veterinary clinic requires efficient data handling. This database schema provides a structured foundation for storing and retrieving data related to clients, patients, doctors, cases, prescriptions, and more. It's designed to help veterinary clinics streamline their operations and maintain accurate records.

## 🛠️ Built with

[MySQL](https://www.mysql.com/): A popular open-source relational database management system.

## 🧰 Database Features

- **Animal Information**: Store detailed information about animals, including species, breed, age, and owner details.
- **Medical Records**: Record and manage medical histories and treatment plans.
- **Managing Doctors**: Record and manage information about veterinarians, including their contact details, and graduation year.
- **Pharmacy Inventory**: Manage pharmacy drugs, including trade names, generic names, categories, pricing, and expiration dates.
- **Prescriptions**: Record and manage prescriptions given to patients, including the prescribing doctor and date.
- **Search and Filter**: Easily find specific animals, doctors, drugs, or prescriptions using search and filter options.

## 📊 Database Schema

The `schema.sql` file contains SQL commands for creating the tables as per the enity relationship diagram, the detailed documentation regarding the schema and entity relationships can be found in the `DESIGN.md` file.

Please refer to the `DESIGN.md` file for a comprehensive overview of the database structure, relationships, and design considerations.


  ![veterinaryclinicdb](https://github.com/MukaddasA/VeterinaryClinicDatabase/blob/main/img/veterinaryclinicdb.png)


## 🚀 Installation

To use this database schema, follow these steps:

1. **Clone this repository:**

   ```sh
   git clone https://github.com/MukaddasA/VeterinaryClinicDatabase.git

2. **Install MySQL**: If you don't already have MySQL installed, you can download and install it from the official MySQL website: [MySQL Downloads](https://dev.mysql.com/downloads/).

3. **Create a New Database**: Use your preferred method, such as a MySQL client or command-line interface, to create a new database for this project:

   ```sh
   CREATE DATABASE VeterinaryClinic;

4. **Import the schema**: Import the schema from the `schema.sql` file into your newly created database. You can do this using the following command:

   ```bash
   mysql -u your-username -p VeterinaryClinic < schema.sql
   
  Replace `your-username` with your MySQL username, `VeterinaryClinic` with the name of your database, and `schema.sql` with the path to your schema file.


5. **Customize the database**: add data, and integrate it into your application.

## 📝 Usage

The `queries.sql` file contains a set of queries typically used to insert, update, and delete records in the database. It also includes various other queries for retrieving information from the database.

## 👨‍💼 Author

Mukaddas Ahmad

[![Twitter Icon](https://img.shields.io/badge/Twitter-%40ahmaerd-blue)](https://twitter.com/ahmaerd)
[![LinkedIn Icon](https://img.shields.io/badge/LinkedIn-%20-%230077B5)](https://www.linkedin.com/in/mukaddas-ahmad-08236910a/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! If you would like to contribute to this project or report issues, please create a pull request or open an issue on the GitHub repository.

## ⭐️ Support

If you find this project useful, I'd appreciate it if you could give it a star ⭐.

## 📄 License

This project is licensed under the [MIT License](https://github.com/MukaddasA/VeterinaryClinicDatabase/blob/main/LICENSE). You are granted the freedom to use, modify, and distribute this software, subject to specific conditions. For comprehensive details, please refer to the complete license.
