CREATE PROCEDURE AddVisit
    @VisitType NVARCHAR(50),
    @UserID INT,
    @VisitDate DATE,
    @AdditionalInfo NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Вставка информации о посещении
    IF @VisitType = 'Individual' -- Индивидуальное посещение
    BEGIN
        INSERT INTO [ХранительПРО].[dbo].[Индивидуальное посещение] ([Фамилия], [Имя], [Отчество], [Телефон], [E-mail], [Дата рождения], [Организация], [Примечение], [Дата], [Серия], [Номер])
        SELECT [Фамилия], [Имя], [Отчество], [Номер телефона], [E-mail], [Дата рождения], [Организация], @AdditionalInfo, @VisitDate, [Серия], [Номер]
        FROM [ХранительПРО].[dbo].[Данные пользователя]
        WHERE [ID] = @UserID;
    END
    ELSE IF @VisitType = 'Group' -- Групповое посещение
    BEGIN
        INSERT INTO [ХранительПРО].[dbo].[Групповое посещение] ([Фамилия], [Имя], [Отчество], [Телефон], [E-mail], [Организация], [Примечение], [Дата рождения], [Серия], [Номер])
        SELECT [Фамилия], [Имя], [Отчество], [Телефон], [E-mail], [Организация], @AdditionalInfo, [Дата рождения], [Серия], [Номер]
        FROM [ХранительПРО].[dbo].[Данные пользователя]
        WHERE [ID] = @UserID;
    END;
END;