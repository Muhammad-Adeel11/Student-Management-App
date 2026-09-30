# Student Management System

A simple **Student Management System** built with **Ruby on Rails**. The project allows users to manage student records, authenticate securely, generate PDF reports, send email notifications, and access student data through a REST API.

## Features

* User Authentication (Sign Up / Sign In / Sign Out)
* Student CRUD Operations

  * Create student
  * View students
  * Update student
  * Delete student
* Student Data Validation

  * Name is required
  * Email is required
  * Email must be unique
* REST API for student data
* Individual Student PDF Report
* All Students PDF Report
* Email notification after student registration
* Pagination using Kaminari
* SQLite database
* Responsive and modern UI
* Protected student pages for authenticated users

## Technologies Used

* **Ruby 4.0+**
* **Ruby on Rails 8.1+**
* **SQLite**
* **HTML**
* **CSS**
* **REST API**
* **Prawn** – PDF generation
* **Kaminari** – Pagination
* **Action Mailer** – Email notifications

## Requirements

Before running the project, install the following:

### 1. Ruby

Ruby **4.0+** is recommended.

Check your Ruby version:

```bash
ruby --version
```

### 2. RubyGems

RubyGems comes with Ruby.

Check it:

```bash
gem --version
```

### 3. Bundler

Install Bundler if it is not already installed:

```bash
gem install bundler
```

Check:

```bash
bundle --version
```

### 4. Rails

Install Rails:

```bash
gem install rails
```

Check:

```bash
rails --version
```

### 5. SQLite

SQLite is required for the database.

Check:

```bash
sqlite3 --version
```

### 6. Git

Git is required to clone the repository.

Check:

```bash
git --version
```

## Clone the Project

Clone the repository:

```bash
git clone <repository-url>
```

Go inside the project:

```bash
cd my_first_app
```

## Install Dependencies

Install all required Ruby gems from the `Gemfile`:

```bash
bundle install
```

This installs the project dependencies such as:

* Rails
* Prawn
* Kaminari
* SQLite
* Other required Rails gems

## Database Setup

Create and migrate the database:

```bash
rails db:migrate
```

This creates the required database tables.

The project uses **SQLite**, so no separate MySQL or PostgreSQL server is required.

## Email Configuration

The project uses **Gmail SMTP** for email notifications.

To enable email sending, configure your Gmail SMTP settings in:

```text
config/environments/development.rb
```

Example:

```ruby
config.action_mailer.delivery_method = :smtp

config.action_mailer.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: "gmail.com",
  user_name: "YOUR_GMAIL@gmail.com",
  password: "YOUR_APP_PASSWORD",
  authentication: "plain",
  enable_starttls: true
}
```

### Important

Do **not** upload your real Gmail password or App Password to GitHub.

For a real/public project, use environment variables or Rails credentials for email configuration.

If email is not required for testing, the rest of the application can still be used without configuring Gmail SMTP.

## Run the Project

Start the Rails server:

```bash
rails server
```

Or:

```bash
rails s
```

Open the application in your browser:

```text
http://localhost:3000
```

## First Time Usage

After starting the application:

1. Create a user account.
2. Sign in.
3. Open the Student Management System.
4. Add a student.
5. View the student list.
6. Edit or delete students.
7. Generate student PDF reports.
8. Test the REST API if required.

## Project Structure

```text
app/
├── controllers/
│   ├── students_controller.rb
│   ├── sessions_controller.rb
│   └── api/
│       └── students_controller.rb
│
├── models/
│   ├── student.rb
│   └── user.rb
│
├── views/
│   ├── students/
│   └── student_mailer/
│
└── mailers/
    └── student_mailer.rb
```

## Authentication

The application uses Rails authentication to protect student data.

Users can:

1. Create an account
2. Sign in using email and password
3. Access the Student Management System
4. Sign out

Passwords are not stored as plain text. Rails stores a secure password hash in the database.

## Student CRUD

The system follows the standard CRUD operations:

| Operation | Purpose                  |
| --------- | ------------------------ |
| Create    | Add a new student        |
| Read      | View student information |
| Update    | Edit student information |
| Delete    | Remove a student         |

Each student contains:

* ID
* Name
* Email
* Phone

## REST API

The project provides a REST API for working with student data using JSON.

### Endpoints

```text
GET    /api/students
GET    /api/students/:id
POST   /api/students
PATCH  /api/students/:id
PUT    /api/students/:id
DELETE /api/students/:id
```

Example:

```text
GET /api/students
```

returns student data in JSON format.

## PDF Reports

The application generates PDF reports using **Prawn**.

### Individual Student PDF

```text
/students/:id.pdf
```

Generates a report containing:

* ID
* Name
* Email
* Phone

### All Students PDF

```text
/students.pdf
```

Generates a PDF containing all student records.

## Email Notification

When a new student is successfully registered, Rails **Action Mailer** sends an email notification to the student's email address.

The email contains basic registration information such as:

* Student email
* Phone number
* Registration confirmation

## Pagination

The student list uses **Kaminari** for pagination.

Instead of displaying all students on one page, records are divided into multiple pages.

Example:

```text
Page 1 → Students 1–2
Page 2 → Students 3–4
Page 3 → Students 5–6
```

## Database

The project uses **SQLite** as its database.

Main tables include:

```text
users
students
sessions
```

Student information is stored in the `students` table.

User authentication information is stored in the `users` table.

Passwords are stored as secure password hashes instead of plain-text passwords.

## Application Flow

### Web Application

```text
User
  ↓
Sign In
  ↓
Authentication
  ↓
Student Management System
  ↓
Students Controller
  ↓
Student Model
  ↓
SQLite Database
```

### REST API

```text
Client
  ↓
REST API
  ↓
API Students Controller
  ↓
Student Model
  ↓
SQLite Database
  ↓
JSON Response
```

## Useful Rails Commands

Start the server:

```bash
rails server
```

Open Rails console:

```bash
rails console
```

Run migrations:

```bash
rails db:migrate
```

Check routes:

```bash
rails routes
```

Check Rails version:

```bash
rails --version
```

Install dependencies:

```bash
bundle install
```

## Learning Goals

This project was built to practice:

* Ruby on Rails fundamentals
* MVC architecture
* CRUD operations
* Database management
* Model validations
* Authentication
* REST APIs
* JSON responses
* PDF generation
* Email notifications
* Pagination
* Rails routing
* Controllers and views
* Working with Ruby gems

## Future Improvements

* Admin dashboard
* User roles and authorization
* Better API authentication
* Search and filtering
* Student profile pages
* Improved error handling
* Production database such as PostgreSQL

## Author

**Muhammad Adeel**

Computer Science Student
COMSATS University Islamabad
