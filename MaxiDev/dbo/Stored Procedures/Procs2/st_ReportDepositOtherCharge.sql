﻿ /********************************************************************
<Author>Not Known</Author>
<app>Maxi WinServices CollectionReport</app>
<Description></Description>

<ChangeLog>
<log Date="15/07/2020" Author="bortega">Ticket 2072 Autogenerated Reports - Collection Report. Req:: 00197</log>
</ChangeLog>
********************************************************************/
CREATE Procedure [dbo].[st_ReportDepositOtherCharge]      
 (      
	 @StartDate Datetime,      
	 @EndDate Datetime      
 )
       
 AS

-- -----------------
 SET  TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
 SET NOCOUNT ON; 
-- -----------------

Begin try
--DECLARE @StartDate DATETIME      
--DECLARE @EndDate DATETIME      

    --SET @StartDate = '2014-12-15'
    --SET @EndDate = '2016-12-16'

 --Req:: 00197      
 SET @StartDate = dbo.RemoveTimeFromDatetime(@StartDate)      
 --SET @EndDate =dbo.RemoveTimeFromDatetime(@EndDate+1)      
 DECLARE @HourNow varchar(50)
		set @HourNow = (select CONVERT(VARCHAR(12), GETDATE(), 114) AS [HH:MI:SS:MMM(24H)])
		--set @HourNow = '02:00:00.000'
	   
		if(@HourNow >= '01:10:00' AND @HourNow < '09:00:00')
			BEGIN
				SET @EndDate =dbo.RemoveTimeFromDatetime(@EndDate) 
		   END
		ELSE
			BEGIN
				SET @EndDate =dbo.RemoveTimeFromDatetime(@EndDate+1) 
			END
 --Req:: 00197      
       
	  SELECT      
			 A.DepositDate as Entry, 
			 B.AgentCode +' '+B.AgentName Agent, 
			 A.Amount Amount,    
			 A.Notes,  
			 A.DateOfLastChange as Date,     
			 A.BankName as BankName,	
			 U.UserName,   	 	  	    
			 'Deposit' as MoveType,
			 AB.DebitOrCredit
	    FROM AgentDeposit A with(nolock)   
	    JOIN dbo.AgentBalance AB with(nolock) on A.IdAgentBalance=AB.IdAgentBalance
	    JOIN Agent B with(nolock)  on (A.IdAgent=B.IdAgent)   
	    JOIN users U with(nolock) on U.IdUser= A.EnterByIdUser
	   WHERE A.DateOfLastChange>@StartDate 
	     AND A.DateOfLastChange<@EndDate      
	     AND A.Notes NOT LIKE '%ELECTRONIC CHECK DEPOSIT%'
		 AND A.[IdAgentCollectType] != 9 -- Check
 
       UNION      

	  SELECT     
			 A.ChargeDate as Entry,
			 B.AgentCode +' '+B.AgentName Agent, 
		     A.Amount Amount,   
			 A.Notes, 	
			 A.DateOfLastChange as Date,      	  	  
			 '' as BankName,	  
			 U.UserName,   	 	        
			 'OtherCharge' as MoveType,	  
			 AB.DebitOrCredit           
	    FROM AgentOtherCharge A with(nolock)      
	    JOIN dbo.AgentBalance AB with(nolock) on A.IdAgentBalance=AB.IdAgentBalance
	    JOIN Agent B with(nolock)  on (A.IdAgent=B.IdAgent)      
	    JOIN users U with(nolock) on U.IdUser= A.EnterByIdUser
	   WHERE A.ChargeDate>@StartDate and A.ChargeDate<@EndDate  
	
	 --UNION	

-------------------Cheques
------------------------------------Cheques Individuales Pagados
--	  SELECT
--			 ck.DateOfMovement as Entry, 
--			 B.AgentCode +' '+B.AgentName Agent, 
--			 ck.Amount Amount,    
--			 'By Scanner Process, Check Number: '+  isnull(convert(varchar, ck.CheckNumber),'-')  Notes,  
--			 ck.DateStatusChange as Date,     
--			 case 
--				when IdCheckProcessorBank=1 then'Wells Fargo Sub Account' 
--				when IdCheckProcessorBank=2 then'Southside Bank, 1518801' 
--				when IdCheckProcessorBank=3 then'Bank of Texas' 
--				else ''
--			 end BankName ,	
--			 U.UserName,   	 	  	    
--			 'CHECK' as MoveType,
--			 AB.DebitOrCredit	
--	    FROM Checks ck
--	   INNER JOIN AgentBalance AB
--	      ON ck.IdCheck = ab.idtransfer
--	   INNER JOIN Agent B 
--	      ON ck.IdAgent=B.IdAgent   
--	   INNER JOIN users U 
--	      ON U.IdUser= ck.EnteredByIdUser

--	   WHERE ck.IdStatus = 30
--	     AND ab.TypeOfMovement = 'CH'
--		 AND ck.BachCode is null
--	     AND ck.DateStatusChange > @StartDate 
--	     AND ck.DateStatusChange < @EndDate  

------------------------------------Cheques cargados en bach - pagados

--       UNION	
--	  --        ---select  dbo.[fn_GetDetailNumberCheckBach] ('9babf6b6-0c28-48b1-a099-d3b77a5570a9')

--	  SELECT
--			 MAX(ck.DateOfMovement) as Entry, 
--			 MAX(B.AgentCode) +' '+MAX(B.AgentName) Agent, 
--			 SUM(ck.Amount) Amount,    
--			 dbo.[fn_GetDetailNumberCheckBach] (ck.BachCode, IdCheckProcessorBank)  Notes,  
--			 MAX(ck.DateStatusChange) as Date,     
--			 case 
--				when IdCheckProcessorBank=1 then'Wells Fargo Sub Account' 
--				when IdCheckProcessorBank=2 then'Southside Bank, 1518801' 
--				when IdCheckProcessorBank=3 then'Bank of Texas' 
--				else ''
--			 end BankName ,	
--			 MAX(U.UserName),   	 	  	    
--			 'CHECK' as MoveType,
--			 MAX(AB.DebitOrCredit)	DebitOrCredit  	  
--	    FROM Checks ck
--	   INNER JOIN AgentBalance AB
--	      ON ck.IdCheck = ab.idtransfer
--	   INNER JOIN Agent B 
--	      ON ck.IdAgent=B.IdAgent   
--	   INNER JOIN users U 
--	      ON U.IdUser= ck.EnteredByIdUser

--	   WHERE ck.IdStatus = 30
--	     AND ck.BachCode IS NOT NULL
--	     AND ab.TypeOfMovement = 'CH'
--	     AND ck.DateStatusChange > @StartDate 
--	     AND ck.DateStatusChange < @EndDate  

--	   GROUP BY BachCode, IdCheckProcessorBank

------------------------------------Cheques cargados en bach - pagados
-------------------Cheques
End try
Begin Catch    
DECLARE @ErrorMessage varchar(max)                                                                 
    Select @ErrorMessage=ERROR_MESSAGE()   
    Insert into ErrorLogForStoreProcedure (StoreProcedure,ErrorDate,ErrorMessage)Values('st_ReportDepositOtherCharge',Getdate(),@ErrorMessage)
End catch


