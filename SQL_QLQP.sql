CREATE DATABASE QuanLyQuanPho
GO

USE QuanLyQuanPho
GO


-- Food
-- Table
-- FoodCategory
-- Account
-- Bill
-- BillInfo

CREATE TABLE TableFood
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Bàn chưa có tên',
	status NVARCHAR(100) NOT NULL DEFAULT N'Trống'	-- Trống || Có người
)
GO

CREATE TABLE Account
(
	UserName NVARCHAR(100) PRIMARY KEY,	
	DisplayName NVARCHAR(100) NOT NULL DEFAULT N'QuanPho',
	PassWord NVARCHAR(1000) NOT NULL DEFAULT 0,
	Type INT NOT NULL  DEFAULT 0 -- 1: Chủ quán && 0: Nhân viên
)
GO

CREATE TABLE FoodCategory
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên'
)
GO

CREATE TABLE Food
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
	idCategory INT NOT NULL,
	price FLOAT NOT NULL DEFAULT 0
	
	FOREIGN KEY (idCategory) REFERENCES dbo.FoodCategory(id)
)
GO

CREATE TABLE Bill
(
	id INT IDENTITY PRIMARY KEY,
	DateCheckIn DATE NOT NULL DEFAULT GETDATE(),
	DateCheckOut DATE,
	idTable INT NOT NULL,
	status INT NOT NULL DEFAULT 0 -- 1: Đã thanh toán && 0: Chưa thanh toán
	
	FOREIGN KEY (idTable) REFERENCES dbo.TableFood(id)
)
GO

CREATE TABLE BillInfo
(
	id INT IDENTITY PRIMARY KEY,
	idBill INT NOT NULL,
	idFood INT NOT NULL,
	count INT NOT NULL DEFAULT 0
	
	FOREIGN KEY (idBill) REFERENCES dbo.Bill(id),
	FOREIGN KEY (idFood) REFERENCES dbo.Food(id)
)
GO

DBCC CHECKIDENT ('dbo.TableFood', RESEED, 0)
DECLARE @i INT = 1

--thêm bàn
WHILE @i <= 10
BEGIN
	INSERT dbo.TableFood ( name)VALUES  ( N'Bàn ' + CAST(@i AS nvarchar(100)))
	SET @i = @i + 1
END
 

DELETE DBO.TableFood
SELECT * FROM DBO.TableFood

-- thêm category
INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Thức ăn nước'  -- name - nvarchar(100)
          )
INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Thức ăn khô'  
          )
INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Nước uống' )
INSERT dbo.FoodCategory
        ( name )
VALUES  ( N'Thức ăn thêm' )

-- thêm món ăn
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Phở đặc biệt', -- name - nvarchar(100)
          1, -- idCategory - int
          39000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Phở tái', 1, 35000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Phở gà ', 1, 30000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Phở bò chín', 1, 35000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Phở bò viên ', 1, 30000)

INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Phở cuốn ', 2, 30000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Phở chiên phồng ', 2, 30000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Phở chiên trứng ', 2, 30000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'chả tôm ', 2, 30000)


INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'7Up', 3, 12000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Sting', 3, 12000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Trà đá', 3, 2000)

INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Bánh phở', 4, 8000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Bò', 4, 8000)
INSERT dbo.Food
        ( name, idCategory, price )
VALUES  ( N'Bò viên', 4, 8000)

-- thêm bill
INSERT	dbo.Bill
        ( DateCheckIn ,
          DateCheckOut ,
          idTable ,
          status
        )
VALUES  ( GETDATE() , -- DateCheckIn - date
          NULL , -- DateCheckOut - date
          1 , -- idTable - int
          0  -- status - int
        )
        
INSERT	dbo.Bill
        ( DateCheckIn ,
          DateCheckOut ,
          idTable ,
          status
        )
VALUES  ( GETDATE() , -- DateCheckIn - date
          NULL , -- DateCheckOut - date
          2, -- idTable - int
          0  -- status - int
        )
INSERT	dbo.Bill
        ( DateCheckIn ,
          DateCheckOut ,
          idTable ,
          status
        )
VALUES  ( GETDATE() , -- DateCheckIn - date
          GETDATE() , -- DateCheckOut - date
          3 , -- idTable - int
          1  -- status - int
        )

-- thêm bill info
INSERT	dbo.BillInfo
        ( idBill, idFood, count )
VALUES  ( 5, -- idBill - int
          1, -- idFood - int
          2  -- count - int
          )
INSERT	dbo.BillInfo
        ( idBill, idFood, count )
VALUES  ( 5, -- idBill - int
          3, -- idFood - int
          4  -- count - int
          )
INSERT	dbo.BillInfo
        ( idBill, idFood, count )
VALUES  ( 5, -- idBill - int
          5, -- idFood - int
          1  -- count - int
          )
INSERT	dbo.BillInfo
        ( idBill, idFood, count )
VALUES  ( 6, -- idBill - int
          1, -- idFood - int
          2  -- count - int
          )
INSERT	dbo.BillInfo
        ( idBill, idFood, count )
VALUES  ( 6, -- idBill - int
          6, -- idFood - int
          2  -- count - int
          )
INSERT	dbo.BillInfo
        ( idBill, idFood, count )
VALUES  ( 7, -- idBill - int
          5, -- idFood - int
          2  -- count - int
          )         
          
GO