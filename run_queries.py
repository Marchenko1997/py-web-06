import sqlite3

def run_query(filename):
    with sqlite3.connect("db/students.db") as conn:
        cur = conn.cursor()
        with open(filename, "r") as f:
            sql = f.read()
        cur.execute("PRAGMA foreign_keys = ON")
        cur.execute(sql)
        for row in cur.fetchall():
            print(row)

if __name__ == '__main__':
    run_query("queries/query_1.sql")            