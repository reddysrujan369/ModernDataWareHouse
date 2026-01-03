/*
===============================================================================
Stored Procedure: Bronze Layer Data Load (CSV → Bronze Schema)
===============================================================================
Purpose:
    This stored procedure is responsible for ingesting raw data from external
    CSV files into the Bronze layer of the data warehouse. It ensures a fresh
    load by truncating existing Bronze tables before inserting new records.
    Data is loaded using SQL Server's BULK INSERT mechanism.

Key Operations:
    - Clears existing data from Bronze tables
    - Loads CRM and ERP source data from CSV files
    - Tracks execution time for each table and the overall batch

Parameters:
    None
    This procedure does not accept input parameters and does not return values.

Execution:
    EXEC bronze.load_bronze;
===============================================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN
    DECLARE 
        @start_time DATETIME,
        @end_time DATETIME,
        @batch_start_time DATETIME,
        @batch_end_time DATETIME;

    BEGIN TRY
        SET @batch_start_time = GETDATE();

        PRINT '############################################################';
        PRINT '### BRONZE LAYER LOAD PROCESS STARTED';
        PRINT '############################################################';

        /* =========================
           CRM DATA LOAD
        ==========================*/
        PRINT '---------------------------- CRM SOURCE ----------------------------';

        SET @start_time = GETDATE();
        PRINT '[CRM] Resetting table: bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;

        PRINT '[CRM] Loading data into: bronze.crm_cust_info';
        BULK INSERT bronze.crm_cust_info
        FROM 'C:\mdw\source_crm\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '[CRM] Completed in ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '--------------------------------------------------------------------';

        SET @start_time = GETDATE();
        PRINT '[CRM] Resetting table: bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT '[CRM] Loading data into: bronze.crm_prd_info';
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\mdw\source_crm\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '[CRM] Completed in ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '--------------------------------------------------------------------';

        SET @start_time = GETDATE();
        PRINT '[CRM] Resetting table: bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT '[CRM] Loading data into: bronze.crm_sales_details';
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\mdw\source_crm\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '[CRM] Completed in ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '--------------------------------------------------------------------';

        /* =========================
           ERP DATA LOAD
        ==========================*/
        PRINT '---------------------------- ERP SOURCE ----------------------------';

        SET @start_time = GETDATE();
        PRINT '[ERP] Resetting table: bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;

        PRINT '[ERP] Loading data into: bronze.erp_loc_a101';
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\mdw\source_erp\loc_a101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '[ERP] Completed in ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '--------------------------------------------------------------------';

        SET @start_time = GETDATE();
        PRINT '[ERP] Resetting table: bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;

        PRINT '[ERP] Loading data into: bronze.erp_cust_az12';
        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\mdw\source_erp\cust_az12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '[ERP] Completed in ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '--------------------------------------------------------------------';

        SET @start_time = GETDATE();
        PRINT '[ERP] Resetting table: bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        PRINT '[ERP] Loading data into: bronze.erp_px_cat_g1v2';
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\mdw\source_erp\px_cat_g1v2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '[ERP] Completed in ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '--------------------------------------------------------------------';

        SET @batch_end_time = GETDATE();

        PRINT '############################################################';
        PRINT '### BRONZE LAYER LOAD COMPLETED SUCCESSFULLY';
        PRINT '### Total Execution Time: ' 
              + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
        PRINT '############################################################';
    END TRY
    BEGIN CATCH
        PRINT '############################################################';
        PRINT '### BRONZE LAYER LOAD FAILED';
        PRINT 'Error Message : ' + ERROR_MESSAGE();
        PRINT 'Error Number  : ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error State   : ' + CAST(ERROR_STATE() AS NVARCHAR);
        PRINT '############################################################';
    END CATCH
END
