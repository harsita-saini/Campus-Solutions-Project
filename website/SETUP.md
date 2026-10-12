# Campus Solutions Website
This small Flask prototype searches the `campus_solutions` PostgreSQL database by resource category, day, start time, and end time.

## Setup

1. Copy `.env.example` to `.env`.
2. Enter the local PostgreSQL password in `.env`.
3. Create and activate a Python virtual environment.
4. Run `pip install -r requirements.txt`.
5. Run `python app.py`.
6. Open `http://127.0.0.1:5000`.

The database contains demonstration availability rather than live SDSU operating hours.
