create database RetailSales;
use RetailSales;
create table Products(Product_ID INT primary key, ProductName varchar(100), Category varchar(50),
                        Price int);
                        insert into Products(Product_ID,ProductName,Category,Price)
                        values(101,'Wireless Mouse','Electronics',20),
							 (102,'Keyboard','Electronics',30),
                             (103,'Office Chair','Furniture',120),
                             (104,'Water Bottle','Home&Kitchen',10),
                             (105,'Yoga Mat','Sports',25),
                             (106,'Smartphone','Electronics',300),
                             (107,'Laptop','Electronics',1000),
                             (108,'Desk Lamp','Home&Kitchen',40),
                             (109,'Treadmill','Sports',800),
                             (110,'Coffee Maker','Home&Kitchen',150);
 create table Customers (Customer_ID int primary key, FirstName varchar(100), LastName varchar(100),
						Email varchar(100), Country varchar(100), SignupDate date); 
                        insert into Customers( Customer_ID,FirstName,LastName,Email,Country,SignupDate)
                        values(1,'John','Doe','john.doe@gmail.com','USA','2023-01-15'),
                              (2,'Jane', 'Smith','jane.smith@yahoo.com','Canada','2023-03-20'),
                              (3,'Alice','Johnson','alice.j@gmail.com','UK','2023-02-10'),
                              (4,'Bob','Brown','bob.b@gmail.com','Australia','2023-04-05'),
                              (5,'Emma','Davis','emma.davis@outlook.com','USA','2023-01-30'),
                              (6,'Michael','Wilson','michael.wilson@gmail.com','Germany','2023-05-01'),
                              (7,'Sarah','Lee','sarah.lee@gmail.com','India','2023-06-12'),
                              (8,'Chris','Taylor','chris.taylor@gmail.com','USA','2023-07-08'),
                              (9,'Olivia','Martinez','olivia.martinez@gmail.com','Spain','2023-08-20'),
                              (10,'Liam','Anderson','liam.anderson@gmail.com','Canada','2023-09-10');
                              drop table Inventory;
                              drop table OrderDetails;
                              drop table Orders;
                              drop table Customers;
 Create table Orders ( Order_ID int primary key, Customer_ID int, foreign key (Customer_ID) references Customers(Customer_ID),
					 OrderDate date, TotalAmount int);
                     insert into Orders(Order_ID,Customer_ID,OrderDate,TotalAmount)
                     values(201,1,'2023-05-01',350.00),
						   (202,2,'2023-05-03',60.00),
                           (203,3,'2023-05-05',130.00),
                           (204,4,'2023-05-10',30.00),
                           (205,5,'2023-05-12',320.00),
                           (206,6,'2023-06-01',100.00),
                           (207,7,'2023-06-15',150.00),
                           (208,8,'2023-07-20',950.00),
                           (209,9,'2023-08-25',1100.00),
                           (210,10,'2023-09-15',400.00);
 create table OrderDetails ( OrderDetail_ID int primary key, Order_ID int , foreign key (Order_ID) references Orders(Order_ID),
                            Product_ID int, foreign key (Product_ID) references Products(Product_ID), Quantity int, PricePerUnit int);
                            insert into OrderDetails(OrderDetail_ID,Order_ID,Product_ID,Quantity,PricePerUnit)
                             values(301,201,106,1,300),
								 (302,201,101,2,20),
                                 (303,202,104,3,10),
                                 (304,202,105,1,25),
                                 (305,203,103,1,120),
                                 (306,203,102,1,30),
                                 (307,204,104,3,10),
                                 (308,205,106,1,300),
                                 (309,205,101,1,20),
                                 (310,206,105,4,25),
                                 (311,207,107,1,1000),
                                 (312,208,107,1,1000),
                                 (313,208,109,1,800),
                                 (314,209,109,1,800),
                                 (315,209,110,2,150);
 create table Inventory(Product_ID INT primary key, foreign key (Product_ID) references Products(Product_ID), StockQuantity int);
                    insert into Inventory(Product_ID,StockQuantity)
                    value(101,50),
                         (102,35),
                         (103,15),
                         (104,100),
                         (105,60),
                         (106,20),
                         (107,10),
                         (108,25),
                         (109,5),
                         (110,8);
   select Category,sum(OrderDetails.Quantity*OrderDetails.PricePerUnit) as Revenue
   from OrderDetails join Products on OrderDetails.Product_ID=Products.Product_ID
   group by Category;
   select ProductName, sum(OrderDetails.Quantity)as TotalSold
   from OrderDetails join Products on OrderDetails.Product_ID=Products.Product_ID
   group by ProductName order by TotalSold desc limit 5;
   select Customers.Customer_ID,Customers.FirstName,Customers.LastName,
   sum(Orders.TotalAmount)as TotalSpent from Orders join Customers
   on Orders.Customer_ID=Customers.Customer_ID
   group by Customers.Customer_ID,Customers.FirstName,Customers.LastName
   order by TotalSpent desc limit 5;
   select ProductName,StockQuantity from Inventory
   join Products on Inventory.Product_ID=Products.Product_ID
   where StockQuantity<10;
                    