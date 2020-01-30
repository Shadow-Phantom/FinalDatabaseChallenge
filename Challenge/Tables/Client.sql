CREATE TABLE [dbo].[Client]
(
	[ClientNum] INT NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(25) NOT NULL,
	[Address] NVARCHAR(50) NOT NULL,
	[PCode] NVARCHAR(4) NOT NULL,
	[PassionCode] NVARCHAR(3) NOT NULL,
	CONSTRAINT [FK_Pass_Cust] FOREIGN KEY ([PassionCode]) References Special_Passion(PassionCode)
)
