import logging
import random
import psycopg2

from faker import Faker
from psycopg2 import DatabaseError

fake = Faker()

# Connect to an existing database
conn = psycopg2.connect(
    dbname="postgres",
    user="postgres",
    password="wzas1212",
    host="localhost",
    port=5000  # Тут ви вказуєте порт
)
cur = conn.cursor()


# Add groups
for _ in range(3):
    cur.execute("INSERT INTO groups (name) VALUES (%s)", (fake.word(),))

# Add teachers
for _ in range(3):
    cur.execute("INSERT INTO teachers (fullname) VALUES (%s)", (fake.name(),))

# Add subjects with teachers
for teacher_id in range(1, 4):
    cur.execute("INSERT INTO subjects (name, teacher_id) VALUES (%s, %s)", (fake.word(), teacher_id,))

# Add students and their grades
for group_id in range(1, 4):
    for _ in range(10):
        cur.execute("INSERT INTO students (fullname, group_id) VALUES (%s, %s) RETURNING id",
                    (fake.name(), group_id,))
        student_id = cur.fetchone()[0]
        for subject_id in range(1, 4):
            for _ in range(3):
                cur.execute("INSERT INTO grades (student_id, subject_id, grade, grade_date) VALUES (%s, %s, %s, %s)",
                            (student_id, subject_id, random.randint(0, 100), fake.date_this_decade()))


try:
    # Save the changes
    conn.commit()
except DatabaseError as er:
    logging.error(er)
    conn.rollback()
finally:
    # Close communication with the database
    cur.close()
    conn.close()
