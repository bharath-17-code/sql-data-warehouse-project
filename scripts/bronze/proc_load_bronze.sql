/*
"Bronze Layer Data Loading – Stored Procedure"

"This stored procedure is designed to load raw data from CSV files into the Bronze layer of the Data Warehouse.

It uses BULK INSERT to load data from source files into Bronze tables and TRUNCATE TABLE to clear existing data before each load.

Key Features:
- Loads CRM and ERP source data from CSV files.
- Truncates tables before loading fresh data.
- Uses TRY...CATCH for error handling.
- Tracks start time and end time for each table load.
- Calculates individual table loading duration in seconds.
- Calculates total Bronze layer execution time.
- Displays loading status and error details using PRINT statements.

Tables Loaded:

CRM Tables:
- bronze.crm_cust_info
- bronze.crm_prd_info
- bronze.crm_sales_details

ERP Tables:
- bronze.erp_cust_az12
- bronze.erp_loc_a101
- bronze.erp_px_cat_g1v2

Execution:
EXEC bronze.load_bronze;
*/


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME;
    DECLARE @total_start_time DATETIME, @total_end_time DATETIME;

    BEGIN TRY

        SET @total_start_time = GETDATE();

        PRINT '===============================';
        PRINT 'LOADING BRONZE STORED PROCEDURE';
        PRINT '================================';

        PRINT '$$$$$$$$$$$$$$$$$$$$';
        PRINT 'CRM TABLES';
        PRINT '$$$$$$$$$$$$$$$$$$$$';

        PRINT '--------------------------------';
        PRINT 'LOADING CRM CUSTOMER INFO';
        PRINT '--------------------------------';

        SET @start_time = GETDATE();
        PRINT 'START TIME: ' + CAST(@start_time AS VARCHAR);

        TRUNCATE TABLE bronze.crm_cust_info;

        BULK INSERT bronze.crm_cust_info
        FROM 'D:\sql-data-warehouse-project-main\sql-data-warehouse-project-main\01_datasets\source_crm\cust_info.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

        SET @end_time = GETDATE();
        PRINT 'END TIME: ' + CAST(@end_time AS VARCHAR);
        PRINT 'LOAD DURATION: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR) + ' SECONDS';
        PRINT 'CRM CUSTOMER INFO LOADED SUCCESSFULLY';

        PRINT '--------------------------------';
        PRINT 'LOADING CRM PRODUCT INFO';
        PRINT '--------------------------------';

        SET @start_time = GETDATE();
        PRINT 'START TIME: ' + CAST(@start_time AS VARCHAR);

        TRUNCATE TABLE bronze.crm_prd_info;

        BULK INSERT bronze.crm_prd_info
        FROM 'D:\sql-data-warehouse-project-main\sql-data-warehouse-project-main\01_datasets\source_crm\prd_info.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

        SET @end_time = GETDATE();
        PRINT 'END TIME: ' + CAST(@end_time AS VARCHAR);
        PRINT 'LOAD DURATION: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR) + ' SECONDS';
        PRINT 'CRM PRODUCT INFO LOADED SUCCESSFULLY';

        PRINT '--------------------------------';
        PRINT 'LOADING CRM SALES DETAILS';
        PRINT '--------------------------------';

        SET @start_time = GETDATE();
        PRINT 'START TIME: ' + CAST(@start_time AS VARCHAR);

        TRUNCATE TABLE bronze.crm_sales_details;

        BULK INSERT bronze.crm_sales_details
        FROM 'D:\sql-data-warehouse-project-main\sql-data-warehouse-project-main\01_datasets\source_crm\sales_details.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

        SET @end_time = GETDATE();
        PRINT 'END TIME: ' + CAST(@end_time AS VARCHAR);
        PRINT 'LOAD DURATION: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR) + ' SECONDS';
        PRINT 'CRM SALES DETAILS LOADED SUCCESSFULLY';

        PRINT '$$$$$$$$$$$$$$$$$$$$';
        PRINT 'ERP TABLES';
        PRINT '$$$$$$$$$$$$$$$$$$$$';

        PRINT '--------------------------------';
        PRINT 'LOADING ERP CUSTOMER AZ12';
        PRINT '--------------------------------';

        SET @start_time = GETDATE();
        PRINT 'START TIME: ' + CAST(@start_time AS VARCHAR);

        TRUNCATE TABLE bronze.erp_cust_az12;

        BULK INSERT bronze.erp_cust_az12
        FROM 'D:\sql-data-warehouse-project-main\sql-data-warehouse-project-main\01_datasets\source_erp\CUST_AZ12.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

        SET @end_time = GETDATE();
        PRINT 'END TIME: ' + CAST(@end_time AS VARCHAR);
        PRINT 'LOAD DURATION: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR) + ' SECONDS';
        PRINT 'ERP CUSTOMER AZ12 LOADED SUCCESSFULLY';

        PRINT '--------------------------------';
        PRINT 'LOADING ERP LOCATION A101';
        PRINT '--------------------------------';

        SET @start_time = GETDATE();
        PRINT 'START TIME: ' + CAST(@start_time AS VARCHAR);

        TRUNCATE TABLE bronze.erp_loc_a101;

        BULK INSERT bronze.erp_loc_a101
        FROM 'D:\sql-data-warehouse-project-main\sql-data-warehouse-project-main\01_datasets\source_erp\LOC_A101.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

        SET @end_time = GETDATE();
        PRINT 'END TIME: ' + CAST(@end_time AS VARCHAR);
        PRINT 'LOAD DURATION: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR) + ' SECONDS';
        PRINT 'ERP LOCATION A101 LOADED SUCCESSFULLY';

        PRINT '--------------------------------';
        PRINT 'LOADING ERP PRODUCT CATEGORY G1V2';
        PRINT '--------------------------------';

        SET @start_time = GETDATE();
        PRINT 'START TIME: ' + CAST(@start_time AS VARCHAR);

        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'D:\sql-data-warehouse-project-main\sql-data-warehouse-project-main\01_datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

        SET @end_time = GETDATE();
        PRINT 'END TIME: ' + CAST(@end_time AS VARCHAR);
        PRINT 'LOAD DURATION: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR) + ' SECONDS';
        PRINT 'ERP PRODUCT CATEGORY G1V2 LOADED SUCCESSFULLY';

        SET @total_end_time = GETDATE();

        PRINT '================================';
        PRINT 'BRONZE LOADING COMPLETED';
        PRINT 'TOTAL START TIME: ' + CAST(@total_start_time AS VARCHAR);
        PRINT 'TOTAL END TIME: ' + CAST(@total_end_time AS VARCHAR);
        PRINT 'TOTAL LOAD DURATION: ' +
              CAST(DATEDIFF(SECOND, @total_start_time, @total_end_time) AS VARCHAR) + ' SECONDS';
        PRINT '================================';

    END TRY

    BEGIN CATCH

        PRINT '--------------------';
        PRINT 'ERROR LOADING BRONZE DATA';
        PRINT '--------------------';
        PRINT 'ERROR MESSAGE: ' + ERROR_MESSAGE();
        PRINT 'ERROR NUMBER: ' + CAST(ERROR_NUMBER() AS VARCHAR(10));

    END CATCH
END;





