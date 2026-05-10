import snowflake.connector
import os

conn = snowflake.connector.connect(
    user=os.environ["SF_USER"],
    password=os.environ["SNOWFLAKE_PASSWORD"],
    account=os.environ["SF_ACCOUNT"],
    warehouse=os.environ["SF_WAREHOUSE"],
    database=os.environ["SF_DATABASE"],
    schema=os.environ["SF_SCHEMA"],
    role=os.environ["SF_ROLE"]
)

cursor = conn.cursor()

sql_files = [
    "sql/create_tables.sql",
    "sql/procedures.sql",
    "sql/tasks.sql"
]

for file in sql_files:
    print(f"Running {file}")

    with open(file, "r") as f:
        sql_commands = f.read()

    for command in sql_commands.split(";"):
        if command.strip():
            cursor.execute(command)

print("Deployment completed")

cursor.close()
conn.close()
