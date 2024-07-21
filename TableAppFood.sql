--Tạo database
CREATE DATABASE food_ordering_system;

--Dùng database vừa tạo
USE food_ordering_system;

-- Tạo bảng user trong database
CREATE TABLE users(
user_id INT PRIMARY KEY AUTO_INCREMENT,
full_name VARCHAR(100),
email VARCHAR(255),
pass_word VARCHAR(255)
);
-- Thêm dữ liệu vào bảng user
INSERT INTO users (full_name, email, pass_word) VALUES
('Anna Nguyen', 'anna.n@email.com', 'securePass123'),
('Minh Tran', 'minh.t@email.com', 'strongPwd456'),
('Linh Pham', 'linh.p@email.com', 'safeWord789'),
('Duc Le', 'duc.l@email.com', 'protectedAbc'),
('Hoa Vu', 'hoa.v@email.com', 'secretXyz123'),
('Tuan Dao', 'tuan.d@email.com', 'hiddenPass987'),
('Mai Hoang', 'mai.h@email.com', 'privateKey321'),
('Son Nguyen', 'son.n@email.com', 'uniqueCode555'),
('Lan Tran', 'lan.t@email.com', 'specialPwd777'),
('Thanh Pham', 'thanh.p@email.com', 'customPass999');

SELECT * FROM users;

--Tạo bảng restaurant
CREATE table restaurant (
res_id INT PRIMARY KEY AUTO_INCREMENT,
res_name varchar(100),
image VARCHAR(255),
decs varchar(255)
);
--Thêm dữ liệu cho bảng restaurant:
INSERT INTO restaurant (res_name, image, decs) VALUES
('Pho Delights', 'pho_delights.jpg', 'Authentic Vietnamese pho and spring rolls'),
('Banh Mi Corner', 'banh_mi_corner.jpg', 'Fresh and tasty Vietnamese sandwiches'),
('Saigon Cafe', 'saigon_cafe.jpg', 'A cozy spot for Vietnamese coffee and snacks'),
('Mekong River', 'mekong_river.jpg', 'Seafood specialties from the Mekong Delta'),
('Hanoi Street Food', 'hanoi_street_food.jpg', 'Northern Vietnamese street food favorites'),
('Hue Royal Cuisine', 'hue_royal_cuisine.jpg', 'Elegant dishes from the imperial city of Hue'),
('Dalat Garden', 'dalat_garden.jpg', 'Fresh vegetables and herbs from Dalat region'),
('Nha Trang Seafood', 'nha_trang_seafood.jpg', 'Coastal flavors from central Vietnam'),
('Chopsticks & Rice', 'chopsticks_rice.jpg', 'Modern twist on traditional Vietnamese dishes'),
('Lotus Tea House', 'lotus_tea_house.jpg', 'Serene spot for Vietnamese teas and desserts');

SELECT * FROM restaurant;

--Tạo bảng like_res
create TABLE like_res(
user_id INT,
FOREIGN KEY(user_id) REFERENCES users(user_id),
res_id INT,
FOREIGN KEY(res_id) REFERENCES restaurant(res_id),
date_like DATE
);

--Thêm dữ liệu cho bảng like_res
INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 3, '2023-06-15'),
(1, 1, '2023-07-20'),
(1, 5, '2023-08-10'),
(1, 2, '2023-09-05'),
(1, 4, '2023-10-12'),
(2, 6, '2023-11-18'),
(2, 8, '2023-12-22'),
(2, 7, '2024-01-30'),
(3, 9, '2024-02-14'),
(3, 10, '2024-03-08'),
(3, 1, '2024-03-09'),
(4, 2, '2024-03-10'),
(4, 3, '2024-03-11'),
(5, 4, '2024-03-12'),
(5, 5, '2024-03-13');


SELECT * FROM like_res;

--Tạo bảng rate_res
CREATE TABLE rate_res(
user_id INT,
FOREIGN KEY (user_id) REFERENCES users(user_id),
res_id INT,
FOREIGN KEY(res_id) REFERENCES restaurant(res_id),
amount INT,
date_rate DATETIME
);

