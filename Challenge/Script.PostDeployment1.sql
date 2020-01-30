﻿/*
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



