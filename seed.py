import sqlite3
from faker import Faker
from random import randint, choice
from datetime import datetime, timedelta

conn = sqlite3.connect("db/students.db")
cur = conn.cursor()

with open("db/schema.sql", "r") as f:
    cur.executescript(f.read())

fake = Faker()


groups = ["Group A", "Group B", "Group C"]
cur.executemany("INSERT INTO groups (name) VALUES (?)", [(g,) for g in groups])


teachers = [fake.name() for _ in range(5)]
cur.executemany("INSERT INTO teachers (fullname) VALUES (?)", [(t,) for t in teachers])

subjects = [
    "Math",
    "Biology",
    "Physics",
    "History",
    "Literature",
    "English",
    "Geography",
    "Programming",
]
cur.executemany(
    "INSERT INTO subjects (name, teacher_id) VALUES (?, ?)",
    [(subj, randint(1, len(teachers))) for subj in subjects],
)


students = [fake.name() for _ in range(50)]
cur.executemany(
    "INSERT INTO students (fullname, group_id) VALUES (?, ?)",
    [(name, randint(1, len(groups))) for name in students],
)


for student_id in range(1, 51):
    for subject_id in range(1, len(subjects) + 1):
        for _ in range(randint(10, 20)):
            grade = randint(60, 100)
            date = datetime(2023, randint(1, 12), randint(1, 28)).date()
            cur.execute(
                "INSERT INTO grades (student_id, subject_id, grade, date_of) VALUES (?, ?, ?, ?)",
                (student_id, subject_id, grade, date),
            )

conn.commit()
conn.close()
