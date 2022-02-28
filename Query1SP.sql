
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE dbo.getEntregables
	@Canton int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT P.Nombre,
		   A.Descripcion,
		   E.Fecha,
		   E.kpivalue,
		   E.kpitype
		   FROM Entregables E
		   INNER JOIN Partidos P on E.IdPartido = P.ID
		   INNER JOIN Acciones A on E.IdAccion = A.ID
		   WHERE E.IdCanton = @Canton
		   Order by P.Nombre
		   

	SET NOCOUNT OFF;

END
GO
