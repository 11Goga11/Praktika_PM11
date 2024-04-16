CREATE PROCEDURE AuthenticateUser
    @login NVARCHAR(50),
    @password NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM [dbo].[Список посетителей] WHERE Логин = @login AND Пароль = @password)
    BEGIN
        -- Если пользователь найден в таблице "Список посетителей", возвращаем данные
        SELECT 'Посетитель' AS Роль, ID_Посетителя AS ID
        FROM [dbo].[Список посетителей]
        WHERE Логин = @login AND Пароль = @password;
    END
    ELSE IF EXISTS (SELECT 1 FROM [dbo].[Пользователь] WHERE Логин = @login AND Пароль = @password)
    BEGIN
        -- Если пользователь найден в таблице "Пользователь", возвращаем данные
        SELECT 'Пользователь' AS Роль, ID_Пользователя AS ID
        FROM [dbo].[Пользователь]
        WHERE Логин = @login AND Пароль = @password;
    END
    ELSE
    BEGIN
        -- Если пользователь не найден, возвращаем сообщение об ошибке
        PRINT 'Ошибка: Пользователь не найден.';
    END
END;