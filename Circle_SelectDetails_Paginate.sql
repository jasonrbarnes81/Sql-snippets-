USE [C83_SavingCircles]
GO
/****** Object:  StoredProcedure [dbo].[Circles_SelectDetails_Paginate]    Script Date: 3/3/2020 9:41:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[Circles_SelectDetails_Paginate] @PageIndex INT, 
                                                  @PageSize  INT
AS

/*

Declare		@PageIndex int = 0
			,@PageSize int = 4
			

Execute dbo.Circles_SelectDetails_Paginate  @PageIndex 
											,@PageSize 


*/

    BEGIN
        DECLARE @Offset INT= @PageIndex * @PageSize;
        /*
		SELECT c.id, 
               c.Name, 
               u.Id AS SchedulerId, 
               u.FirstName AS [SchedulerFirstName], 
               u.LastName AS [SchedulerLastName], 
               u.Mi, 
               u.Email, 
               u.AvatarUrl, 
               ft.Name [Frequency], 
               c.Contribution, 
               c.Participants, 
               c.StartDate, 
               c.CollectionDay, 
               c.PaymentDay, 
               cs.Name AS [CircleStatus], 
               c.Description, 
               c.Image, 
               c.Link, 
               c.DateCreated, 
               c.DateModified, 
        (
            SELECT cs.id, 
                   cs.[Step], 
                   u1.id AS [Payee.Id], 
                   u1.FirstName AS [Payee.Firstname], 
                   u1.LastName AS [Payee.LastName], 
                   u1.Mi AS [Payee.Mi], 
                   u1.Email AS [Payee.Email], 
                   u1.AvatarUrl AS [Payee.AvatarUrl], 
                   cst.Name [Status], 
                   [CollectionDate], 
                   [PaymentDate], 
                   cs.DateCreated AS StepCreatedDate, 
                   cs.DateModified AS StepModifiedDate, 
                   cst1.name AS [Contribution.Status], 
                   t.amount AS [Contribution.Amount], 
                   csc.DateCreated AS [Contribution.DateCreated], 
                   cst2.name AS [Payment.Status], 
                   t1.Amount AS [Payment.Amount], 
                   csp.DateCreated AS [Payment.DateCreated]
            FROM [C83_SavingCircles].[dbo].[CircleSteps] cs
                 LEFT JOIN dbo.users u1 ON cs.PayeeId = u1.Id
                 LEFT JOIN dbo.CircleStatus cst ON cs.STATUS = cst.Id
                 LEFT JOIN dbo.CircleStepContributions csc ON cs.id = csc.CircleStepId
                                                              AND cs.PayeeId = csc.ParticipantId
                 LEFT JOIN dbo.CircleStatus cst1 ON csc.STATUS = cst1.Id
                 LEFT JOIN dbo.Transactions t ON t.id = csc.TransactionId
                 LEFT JOIN dbo.CircleStepPayments csp ON csp.CircleStepid = cs.id
                                                         AND cs.PayeeId = csp.PayeeId
                 LEFT JOIN dbo.CircleStatus cst2 ON csp.STATUS = cst2.Id
                 LEFT JOIN dbo.Transactions t1 ON t1.id = csp.TransactionId
            WHERE cs.CircleId = c.id FOR JSON PATH
        ) AS CircleSteps, 
        (
            SELECT u2.Id AS UserId, 
                   u2.FirstName, 
                   u2.LastName, 
                   u2.Mi, 
                   u2.AvatarUrl, 
                   u2.Email, 
                   cp.[SortOrder], 
                   cp.DateCreated, 
                   cp.DateModified
            FROM [C83_SavingCircles].[dbo].[CircleParticipants] cp
                 JOIN dbo.users u2 ON cp.ParticipantId = u2.Id
            WHERE cp.CircleId = c.id
            ORDER BY cp.SortOrder FOR JSON PATH
        ) AS Participants, 
               TotalCount = COUNT(1) OVER()
        FROM [C83_SavingCircles].[dbo].[Circles] c
             LEFT JOIN dbo.Users u ON c.SchedulerId = u.Id
             LEFT JOIN dbo.FrequencyTypes ft ON c.FrequencyTypeId = ft.Id
             LEFT JOIN dbo.CircleStatus cs ON c.CircleStatusId = cs.Id
			 */
			 
         SELECT c.id, 
               c.Name, 
               u.Id AS SchedulerId, 
               u.FirstName AS [SchedulerFirstName], 
               u.LastName AS [SchedulerLastName],
			   u.Mi,
               u.Email, 
               u.AvatarUrl, 
               ft.Name [Frequency], 
               c.Contribution, 
               c.Participants, 
               c.StartDate, 
               c.CollectionDay, 
               c.PaymentDay, 
               cs.Name AS [CircleStatus], 
               c.Description, 
               c.Image, 
               c.Link, 
               c.DateCreated, 
               c.DateModified, 
        (
            SELECT cs.id,  
                   cs.[Step], 
                   u1.id AS [Payee.Id], 
                   u1.FirstName AS [Payee.Firstname], 
                   u1.LastName AS [Payee.LastName],
				   u1.Mi as [Payee.Mi],
                   u1.Email as [Payee.Email], 
                   u1.AvatarUrl as [Payee.AvatarUrl], 
                   cst.Name [Status], 
                   [CollectionDate], 
                   [PaymentDate], 
                   cs.DateCreated as StepCreatedDate, 
                   cs.DateModified as StepModifiedDate, 
                   cst1.name AS [Contribution.Status], 
                   t.amount AS [Contribution.Amount], 
                   csc.DateCreated AS [Contribution.DateCreated], 
                   cst2.name AS [Payment.Status], 
                   t1.Amount AS [Payment.Amount], 
                   csp.DateCreated AS [Payment.DateCreated]
            FROM [C83_SavingCircles].[dbo].[CircleSteps] cs
                 LEFT JOIN dbo.users u1 ON cs.PayeeId = u1.Id
                 LEFT JOIN dbo.CircleStatus cst ON cs.STATUS = cst.Id
                 LEFT JOIN dbo.CircleStepContributions csc ON cs.id = csc.CircleStepId
                                                              AND cs.PayeeId = csc.ParticipantId
                 LEFT JOIN dbo.CircleStatus cst1 ON csc.STATUS = cst1.Id
                 LEFT JOIN dbo.Transactions t ON t.id = csc.TransactionId
                 LEFT JOIN dbo.CircleStepPayments csp ON csp.CircleStepid = cs.id
                                                         AND cs.PayeeId = csp.PayeeId
                 LEFT JOIN dbo.CircleStatus cst2 ON csp.STATUS = cst2.Id
                 LEFT JOIN dbo.Transactions t1 ON t1.id = csp.TransactionId
            WHERE cs.CircleId = c.id FOR JSON PATH
        ) AS CircleSteps, 
        (
            SELECT u2.Id,  
                   u2.FirstName, 
                   u2.LastName, 
                   u2.Mi, 
                   u2.AvatarUrl, 
                   u2.Email, 
                   cp.[SortOrder], 
                   cp.DateCreated, 
                   cp.DateModified
            FROM [C83_SavingCircles].[dbo].[CircleParticipants] cp
                 JOIN dbo.users u2 ON cp.ParticipantId = u2.Id
            WHERE cp.CircleId = c.id order by cp.SortOrder FOR JSON PATH
        ) AS Participants,
		 TotalCount = COUNT(1) OVER()
        FROM [C83_SavingCircles].[dbo].[Circles] c
             LEFT JOIN dbo.Users u ON c.SchedulerId = u.Id
             LEFT JOIN dbo.FrequencyTypes ft ON c.FrequencyTypeId = ft.Id
             LEFT JOIN dbo.CircleStatus cs ON c.CircleStatusId = cs.Id
        ORDER BY C.StartDate DESC
        OFFSET @Offset ROWS FETCH NEXT @PageSize ROWS ONLY;
    END;
