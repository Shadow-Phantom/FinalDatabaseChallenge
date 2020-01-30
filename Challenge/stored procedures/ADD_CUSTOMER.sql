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
