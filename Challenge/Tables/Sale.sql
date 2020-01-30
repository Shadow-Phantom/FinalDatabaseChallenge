CREATE TABLE [dbo].[Sale]
(
	[ClientNum] INT NOT NULL,
	[CdID] NVARCHAR(10) NOT NULL,
	[SaleDate] DATE NOT NULL,
	[PricePaid] MONEY NOT NULL,
	CONSTRAINT [FK_Client_Sale] FOREIGN KEY ([ClientNum]) References Client(ClientNum),
	CONSTRAINT [FK_Record_Sale] FOREIGN KEY ([CdID]) References Record(CdID),
	PRIMARY KEY ([ClientNum],[CdID],[SaleDate])

)
