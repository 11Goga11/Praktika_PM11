CREATE PROCEDURE RegisterUser
    @Login NVARCHAR(50),
    @Password NVARCHAR(MAX),
    @FullName NVARCHAR(50),
    @PhoneNumber NVARCHAR(50),
    @Email NVARCHAR(MAX),
    @DateOfBirth NVARCHAR(50),
    @PassportData NVARCHAR(50),
    @EmployeeCode NVARCHAR(50),
    @DepartmentID INT,
    @RoleID INT -- ��������������, ��� ���� ���� ������������ (��������, �������������, ������� ������������)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @UserID INT;

    -- ������� ������ ������������
    INSERT INTO [������������].[dbo].[������ ������������] ([���], [����� ��������], [E-mail], [���� ��������], [������ ��������])
    VALUES (@FullName, @PhoneNumber, @Email, @DateOfBirth, @PassportData);

    SET @UserID = SCOPE_IDENTITY(); -- �������� ID ������ ��� ������������ ������������

    -- ������� ������� ������
    INSERT INTO [������������].[dbo].[User] ([Login], [Password])
    VALUES (@Login, @Password);

    DECLARE @UserAccountID INT;
    SET @UserAccountID = SCOPE_IDENTITY(); -- �������� ID ������ ��� ����������� ������� ������

    -- ��������� ������ ������������ � ������� �������
    UPDATE [������������].[dbo].[������ ������������]
    SET [� ������������] = @UserID
    WHERE [ID] = @UserID;

    -- ������� ������ ����������, ���� ������������ �������� �����������
    IF @EmployeeCode IS NOT NULL
    BEGIN
        INSERT INTO [������������].[dbo].[������ ����������] ([��� ����������])
        VALUES (@EmployeeCode);

        DECLARE @EmployeeID INT;
        SET @EmployeeID = SCOPE_IDENTITY(); -- �������� ID ������ ��� ������������ ����������

        -- ��������� ������ ���������� � ������� ������������
        UPDATE [������������].[dbo].[������ ����������]
        SET [� ������������] = @UserID
        WHERE [ID] = @EmployeeID;

        -- ��������� ������ ���������� � ������� � ��������������
        UPDATE [������������].[dbo].[���������]
        SET [� ������] = @DepartmentID,
            [� �������������] = @DepartmentID
        WHERE [� ����������] = @EmployeeID;
    END;

    -- ������� ������ � ������������
    INSERT INTO [������������].[dbo].[������������] ([� ������������], [� ������� ������], [� ������])
    VALUES (@UserID, @UserAccountID, @RoleID);
END;