EXEC bronze.load_bronze


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    BEGIN TRY
            PRINT '=================================================================================';
            PRINT 'Loading Bronze Layer';
            PRINT '=================================================================================';

            PRINT '---------------------------------------------------------------------------------';
            PRINT 'Loading CRM Tables';
            PRINT '----------------------------------------------------------------------------------';
    
    
            PRINT'>> Truncating Table:bronze.crm_cust_info'
            TRUNCATE TABLE bronze.crm_cust_info;
    
            PRINT'>> Inserting Data Into Table:bronze.crm_cust_info'
            BULK INSERT bronze.crm_cust_info
            FROM 'C:\Users\StanleySONGOK\OneDrive - DCBI.aero\Desktop\My projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'


            WITH (
            FORMAT='CSV',
            FIRSTROW =2,
            FIELDTERMINATOR=',',
            ROWTERMINATOR='\n',
            TABLOCK

            );


            --SELECT COUNT(*) FROM bronze.crm_cust_info



            PRINT'>> Truncating Table:bronze.crm_prd_info'
            TRUNCATE TABLE bronze.crm_prd_info;
   
           PRINT'>> Inserting Data Into Table:bronze.crm_prd_info'
           BULK INSERT bronze.crm_prd_info
            FROM 'C:\Users\StanleySONGOK\OneDrive - DCBI.aero\Desktop\My projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'

            WITH  (
                FORMAT='CSV',
                FIELDTERMINATOR=',',
                ROWTERMINATOR='\n',
                TABLOCK,
                FIRSTROW=2



            )

            --SELECT COUNT(*) FROM bronze.crm_prd_info



            PRINT'>> Truncating Table:[bronze].[crm_sales_details]'
            TRUNCATE TABLE [bronze].[crm_sales_details];
    
             PRINT'>> Inserting Data Into Table:[bronze].[crm_sales_details]'
            BULK INSERT [bronze].[crm_sales_details]
            FROM 'C:\Users\StanleySONGOK\OneDrive - DCBI.aero\Desktop\My projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'

            WITH (
            FORMAT='CSV',
            FIRSTROW=2,
            FIELDTERMINATOR=',',
            ROWTERMINATOR='\n',
            TABLOCK



            )


            --SELECT COUNT(*) FROM [bronze].[crm_sales_details]
            PRINT '---------------------------------------------------------------------------------';
            PRINT 'Loading ERP Tables';
            PRINT '----------------------------------------------------------------------------------';

            PRINT'>> Truncating Table:[bronze].[erp_cust_az12]'
            TRUNCATE TABLE [bronze].[erp_cust_az12];
    
            PRINT'>> Inserting Data Into Table:[bronze].[erp_cust_az12]'
            BULK INSERT [bronze].[erp_cust_az12]
            FROM 'C:\Users\StanleySONGOK\OneDrive - DCBI.aero\Desktop\My projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'

            WITH (
            FORMAT='CSV',
            FIRSTROW=2,
            FIELDTERMINATOR=',',
            ROWTERMINATOR='\n',
            TABLOCK

            )

            --SELECT * FROM [bronze].[erp_cust_az12]


            PRINT'>> Truncating Table:[bronze].[erp_loc_a101'
            TRUNCATE TABLE [bronze].[erp_loc_a101];
    
            PRINT'>> Inserting Data Into Table:[bronze].[erp_loc_a101'
            BULK INSERT [bronze].[erp_loc_a101]
            FROM 'C:\Users\StanleySONGOK\OneDrive - DCBI.aero\Desktop\My projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'

            WITH (
            FORMAT='CSV',
            FIRSTROW=2,
            FIELDTERMINATOR=',',
            ROWTERMINATOR='\n',
            TABLOCK


            )


            --SELECT * FROM [bronze].[erp_loc_a101];



            PRINT'>> Truncating Table:[bronze].[erp_px_cat_g1v2]'
            TRUNCATE TABLE [bronze].[erp_px_cat_g1v2];
    
            PRINT'>> Inserting Data Into Table:[bronze].[erp_loc_a101'
            BULK INSERT [bronze].[erp_px_cat_g1v2]
            FROM 'C:\Users\StanleySONGOK\OneDrive - DCBI.aero\Desktop\My projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'

            WITH (
            FORMAT='CSV',
            FIRSTROW=2,
            FIELDTERMINATOR=',',
            ROWTERMINATOR='\n',
            TABLOCK


            )
            END TRY

            BEGIN CATCH
                PRINT '======================================================='
                PRINT'ERROR OCCURED DURING LOADING BRONZE LAYER'
                PRINT'Error Message'  + ERROR_MESSAGE();
                PRINT'Error Message'  + CAST (ERROR_NUMBER()  AS NVARCHAR);
                PRINT'Error Message'  + CAST (ERROR_STATE()  AS NVARCHAR);

            END CATCH
    --SELECT * FROM  [bronze].[erp_px_cat_g1v2]

END;
