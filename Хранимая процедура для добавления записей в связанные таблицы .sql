CREATE PROCEDURE AddVisit
    @VisitType NVARCHAR(50),
    @UserID INT,
    @VisitDate DATE,
    @AdditionalInfo NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- ������� ���������� � ���������
    IF @VisitType = 'Individual' -- �������������� ���������
    BEGIN
        INSERT INTO [������������].[dbo].[�������������� ���������] ([�������], [���], [��������], [�������], [E-mail], [���� ��������], [�����������], [����������], [����], [�����], [�����])
        SELECT [�������], [���], [��������], [����� ��������], [E-mail], [���� ��������], [�����������], @AdditionalInfo, @VisitDate, [�����], [�����]
        FROM [������������].[dbo].[������ ������������]
        WHERE [ID] = @UserID;
    END
    ELSE IF @VisitType = 'Group' -- ��������� ���������
    BEGIN
        INSERT INTO [������������].[dbo].[��������� ���������] ([�������], [���], [��������], [�������], [E-mail], [�����������], [����������], [���� ��������], [�����], [�����])
        SELECT [�������], [���], [��������], [�������], [E-mail], [�����������], @AdditionalInfo, [���� ��������], [�����], [�����]
        FROM [������������].[dbo].[������ ������������]
        WHERE [ID] = @UserID;
    END;
END;