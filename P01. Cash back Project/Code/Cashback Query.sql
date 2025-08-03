-- Query to calculate cashback

-- Step 1: Query the total pay amount, avergae pay amount per transaction
SELECT S.User_ID,S.KYC_Name,S.Pay_Currency,SUM(S.Pay_Amount),AVG(S.Pay_Amount) 
FROM [Settle$] S 
GROUP BY S.User_ID,S.KYC_Name,S.Pay_Currency  
ORDER BY SUM(S.Pay_Amount) DESC										

-- Step 2: Query the declined rate for each user
SELECT User_ID,KYC_Name,SUM(IIF(Status=""DECLINED"",1,0)),SUM(1),SUM(IIF(Status=""DECLINED"",1,0))/SUM(1)
FROM [Auth$] 
GROUP BY User_ID,KYC_Name 
ORDER BY User_ID ASC									

-- Step 3: Query the cashback amount for users meeting the conditions
SELECT User_ID,KYC_Name,Pay_Currency,Pay_Amount,Average_Pay_Amount,Declined_rate,Cash_back_Amount,Current_Cash_back_rate 
FROM [Check3$] 
WHERE Check_conditions=TRUE 
ORDER BY Pay_Amount DESC			