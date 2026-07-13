# 📊 White-Label Survey Analytics Dashboard

A lightweight survey analytics application built with **Ruby on Rails 8** that allows users to create surveys, collect responses, and visualize key performance indicators through an intuitive dashboard.

The project focuses on building a modern web application with a clean MVC structure, relational database design, and a foundation that can be extended for multi-tenant and white-label solutions.

## Features

- Dashboard with survey statistics
- CSAT (Customer Satisfaction Score) calculation
- Rating distribution (1–5 stars)
- Dynamic survey forms
- Multiple question support
- Responsive interface with Bootstrap 5
- Relational database design using Active Record associations

## Tech Stack

- Ruby on Rails 8
- PostgreSQL
- Bootstrap 5
- Active Record
- RESTful architecture

## Installation

Clone the repository:

```bash
git clone https://github.com/your-username/survey_craft.git
cd survey_craft
```

Install dependencies:

```bash
bundle install
```

Set up the database:

```bash
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
```

Start the Rails server:

```bash
bin/rails server
```

Open your browser and visit:

```
http://localhost:3000
```

## Project Structure

```
app/
├── controllers/
├── models/
├── views/
├── helpers/
├── assets/

config/
db/
public/
```

## Database

The application is built around three core models:

- Survey
- Question
- Answer

Relationships are managed using Active Record associations, ensuring data consistency through cascading deletes (`dependent: :destroy`).

## Future Improvements

- User authentication
- Survey builder
- Charts and data visualization
- Export reports
- API endpoints
- Automated tests with RSpec

## License

This project was developed as an academic exercise and is intended for educational and portfolio purposes.