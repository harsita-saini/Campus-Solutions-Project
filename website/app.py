import os

import psycopg2
from psycopg2.extras import RealDictCursor
from dotenv import load_dotenv
from flask import Flask, render_template, request


load_dotenv()

app = Flask(__name__)


def get_connection():
    return psycopg2.connect(
        dbname=os.getenv("DB_NAME", "campus_solutions"),
        user=os.getenv("DB_USER", "postgres"),
        password=os.getenv("DB_PASSWORD"),
        host=os.getenv("DB_HOST", "localhost"),
        port=os.getenv("DB_PORT", "5432"),
    )


def load_categories():
    with get_connection() as connection:
        with connection.cursor(cursor_factory=RealDictCursor) as cursor:
            cursor.execute(
                """
                SELECT category_id, category_name
                FROM resource_categories
                ORDER BY category_name;
                """
            )
            return cursor.fetchall()


@app.route("/", methods=["GET", "POST"])
def index():
    categories = []
    results = None
    error_message = None

    selected_category = request.form.get("category_id", "")
    selected_day = request.form.get("day_of_week", "Monday")
    selected_start = request.form.get("start_time", "10:00")
    selected_end = request.form.get("end_time", "12:00")

    try:
        categories = load_categories()

        if request.method == "POST":
            if not all(
                [selected_category, selected_day, selected_start, selected_end]
            ):
                error_message = "Please complete every search field."
            elif selected_start >= selected_end:
                error_message = "The end time must be later than the start time."
            else:
                with get_connection() as connection:
                    with connection.cursor(
                        cursor_factory=RealDictCursor
                    ) as cursor:
                        cursor.execute(
                            """
                            SELECT
                                r.resource_name,
                                r.description,
                                r.room_number,
                                r.appointment_required,
                                c.category_name,
                                b.building_name,
                                b.building_code,
                                a.start_time,
                                a.end_time
                            FROM campus_resources AS r
                            JOIN resource_categories AS c
                                ON r.category_id = c.category_id
                            JOIN buildings AS b
                                ON r.building_id = b.building_id
                            JOIN availability_slots AS a
                                ON r.resource_id = a.resource_id
                            WHERE c.category_id = %s
                              AND a.day_of_week = %s
                              AND a.start_time <= %s
                              AND a.end_time >= %s
                            ORDER BY r.resource_name;
                            """,
                            (
                                selected_category,
                                selected_day,
                                selected_start,
                                selected_end,
                            ),
                        )
                        results = cursor.fetchall()
    except psycopg2.Error:
        error_message = (
            "The website could not connect to the Campus Solutions database."
            "Check the values in the .env file."
        )

    return render_template(
        "index.html",
        categories=categories,
        results=results,
        error_message=error_message,
        selected_category=selected_category,
        selected_day=selected_day,
        selected_start=selected_start,
        selected_end=selected_end,
    )


if __name__ == "__main__":
    app.run(debug=True)
