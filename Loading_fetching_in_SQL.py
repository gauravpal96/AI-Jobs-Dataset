# Loading data into SQL
import pandas as pd
import pymysql
from sqlalchemy import create_engine

# Step 2: Create SQLAlchemy engine
password = "........"
encoded_password = password.replace("@", "%40")  # encode @ for URL
engine = create_engine(f"mysql+pymysql://root:{encoded_password}@127.0.0.1:3306/AI_jobs")
df = pd.read_csv(r"C:\Users\Administrator\OneDrive\Desktop\Project\ai job dataset\clean_data.csv")
df.dtypes.head()

# Step 3: Create SQL table manually (with correct column names)
create_table_query = """
CREATE TABLE IF NOT EXISTS AI_dataset (
    job_id varchar(20) primary key,
    job_title varchar(60),
    salary_usd int,
    salary_currency varchar(15),
    experience_level varchar(15),
    employment_type varchar(15),
    company_location varchar(50),
    company_size varchar(15),
    employee_residence varchar(50), 
    remote_ratio int,
    required_skills varchar(100),
    education_required varchar(50),
    years_experience int,
    industry varchar(50),
    posting_date date,
    application_deadline date,
    job_description_length int,
    benefits_score decimal(5,1),
    company_name varchar(55)
    
);
"""

# Step 4: Connect and execute table creation
conn = pymysql.connect(host="127.0.0.1", user="root", password="........", database="AI_jobs")
cursor = conn.cursor()
cursor.execute(create_table_query)
conn.commit()
conn.close()

# Step 5: Load data into MySQL table
df.to_sql(name='ai_dataset', con=engine, if_exists='append', index=False)


# Fetching the Data from SQL

password = "........"
encoded_password = password.replace("@", "%40")  # encode @ for URL
engine = create_engine(f"mysql+pymysql://root:{encoded_password}@127.0.0.1:3306/AI_jobs")
query = "select * from ai_dataset"
df1 = pd.read_sql(query, engine)


# Save Data in CSV file
df1.to_csv("ai_data.csv")