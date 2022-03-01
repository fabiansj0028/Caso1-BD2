SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE dbo.inlineQuery
AS
BEGIN

	SET NOCOUNT ON;
	SELECT COUNT(E.ID) as 'Entregables', C.Nombre
	FROM Entregables E,
	(
		SELECT C.*
		FROM Cantones C,
		(
			SELECT C.ID, COUNT(P.ID) as 'CantPartidos' 
			FROM Cantones C, Entregables E, Partidos P, Acciones A, Planes PL
			WHERE E.IdCanton = C.ID and E.IdAccion = A.ID AND E.IdPlan = PL.ID AND E.IdPartido = P.ID
			Group by C.ID
		) CP
		WHERE C.ID=CP.ID AND CP.CantPartidos<=(SELECT (SELECT COUNT(ID) FROM Partidos)/4)
	)C
	WHERE E.IdCanton = C.ID
	Group by C.Nombre
	
	SET NOCOUNT OFF;
END
GO
