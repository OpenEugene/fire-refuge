-- Create a new database called 'FireRefuge'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'FireRefuge'
)
CREATE DATABASE FireRefuge
GO

-- Target the new database.
Use FireRefuge

-- Create a new table called '[Floor]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Floor]', 'U') IS NOT NULL
DROP TABLE [dbo].[Floor]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Floor]
(
    [propid] INTEGER IDENTITY(1,1),
    [account] CHAR(7),
    [maplot] CHAR(13),
    [spcl_int_code] CHAR(3),
    [extension] CHAR(3),
    [dwelling_number] INTEGER,
    [floor_key] CHAR(4),
    [heat] CHAR(35),
    [exterior_desc] CHAR(35),
    [base_area] INTEGER,
    [finish_living_area] INTEGER,
    CONSTRAINT PK_Floor_account_extension_Dwelling_number_floor_key PRIMARY KEY (account, extension, dwelling_number, floor_key)
);
GO

-- Create a new table called '[Improvement]' in schema [dbo].
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Improvement]', 'U') IS NOT NULL
DROP TABLE [dbo].[Improvement]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Improvement]
(
    [propid] INTEGER IDENTITY(1,1),
    [account] CHAR(7),
    [maplot] CHAR(13),
    [spcl_int_code] CHAR(3),
    [extension] CHAR(3),
    [dwelling_number] INTEGER,
    [bldg_type] CHAR(35),
    [phys_depreciation] INTEGER,
    [occupancy_code] CHAR(35),
    [year_built] CHAR(4),
    [roof_type] CHAR(35),
    [roof_material] CHAR(35),
    [no_bedrooms] INTEGER,
    [no_fullbaths] INTEGER,
    [no_halfbaths] INTEGER,
    [attached_garsf] INTEGER,
    [detached_garsf] INTEGER,
    [attached_carportsf] INTEGER,
    [bsmt_garsf] INTEGER,
    [fireplaces] CHAR(3),
    [driveway_sf] INTEGER,
    [grade] CHAR(35),
    [concrete_patio_sf] INTEGER,
    [pct_complete] INTEGER,
    [total_living_sqft] INTEGER,
    [total_base_sqft] INTEGER,
    [eff_year_built] CHAR(4),
    [heating_code] CHAR(35),
    CONSTRAINT PK_Improvement_account_extension_dwelling_number PRIMARY KEY  (account, extension, dwelling_number)
);
GO

-- Create a new table called '[Mbhm]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Mbhm]', 'U') IS NOT NULL
DROP TABLE [dbo].[Mbhm]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Mbhm]
(
    [propid] INTEGER IDENTITY(1,1),
    [account] CHAR(7),
    [maplot] CHAR(13),
    [spcl_int_code] CHAR(3),
    [model_year] CHAR(4),
    [make] CHAR(30),
    [model] CHAR(30),
    [xnumber] CHAR(20),
    [plate_no] CHAR(20),
    [length] INTEGER,
    [width] INTEGER,
    [quality] CHAR(10),
    [lois_nbr] CHAR(20),
    [em_number] CHAR(20),
    CONSTRAINT PK_Mbhm_account PRIMARY KEY (account)
);
GO

-- Create a new table called '[property_use]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[property_use]', 'U') IS NOT NULL
DROP TABLE [dbo].[property_use]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[property_use]
(
    [propid] INTEGER IDENTITY(1,1),
    [account] CHAR(7),
    [maplot] CHAR(13),
    [spcl_int_code] CHAR(3),
    [prop_use_app_id] INTEGER,
    [code] CHAR(5),
    [description] CHAR(50),
    CONSTRAINT PK_property_use_account_prop_use_app_id PRIMARY KEY (account, prop_use_app_id)
);
GO

-- Create a new table called '[Exemption]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Exemption]', 'U') IS NOT NULL
DROP TABLE [dbo].[Exemption]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Exemption]
(
    [propid] Integer IDENTITY(1,1),
    [account] CHAR(7),
    [maplot] CHAR(13),
    [spcl_int_code]  CHAR(3),
    [tax_year] CHAR(4),
    [exm_id] INTEGER,
    [req_app_ind] CHAR(1),
    [amt] DECIMAL(15,2),
    [description] CHAR(100),
    CONSTRAINT PK_Exemption_account_tax_year_exm_id PRIMARY KEY (account, tax_year, exm_id)
);
GO

