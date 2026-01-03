/*
=============================================================
Database and Schema Initialization
=============================================================
Purpose:
    This script initializes the data warehouse environment by creating a database
    named 'DataWarehouse'. If the database already exists, it will be safely removed
    and recreated to ensure a clean setup. The script also defines three logical
    schemas—'bronze', 'silver', and 'gold'—to support the Medallion Architecture.

Important Notice:
    Executing this script will permanently delete the existing 'DataWarehouse'
    database along with all its contents, if present. Make sure appropriate backups
    are in place before running this script.
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
