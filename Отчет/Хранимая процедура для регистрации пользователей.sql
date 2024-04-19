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
    @RoleID INT -- Предполагается, что есть роль пользователя (например, администратор, обычный пользователь)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @UserID INT;

    -- Вставка данных пользователя
    INSERT INTO [ХранительПРО].[dbo].[Данные пользователя] ([ФИО], [Номер телефона], [E-mail], [Дата рождения], [Данные паспорта])
    VALUES (@FullName, @PhoneNumber, @Email, @DateOfBirth, @PassportData);

    SET @UserID = SCOPE_IDENTITY(); -- Получаем ID только что вставленного пользователя

    -- Вставка учетных данных
    INSERT INTO [ХранительПРО].[dbo].[User] ([Login], [Password])
    VALUES (@Login, @Password);

    DECLARE @UserAccountID INT;
    SET @UserAccountID = SCOPE_IDENTITY(); -- Получаем ID только что вставленных учетных данных

    -- Связываем данные пользователя с учетной записью
    UPDATE [ХранительПРО].[dbo].[Данные пользователя]
    SET [№ пользователя] = @UserID
    WHERE [ID] = @UserID;

    -- Вставка данных сотрудника, если пользователь является сотрудником
    IF @EmployeeCode IS NOT NULL
    BEGIN
        INSERT INTO [ХранительПРО].[dbo].[Данные сотрудника] ([Код сотрудника])
        VALUES (@EmployeeCode);

        DECLARE @EmployeeID INT;
        SET @EmployeeID = SCOPE_IDENTITY(); -- Получаем ID только что вставленного сотрудника

        -- Связываем данные сотрудника с данными пользователя
        UPDATE [ХранительПРО].[dbo].[Данные сотрудника]
        SET [№ пользователя] = @UserID
        WHERE [ID] = @EmployeeID;

        -- Связываем данные сотрудника с отделом и подразделением
        UPDATE [ХранительПРО].[dbo].[Сотрудник]
        SET [№ отдела] = @DepartmentID,
            [№ подразделения] = @DepartmentID
        WHERE [№ сотрудника] = @EmployeeID;
    END;

    -- Вставка записи о пользователе
    INSERT INTO [ХранительПРО].[dbo].[Пользователь] ([№ пользователя], [№ учетных данных], [№ группы])
    VALUES (@UserID, @UserAccountID, @RoleID);
END;