-- Create a new table called '[tax_year]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[tax_year]', 'U') IS NOT NULL
DROP TABLE [dbo].[tax_year]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[tax_year]
(
    [propid] Integer IDENTITY(1,1),
    [account] CHAR(7),
    [maplot] CHAR(13),
    [spcl_int_code] CHAR(3),
    [tax_year] CHAR(4),
    [tca] CHAR(5),
    [land_sqft] DECIMAL(15,2),
    [land_acres] DECIMAL (10,2),
    [land_frontage_size] DECIMAL(9,2),
    [land_left_size] DECIMAL(9,2),
    [fire_acres] CHAR(10),
    [prop_class] CHAR(3),
    [stat_class] CHAR(3),
    [code_split_ind] CHAR(1),
    [mortgage_co_name] CHAR(50),
    [rmv_land_value] INTEGER,
    [rmv_imp_value] INTEGER,
    [rmv_total_value] INTEGER,
    [taxable_value] INTEGER,
    [exm_amt_reg_value] INTEGER,
    [assd_total_value] INTEGER,
    [certified_tax] DECIMAL(15,2),
    [omittd_prop_ind] CHAR(1),
    [seg_merge_flag] CHAR(15),
    [delayed_forcl_ind] CHAR(1),
    [active_ind] CHAR(1),
    [local_assd_ind] CHAR(1),
    [use_assd_ind] CHAR(1),
    [taxable_ind] CHAR(1),
    [certified_tca] CHAR(5),
    [pcm_value] CHAR(30),
    [SAVI_Value] INTEGER,
    [SAVL_Value] INTEGER,
    Fpmem CHAR(1),
    CONSTRAINT PK_tax_year_account_tax_year PRIMARY KEY (account, tax_year)
);
GO

-- Create a new table called '[Legal]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Legal]', 'U') IS NOT NULL
DROP TABLE [dbo].[Legal]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Legal]
(
    [propid] INTEGER IDENTITY(1,1),
    [account] CHAR(7),
    [maplot] CHAR(13),
    [spcl_int_code] CHAR(3),
    [legal_id] INTEGER,
    [sm_child_id] INTEGER,
    [how_to_build] CHAR(1),
    [eff_from_date] DATE,
    [eff_to_date] DATE,
    [section] CHAR(20),
    [township] CHAR(10),
    [range] CHAR(10),
    [quarter] CHAR(25),
    [subdiv_type_cd] INTEGER,
    [subdiv_type_desc] CHAR(50),
    [subdiv_name] CHAR(100),
    [subdiv_phase] CHAR(30),
    [subdiv_block] CHAR(16),
    [subdiv_lot] CHAR(24),
    [subdiv_num] CHAR(24),
    [recording_num] CHAR(30),
    CONSTRAINT PK_Legal_account_legal_id PRIMARY KEY (account, legal_id)
);
GO

-- Create a new table called '[Parties]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Parties]', 'U') IS NOT NULL
DROP TABLE [dbo].[Parties]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Parties]
(
    [propid] INTEGER IDENTITY(1,1),
    [account] CHAR(7),
    [maplot] CHAR(13),
    [spcl_int_code] CHAR(3),
    [ppi_id] INTEGER,
    [role_cd] INTEGER,
    [role_description] CHAR(50),
    [party_id] INTEGER,
    [party_subtype] CHAR(1),
    [party_name] CHAR(90),
    [addr_line1] CHAR(50),
    [addr_line2] CHAR(50),
    [addr_line3] CHAR(50),
    [city] CHAR(40),
    [prov_state] CHAR(30),
    [state_code] CHAR(2),
    [country] CHAR(30),
    [zip_code] CHAR(10),
    [city_state_zip] CHAR(50),
    [confidential_ind] CHAR(1),
    CONSTRAINT PK_Parties_account_ppid_id PRIMARY KEY (account, ppi_id)
);
GO

