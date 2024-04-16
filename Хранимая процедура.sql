CREATE PROCEDURE AuthenticateUser
    @login NVARCHAR(50),
    @password NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM [dbo].[������ �����������] WHERE ����� = @login AND ������ = @password)
    BEGIN
        -- ���� ������������ ������ � ������� "������ �����������", ���������� ������
        SELECT '����������' AS ����, ID_���������� AS ID
        FROM [dbo].[������ �����������]
        WHERE ����� = @login AND ������ = @password;
    END
    ELSE IF EXISTS (SELECT 1 FROM [dbo].[������������] WHERE ����� = @login AND ������ = @password)
    BEGIN
        -- ���� ������������ ������ � ������� "������������", ���������� ������
        SELECT '������������' AS ����, ID_������������ AS ID
        FROM [dbo].[������������]
        WHERE ����� = @login AND ������ = @password;
    END
    ELSE
    BEGIN
        -- ���� ������������ �� ������, ���������� ��������� �� ������
        PRINT '������: ������������ �� ������.';
    END
END;