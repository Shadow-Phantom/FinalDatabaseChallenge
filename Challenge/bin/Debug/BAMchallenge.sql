﻿/*
Deployment script for BAMchallenge

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "BAMchallenge"
:setvar DefaultFilePrefix "BAMchallenge"
:setvar DefaultDataPath "C:\Users\102909073\AppData\Local\Microsoft\VisualStudio\SSDT\challenge"
:setvar DefaultLogPath "C:\Users\102909073\AppData\Local\Microsoft\VisualStudio\SSDT\challenge"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE,
                DISABLE_BROKER 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
PRINT N'Creating [dbo].[Client]...';


GO
CREATE TABLE [dbo].[Client] (
    [ClientNum]   INT           NOT NULL,
    [Name]        NVARCHAR (25) NOT NULL,
    [Address]     NVARCHAR (50) NOT NULL,
    [PCode]       NVARCHAR (4)  NOT NULL,
    [PassionCode] NVARCHAR (3)  NOT NULL,
    PRIMARY KEY CLUSTERED ([ClientNum] ASC)
);


GO
PRINT N'Creating [dbo].[Record]...';


GO
CREATE TABLE [dbo].[Record] (
    [CdID]   NVARCHAR (10)  NOT NULL,
    [CdName] NVARCHAR (150) NOT NULL,
    [Artist] NVARCHAR (50)  NOT NULL,
    PRIMARY KEY CLUSTERED ([CdID] ASC)
);


GO
PRINT N'Creating [dbo].[Sale]...';


GO
CREATE TABLE [dbo].[Sale] (
    [ClientNum] INT           NOT NULL,
    [CdID]      NVARCHAR (10) NOT NULL,
    [SaleDate]  DATE          NOT NULL,
    [PricePaid] MONEY         NOT NULL,
    PRIMARY KEY CLUSTERED ([ClientNum] ASC, [CdID] ASC, [SaleDate] ASC)
);


GO
PRINT N'Creating [dbo].[Special_Passion]...';


GO
CREATE TABLE [dbo].[Special_Passion] (
    [PassionCode] NVARCHAR (3)  NOT NULL,
    [PassionDesc] NVARCHAR (70) NOT NULL,
    PRIMARY KEY CLUSTERED ([PassionCode] ASC)
);


GO
PRINT N'Creating [dbo].[FK_Pass_Cust]...';


GO
ALTER TABLE [dbo].[Client] WITH NOCHECK
    ADD CONSTRAINT [FK_Pass_Cust] FOREIGN KEY ([PassionCode]) REFERENCES [dbo].[Special_Passion] ([PassionCode]);


GO
PRINT N'Creating [dbo].[FK_Client_Sale]...';


GO
ALTER TABLE [dbo].[Sale] WITH NOCHECK
    ADD CONSTRAINT [FK_Client_Sale] FOREIGN KEY ([ClientNum]) REFERENCES [dbo].[Client] ([ClientNum]);


GO
PRINT N'Creating [dbo].[FK_Record_Sale]...';


GO
ALTER TABLE [dbo].[Sale] WITH NOCHECK
    ADD CONSTRAINT [FK_Record_Sale] FOREIGN KEY ([CdID]) REFERENCES [dbo].[Record] ([CdID]);


GO
PRINT N'Creating [dbo].[ADD_CUSTOMER]...';


GO
CREATE PROCEDURE [dbo].[ADD_CUSTOMER]
	@num int,
	@name NVARCHAR(25),
	@address NVARCHAR(50),
	@postCode NVARCHAR(4),
	@interest NVARCHAR(3)
AS

	BEGIN
	INSERT INTO Client(ClientNum, Name, Address, PCode, PassionCode)
		VALUES (@num, @name, @address, @postCode, @interest);
	END;
RETURN 0
GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

INSERT INTO Special_Passion (PassionCode, PassionDesc) VALUES ('RR', 'Rock and Roll')
INSERT INTO Special_Passion (PassionCode, PassionDesc) VALUES ('JA', 'Jazz')
INSERT INTO Special_Passion (PassionCode, PassionDesc) VALUES ('RB', 'Rhythm and Blues')

INSERT INTO Client (ClientNum, Name, Address, PCode, PassionCode) VALUES (123, 'Freddie Mercury', '1 Seasame Street', 3000, 'RR')
INSERT INTO Client (ClientNum, Name, Address, PCode, PassionCode) VALUES (456, 'Brian May', '10 Downing Street', 4000, 'JA')
INSERT INTO Client (ClientNum, Name, Address, PCode, PassionCode) VALUES (789, 'John Deacon', '221B Baker Street', 5000, 'RB')
INSERT INTO Client (ClientNum, Name, Address, PCode, PassionCode) VALUES (234, 'Roger Taylor', 'LG1 College Cres, Parkville', 6000, 'RR')
INSERT INTO Client (ClientNum, Name, Address, PCode, PassionCode) VALUES (567, 'Mike Grose', '1 Adelaide Avenue', 7000, 'RB')

INSERT INTO Record (CdID, CdName, Artist) VALUES ('PF003', 'The Wall', 'Pink Floyd')
INSERT INTO Record (CdID, CdName, Artist) VALUES ('IX002', 'Kick', 'INXS')
INSERT INTO Record (CdID, CdName, Artist) VALUES ('SP069', 'Never Mind the Bollocks', 'Sex Pistols')
INSERT INTO Record (CdID, CdName, Artist) VALUES ('PF002', 'The Dark Side of the Moon', 'Pink Floyd')
INSERT INTO Record (CdID, CdName, Artist) VALUES ('IX005', 'Shabooh Shoobah', 'INXS')
INSERT INTO Record (CdID, CdName, Artist) VALUES ('SP070', 'Floggin a Dead Horse', 'Sex Pistols')
INSERT INTO Record (CdID, CdName, Artist) VALUES ('PF004', 'The Endless River', 'Pink Floyd')
INSERT INTO Record (CdID, CdName, Artist) VALUES ('PF006', 'Wish You Were Here', 'Pink Floyd')
INSERT INTO Record (CdID, CdName, Artist) VALUES ('SP075', 'Agents of Anarchy', 'Sex Pistols')
INSERT INTO Record (CdID, CdName, Artist) VALUES ('PF007', 'The Division Bell', 'Pink Floyd')

INSERT INTO Sale (ClientNum, CdID, SaleDate, PricePaid) VALUES (123, 'PF003', '2019-12-01', 30.00)
INSERT INTO Sale (ClientNum, CdID, SaleDate, PricePaid) VALUES (123, 'IX002', '2019-12-01', 29.95)
INSERT INTO Sale (ClientNum, CdID, SaleDate, PricePaid) VALUES (123, 'SP069', '2019-12-02', 12.45)
INSERT INTO Sale (ClientNum, CdID, SaleDate, PricePaid) VALUES (123, 'IX002', '2019-12-05', 30.00)
INSERT INTO Sale (ClientNum, CdID, SaleDate, PricePaid) VALUES (456, 'PF002', '2019-12-01', 31.00)
INSERT INTO Sale (ClientNum, CdID, SaleDate, PricePaid) VALUES (456, 'IX005', '2019-12-03', 28.95)
INSERT INTO Sale (ClientNum, CdID, SaleDate, PricePaid) VALUES (456, 'SP070', '2019-12-06', 13.45)
INSERT INTO Sale (ClientNum, CdID, SaleDate, PricePaid) VALUES (789, 'PF004', '2019-12-02', 29.00)
INSERT INTO Sale (ClientNum, CdID, SaleDate, PricePaid) VALUES (789, 'IX002', '2019-12-05', 29.95)
INSERT INTO Sale (ClientNum, CdID, SaleDate, PricePaid) VALUES (234, 'PF006', '2019-12-01', 45.00)
INSERT INTO Sale (ClientNum, CdID, SaleDate, PricePaid) VALUES (234, 'SP075', '2019-12-04', 5.67)
INSERT INTO Sale (ClientNum, CdID, SaleDate, PricePaid) VALUES (234, 'PF007', '2019-12-03', 9.95)



GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Client] WITH CHECK CHECK CONSTRAINT [FK_Pass_Cust];

ALTER TABLE [dbo].[Sale] WITH CHECK CHECK CONSTRAINT [FK_Client_Sale];

ALTER TABLE [dbo].[Sale] WITH CHECK CHECK CONSTRAINT [FK_Record_Sale];


GO
PRINT N'Update complete.';


GO