-- Create a new table called '[Commercial_building]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Commercial_building]', 'U') IS NOT NULL
DROP TABLE [dbo].[Commercial_building]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Commercial_building]
(
    [propid] INTEGER IDENTITY(1,1),
    [account] CHAR(7),
    [extension] CHAR(3),
    [improvement_line_number] INTEGER,
    [year_built] INTEGER,
    [eff_year_built] INTEGER,
    [use_description] CHAR(30),
    [sqft] INTEGER,
    [grade] CHAR(5),
    [floor_number] CHAR(3),
    [wall_height_ft] INTEGER,
    [occupancy_number] INTEGER,
    [occupancy_description] CHAR(60),
    [fireproof_steel_sqft] INTEGER,
    [reinforced_concrete_sqft] INTEGER,
    [fire_resistant_sqft] INTEGER,
    [wood_joist_sqft] INTEGER,
    [pole_frame_sqft] INTEGER,
    [pre_engineered_steel_sqft] INTEGER,
    CONSTRAINT PK_Commercial_building_account_extension PRIMARY KEY (account, extension)
);
GO

-- Create a new table called '[Sales]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Sales]', 'U') IS NOT NULL
DROP TABLE [dbo].[Sales]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Sales]
(
    [propid] INTEGER IDENTITY(1,1),
    [account] CHAR(7),
    [maplot] CHAR(13),
    [spcl_int_code] CHAR(3),
    [deed_transfer_no] CHAR(30),
    [deed_transfer_date] DATE,
    [recent_sale_ind] CHAR(1),
    [group_sale_desc] CHAR(10),
    [property_class] INTEGER,
    [stat_class] CHAR(3),
    [deed_type] CHAR(2),
    [reject_code] CHAR(30),
    [sale_price] INTEGER,
    [acreage] DECIMAL(10,4),
    [grantor] CHAR(36),
    [grantee] CHAR(36),
    [Sale_price_flag] CHAR(10),
    [Seqno] INTEGER,
    [Excise_no] CHAR(15),
    [ratio_codeg] CHAR(30),
    CONSTRAINT PK_Sales_account_deed_transfer_number_Deed_transfer_data PRIMARY KEY (account, deed_transfer_no, deed_transfer_date)
);
GO

-- Create a new table called '[Commercial_memo]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Commercial_memo]', 'U') IS NOT NULL
DROP TABLE [dbo].[Commercial_memo]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Commercial_memo]
(
    [propid] INTEGER IDENTITY(1,1),
    [account] CHAR(7),
    [memo_id] CHAR(4),
    [memo_line_number] INTEGER,
    [memo_text] CHAR(65),
    CONSTRAINT PK_Commercial_memo_account PRIMARY KEY (account)
);
GO

-- Create a new table called '[Account_rel]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Account_rel]', 'U') IS NOT NULL
DROP TABLE [dbo].[Account_rel]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Account_rel]
(
    [account] CHAR(7),
    [Related_acct] CHAR(7),
    CONSTRAINT PK_Account_rel_account PRIMARY KEY (account)
);
GO

-- Create a new table called '[Commercial_accessory]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Commercial_accessory]', 'U') IS NOT NULL
DROP TABLE [dbo].[Commercial_accessory]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Commercial_accessory]
(
    [propid] Integer IDENTITY(1,1),
    [account] CHAR(7),
    [extension] CHAR(3),
    [improvement_line_number] INTEGER,
    [improvement_id] CHAR(8),
    [improvement_type] CHAR(150),
    [year_built] CHAR(4),
    [eff_year_built] CHAR(4),
    [improvement_sqft] INTEGER,
    [grade] CHAR(5),
    CONSTRAINT PK_Commercial_accessory_account_extension PRIMARY KEY (account, extension)
);
GO

-- Create a new table called '[account]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[account]', 'U') IS NOT NULL
DROP TABLE [dbo].[account]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[account]
(
    [propid] Integer IDENTITY(1,1),
    [account] CHAR(7),
    [account_type] CHAR(2),
    [category] CHAR(50),
    [maplot] CHAR(13),
    [zoning] CHAR(10),
    [spcl_int_code] CHAR(3),
    [neighborhood] INTEGER,
    remarks CHAR(1000),
    effective_to_date DATE,
    situs_address_id INTEGER,
    street_number CHAR(15),
    suffix CHAR(4),
    direction CHAR(2),
    street_name CHAR(30),
    street_type CHAR(5),
    unit_type CHAR(5),
    unit_number CHAR(15),
    city CHAR(30),
    zip_code CHAR(10),
    concat_address CHAR(50),
    sr_deferred_ind CHAR(1),
    delinquent_ind CHAR(1),
    pend_seg_merg_ind CHAR(1),
    bankruptcy_ind CHAR(1),
    em_number CHAR(20),
    pend_value_chg_ind CHAR(1),
    eff_from_date DATE,
    inspection_date DATE,
    pending_annex CHAR(1),
    Abandonment_flag CHAR(1),
    Comp_seg_merge_ind CHAR(1),
    Well CHAR(1),
    Septic CHAR(1),
    Landcaping CHAR(15)
    CONSTRAINT PK_account_account PRIMARY KEY (account)
 );
