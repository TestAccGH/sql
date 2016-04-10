declare @firstDate DateTime;
set @firstDate=DATEADD(day, -30,GETDATE());

select rc.* from RegistrationClient rc join
(select distinct p1.CustomerID from Purchase p1
where p1.ProductName='Milk' and NOT EXISTS(SELECT p2.CustomerID from Purchase p2
where p2.ProductName='Sour cream' and p2.PurchaseDateTime
between
@firstDate and GETDATE() and p1.CustomerID=p2.CustomerID)) as t on t.CustomerID=rc.CustomerID;