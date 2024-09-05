

# Bash Scripting 

This repository contains Bash scripts for performing a simple ETL (Extract, Transform, Load) process that are a cron job scheduled to run every day at 12:00 AM, a script that loads json and csv files into a folder as well as SQL scripts for querying a PostgreSQL database. 

---

## **Project Structure**

```bash
.
├── README.md                   # This file, the project documentation
├── Scripts/
│   ├── Bash/
│   │   ├── etl_script.sh        # ETL script to download, transform, and load CSV files
│   │   ├── move_files.sh        # Script to move CSV/JSON files to a specific folder
│   │   ├── db_scipts.sh        # Loads a csv to tables in a postgres table
│   ├── SQL/
│   │   ├── posey.sql          # SQL query file
├── diagrams/
│   ├── etl_pipeline_diagram.png  # Diagram explaining the ETL process
└── .gitignore                   # Ignores unnecessary files (e.g., CSV files, credentials)
```

---

## **ETL Process**

### **1. ETL Bash Script (`etl_script.sh`)**

The ETL script automates the following steps:

- **Extract**: Downloads a CSV file from a specified URL and saves it in a folder named `raw`.
- **Transform**: Renames a column (`Variable_code` to `variable_code`), selects relevant columns (`year`, `Value`, `Units`, `variable_code`), and saves the transformed data into a file called `2023_year_finance.csv` in the `Transformed` folder.
- **Load**: Copies the transformed CSV file into a `Gold` directory.

#### **Running the ETL Script**

1. Make the script executable:

    ```bash
    chmod +x etl_script.sh
    ```

2. Run the script:

    ```bash
    ./Scripts/Bash/etl_script.sh
    ```

### **2. Moving CSV/JSON Files (`move_files.sh`)**

This script moves all `.csv` and `.json` files from one directory to another (`json_and_CSV`).

#### **Running the Move Script**

1. Make the script executable:

    ```bash
    chmod +x move_files.sh
    ```

2. Run the script:

    ```bash
    ./Scripts/Bash/move_files.sh
    ```

### **3. Scheduling with Cron**

To schedule the ETL script to run every day at 12:00 AM:

1. Open the crontab editor:

    ```bash
    crontab -e
    ```

2. Add the following line to schedule the ETL script:

    ```bash
    0 0 * * * ./Scripts/Bash/etl_script.sh
    ```

---

## **PostgreSQL Integration**

### **Database Setup**

- **Database**: `posey`
  
### **SQL Queries**





