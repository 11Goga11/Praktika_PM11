CREATE PROCEDURE AuthenticateUser
    @Login NVARCHAR(50),
    @Password NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @UserID INT;

    -- ��������� ������������� ������������ � ��������� ������� � �������
    SELECT @UserID = ID
    FROM [dbo].[User]
    WHERE Login = @Login AND Password = @Password;

    -- ���� ������������ ������, ���������� ��� ID
    IF @UserID IS NOT NULL
    BEGIN
        SELECT '�����' AS Status, @UserID AS UserID;
    END
    ELSE
    BEGIN
        -- ���� ������������ �� ������, ���������� ��������� �� ������
        SELECT '������: �������� ����� ��� ������' AS Status;
    END
END;