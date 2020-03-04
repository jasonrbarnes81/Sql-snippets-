USE [C83_SavingCircles]
GO
/****** Object:  StoredProcedure [dbo].[CircleSteps_SelectActiveStep_ByCircleId]    Script Date: 3/3/2020 9:46:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[CircleSteps_SelectActiveStep_ByCircleId] @Id INT
AS

/*
---Test Code
DECLARE
		@Id int = 1
	EXECUTE dbo.CircleSteps_SelectActiveStep_ByCircleId
		@Id
*/

    BEGIN
        SELECT TOP 1 cs.[Id], 
                     [CircleId], 
                     [Step], 
                     [PayeeId], 
                     [Status], 
                     [CollectionDate], 
                     [PaymentDate], 
                     [DateCreated], 
                     [DateModified]
        FROM dbo.CircleSteps cs
             JOIN dbo.CircleStatus cst ON cs.STATUS = cst.id
        WHERE [CircleId] = @Id
              AND cst.name != 'Completed'
        ORDER BY cs.step;
    END;