GO

-- Create a new table called '[TCA_Detail]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[TCA_Detail]', 'U') IS NOT NULL
DROP TABLE [dbo].[TCA_Detail]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[TCA_Detail]
(
    [tax_year] INTEGER,
    [tca_number] CHAR(10),
    [description] CHAR(30),
    [code_table_cd] CHAR(20),
    [code_description] CHAR(40),
    [levy_number] CHAR(10),
    [levy_name] CHAR(50),
    [levy_rate] DECIMAL(20,10),
    [district_name] CHAR(50),
    [district_id] INTEGER,
    [fp_tca] CHAR(10)
);
GO

-- Create a new table called '[Neighborhood]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Neighborhood]', 'U') IS NOT NULL
DROP TABLE [dbo].[Neighborhood]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Neighborhood]
(
    -- Should neighborhood be a primary key?
    [neighborhood] INTEGER,
    [description] CHAR(30),
);
GO

-- Create a new table called '[Stat_Class]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Stat_Class]', 'U') IS NOT NULL
DROP TABLE [dbo].[Stat_Class]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Stat_Class]
(
    -- Should code be a primary key?
    [code] INTEGER,
    [description] CHAR(30),
);
GO

-- Set up "account" foreign key constraints.
-- Improvement table.
ALTER TABLE [dbo].[Improvement]
    ADD CONSTRAINT FK_Improvement_Account FOREIGN KEY (account)
    REFERENCES [dbo].[account] (account)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Mbhm table.
ALTER TABLE [dbo].[Mbhm]
    ADD CONSTRAINT FK_Mbhm_Account FOREIGN KEY (account)
    REFERENCES [dbo].[account] (account)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- property_use table.
ALTER TABLE [dbo].[property_use]
    ADD CONSTRAINT FK_property_use_Account FOREIGN KEY (account)
    REFERENCES [dbo].[account] (account)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- tax_year table.
ALTER TABLE [dbo].[tax_year]
    ADD CONSTRAINT FK_tax_year_Account FOREIGN KEY (account)
    REFERENCES [dbo].[account] (account)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Sales table.
ALTER TABLE [dbo].[Sales]
    ADD CONSTRAINT FK_Sales_Account FOREIGN KEY (account)
    REFERENCES [dbo].[account] (account)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Commercial_memo table.
ALTER TABLE [dbo].[Commercial_memo]
    ADD CONSTRAINT FK_Commercial_memo_Account FOREIGN KEY (account)
    REFERENCES [dbo].[account] (account)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Account_rel table.
ALTER TABLE [dbo].[Account_rel]
    ADD CONSTRAINT FK_Account_rel_Account FOREIGN KEY (account)
    REFERENCES [dbo].[account] (account)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Commercial_accessory table.
ALTER TABLE [dbo].[Commercial_accessory]
    ADD CONSTRAINT FK_Commercial_accessory_Account FOREIGN KEY (account)
    REFERENCES [dbo].[account] (account)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Commercial_building table.
ALTER TABLE [dbo].[Commercial_building]
    ADD CONSTRAINT FK_Commercial_building_Account FOREIGN KEY (account)
    REFERENCES [dbo].[account] (account)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Parties table.
ALTER TABLE [dbo].[Parties]
    ADD CONSTRAINT FK_Parties_Account FOREIGN KEY (account)
    REFERENCES [dbo].[account] (account)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Legal table.
ALTER TABLE [dbo].[Legal]
    ADD CONSTRAINT FK_Legal_Account FOREIGN KEY (account)
    REFERENCES [dbo].[account] (account)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Set up the rest of the foreign key constraints.
-- Floor referencing Improvement.
ALTER TABLE [dbo].[Floor]
    ADD CONSTRAINT FK_Floor_Improvement FOREIGN KEY (account, extension, dwelling_number)
    REFERENCES [dbo].[Improvement] (account, extension, dwelling_number)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Exemption referencing tax_year.
ALTER TABLE [dbo].[Exemption]
    ADD CONSTRAINT FK_Exemption_tax_year FOREIGN KEY (account, tax_year)
    REFERENCES [dbo].[tax_year] (account, tax_year)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
