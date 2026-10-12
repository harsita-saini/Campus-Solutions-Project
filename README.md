# Campus Solutions

Campus Solutions is a database-driven application that helps students find campus resources available on a selected day and time.

## Problem

Campus resource information is spread across different university websites and department pages. Students may have difficulty quickly determining which resources are available when they need them.

## Current Prototype

The current prototype allows a user to:

- Select a resource category
- Select a weekday
- Enter a start and end time
- View matching campus resources
- View the resource location and available hours

## Database Design

The PostgreSQL database currently contains five related tables:

- `resource_categories`
- `buildings`
- `campus_resources`
- `availability_slots`
- `study_space_details`

Primary keys uniquely identify records. Foreign keys connect resources with categories, buildings, availability records, and study-space details. Constraints help prevent invalid data.

## Technologies

- PostgreSQL
- pgAdmin
- Python
- Flask
- HTML
- CSS
- Git and GitHub

## Project Structure

- `database/campus_solutions_database.sql` contains the database structure and sample data.
- `website/` contains the Flask application.
- `README.md` contains the project description and setup information.

## Running the Application

1. Install PostgreSQL and Python.
2. Create a PostgreSQL database named `campus_solutions`.
3. Import `database/campus_solutions_database.sql`.
4. Open the `website` folder in Terminal.
5. Create and activate a Python virtual environment.
6. Install the packages from `requirements.txt`.
7. Copy `.env.example` to `.env`.
8. Enter the local PostgreSQL connection information in `.env`.
9. Run `python app.py`.
10. Open `http://127.0.0.1:5000`.

## Current Limitations

The prototype uses a small demonstration dataset. It does not currently include student accounts, live operating hours, maps, walking-time calculations, automatic schedule matching, or appointment booking.

## Planned Development

The project will continue to grow throughout the semester. Planned improvements include additional campus resources, improved search options, student schedules, walking-time information, testing, documentation, and interface improvements.

## Team Members

- Harshita
- Diya
- Bhargavi
- Shamim
- Aishwarya

## AI Assistance

AI tools were used for brainstorming, explanations, starter code, and debugging assistance. The team reviewed, tested, corrected, and adapted the submitted work and is responsible for the final implementation.