--Thêm dữ liệu cho bảng rate_res
INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 1, 4, '2023-06-01 14:30:00'),
(2, 2, 5, '2023-07-15 18:45:00'),
(3, 3, 3, '2023-08-20 12:15:00'),
(4, 4, 4, '2023-09-10 20:00:00'),
(5, 5, 5, '2023-10-25 13:30:00'),
(6, 6, 4, '2023-11-30 19:00:00'),
(7, 7, 3, '2023-12-12 17:45:00'),
(8, 8, 5, '2024-01-18 11:30:00'),
(9, 9, 4, '2024-02-22 15:15:00'),
(1, 10, 3, '2024-03-05 16:00:00');

SELECT * FROM rate_res;

--Tạo bảng food_type
CREATE TABLE food_type (
type_id INT PRIMARY KEY AUTO_INCREMENT,
type_name VARCHAR(255)
);

--Thêm dữ liệu cho bảng food_type:
INSERT INTO food_type (type_name) VALUES
('Pho'),
('Banh Mi'),
('Spring Rolls'),
('Rice Dishes'),
('Noodle Soups'),
('Stir Fry'),
('Grilled Dishes'),
('Seafood'),
('Vegetarian'),
('Desserts');

SELECT * FROM food_type;

--Tạo bảng food
CREATE TABLE food(
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(255),
	image VARCHAR(255),
	price FLOAT,
	description VARCHAR(255),
	type_id INT,
	FOREIGN KEY(type_id) REFERENCES food_type(type_id)
);

--Thêm dữ liệu cho bảng food:
INSERT INTO food (food_name, image, price, description, type_id) VALUES
('Classic Pho', 'classic_pho.jpg', 9.99, 'Traditional beef noodle soup', 1),
('Grilled Pork Banh Mi', 'pork_banh_mi.jpg', 6.99, 'Vietnamese sandwich with grilled pork', 2),
('Fresh Spring Rolls', 'fresh_spring_rolls.jpg', 5.99, 'Rice paper rolls with shrimp and herbs', 3),
('Com Tam', 'com_tam.jpg', 11.99, 'Broken rice with grilled pork chop', 4),
('Bun Bo Hue', 'bun_bo_hue.jpg', 10.99, 'Spicy beef noodle soup from Hue', 5),
('Lemongrass Chicken', 'lemongrass_chicken.jpg', 12.99, 'Stir-fried chicken with lemongrass', 6),
('Grilled Lemongrass Beef', 'grilled_beef.jpg', 13.99, 'Beef skewers with lemongrass', 7),
('Caramel Shrimp', 'caramel_shrimp.jpg', 14.99, 'Shrimp in caramel sauce', 8),
('Vegetarian Pho', 'vegetarian_pho.jpg', 9.99, 'Meat-free version of classic pho', 9),
('Che Ba Mau', 'che_ba_mau.jpg', 4.99, 'Three-color dessert with beans and jelly', 10);

SELECT * FROM food;

--Tạo bảng order:
CREATE TABLE orders( 
user_id INT, 
FOREIGN KEY (user_id) REFERENCES users(user_id),
food_id INT,
FOREIGN KEY (food_id) REFERENCES food(food_id),
amount INT, 
code VARCHAR(255), 
arr_sub_id VARCHAR(255)
);

--Thêm dữ liệu cho bảng order
INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id) VALUES
(1, 1, 2, 'ORDER001', 'SUB001'),
(1, 3, 1, 'ORDER002', 'SUB002'),
(1, 5, 3, 'ORDER003', 'SUB003'),
(2, 2, 2, 'ORDER004', 'SUB004'),
(2, 4, 1, 'ORDER005', 'SUB005'),
(3, 6, 2, 'ORDER006', 'SUB006'),
(3, 8, 1, 'ORDER007', 'SUB007'),
(4, 7, 3, 'ORDER008', 'SUB008'),
(5, 9, 2, 'ORDER009', 'SUB009'),
(6, 10, 1, 'ORDER010', 'SUB010'),
(7, 1, 2, 'ORDER011', 'SUB011'),
(8, 2, 1, 'ORDER012', 'SUB012'),
(9, 3, 3, 'ORDER013', 'SUB013');


SELECT * FROM orders;

