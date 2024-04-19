CREATE PROCEDURE AuthenticateUser
    @Login NVARCHAR(50),
    @Password NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @UserID INT;

    -- Проверяем существование пользователя с указанным логином и паролем
    SELECT @UserID = ID
    FROM [dbo].[User]
    WHERE Login = @Login AND Password = @Password;

    -- Если пользователь найден, возвращаем его ID
    IF @UserID IS NOT NULL
    BEGIN
        SELECT 'Успех' AS Status, @UserID AS UserID;
    END
    ELSE
    BEGIN
        -- Если пользователь не найден, возвращаем сообщение об ошибке
        SELECT 'Ошибка: Неверный логин или пароль' AS Status;
    END
END;