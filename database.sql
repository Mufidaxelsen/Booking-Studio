-- ==========================================
-- 1. QUERY STRUKTUR TABEL / DDL
-- ==========================================
CREATE DATABASE IF NOT EXISTS studio_musik_db;
USE studio_musik_db;

DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS booking_details;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS studios;
DROP TABLE IF EXISTS user_profiles;
DROP TABLE IF EXISTS users;

-- TABEL USERS
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'user') DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

-- TABEL USER_PROFILES
-- Relasi 1:1 ke tabel users via user_id (Constraint UNIQUE menjamin 1:1)
CREATE TABLE user_profiles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    address TEXT,
    bio TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE);

-- TABEL STUDIOS
CREATE TABLE studios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_studio VARCHAR(50) NOT NULL,
    tipe_studio VARCHAR(30) NOT NULL,
    harga_per_jam DECIMAL(10,2) NOT NULL,
    deskripsi TEXT);

-- TABEL BOOKINGS
-- Relasi 1:N ke users (user_id) dan 1:N ke studios (studio_id)
CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    studio_id INT NOT NULL,
    tanggal_booking DATE NOT NULL,
    total_harga DECIMAL(10,2) DEFAULT 0.00,
    status_booking ENUM('pending', 'confirmed', 'cancelled') DEFAULT 'pending',
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (studio_id) REFERENCES studios(id));

-- TABEL BOOKING_DETAILS
-- Relasi 1:N ke bookings (booking_id) dengan ON DELETE CASCADE
CREATE TABLE booking_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    jam_mulai TIME NOT NULL,
    jam_selesai TIME NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES bookings(id) ON DELETE CASCADE);

-- TABEL PAYMENTS
-- Relasi 1:1 ke bookings via booking_id (Constraint UNIQUE)
CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT UNIQUE NOT NULL,
    metode_pembayaran VARCHAR(30) NOT NULL,
    tanggal_bayar TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status_pembayaran ENUM('belum_bayar', 'lunas') DEFAULT 'belum_bayar',
    FOREIGN KEY (booking_id) REFERENCES bookings(id));

-- PENGISIAN DATA AWAL (MINIMAL 20 RECORDS)

INSERT INTO users (id, name, email, password, role) VALUES
(1, 'Rian Admin', 'admin@studio.com', 'password123', 'admin'),
(2, 'Budi Musisi', 'budi@gmail.com', 'password123', 'user'),
(3, 'Andi Jamming', 'andi@gmail.com', 'password123', 'user'),
(4, 'Siti Vocal', 'siti@gmail.com', 'password123', 'user'),
(5, 'Dewi Drum', 'dewi@gmail.com', 'password123', 'user'),
(6, 'Eko Bass', 'eko@gmail.com', 'password123', 'user'),
(7, 'Fajar Gitar', 'fajar@gmail.com', 'password123', 'user'),
(8, 'Gita Key', 'gita@gmail.com', 'password123', 'user'),
(9, 'Heri Rock', 'heri@gmail.com', 'password123', 'user'),
(10, 'Iwan Jazz', 'iwan@gmail.com', 'password123', 'user'),
(11, 'Joko Pop', 'joko@gmail.com', 'password123', 'user'),
(12, 'Kevin Blues', 'kevin@gmail.com', 'password123', 'user'),
(13, 'Lani Metal', 'lani@gmail.com', 'password123', 'user'),
(14, 'Miko Punk', 'miko@gmail.com', 'password123', 'user'),
(15, 'Nina Indie', 'nina@gmail.com', 'password123', 'user'),
(16, 'Oki Ska', 'oki@gmail.com', 'password123', 'user'),
(17, 'Putra Reggae', 'putra@gmail.com', 'password123', 'user'),
(18, 'Rina R&B', 'rina@gmail.com', 'password123', 'user'),
(19, 'Soni Funk', 'soni@gmail.com', 'password123', 'user'),
(20, 'Tio Soul', 'tio@gmail.com', 'password123', 'user');

INSERT INTO user_profiles (user_id, phone_number, address, bio) VALUES
(1, '081234567890', 'Studio Office Tk.1', 'Admin Utama'),
(2, '081234567891', 'Jl. Pemuda No. 2', 'Gitaris kamar'),
(3, '081234567892', 'Jl. Merdeka No. 5', 'Suka jamming akhir pekan'),
(4, '081234567893', 'Jl. Melati No. 12', 'Vokalis indie'),
(5, '081234567894', 'Jl. Mawar No. 4', 'Drummer metal'),
(6, '081234567895', 'Jl. Kenanga No. 8', 'Bass player'),
(7, '081234567896', 'Jl. Dahlia No. 10', 'Suka lagu classic rock'),
(8, '081234567897', 'Jl. Anggrek No. 3', 'Keyboardist pop'),
(9, '081234567898', 'Jl. Cempaka No. 7', 'Anak band kampus'),
(10, '081234567899', 'Jl. Kamboja No. 9', 'Pecinta musik jazz'),
(11, '081234567800', 'Jl. Melati No. 14', 'Singer songwriter'),
(12, '081234567801', 'Jl. Veteran No. 22', 'Bluesman'),
(13, '081234567802', 'Jl. Pahlawan No. 1', 'Trash metal head'),
(14, '081234567803', 'Jl. Sudirman No. 45', 'Punk rock never die'),
(15, '081234567804', 'Jl. Gatot Subroto', 'Kolektor vinyl'),
(16, '081234567805', 'Jl. Rasuna Said', 'Ska revivalist'),
(17, '081234567806', 'Jl. HOS Cokro', 'Reggae vibes'),
(18, '081234567807', 'Jl. Imam Bonjol', 'R&B enthusiast'),
(19, '081234567808', 'Jl. Diponegoro', 'Groovy bassist'),
(20, '081234567809', 'Jl. Kartini No. 88', 'Soul singer');

INSERT INTO studios (id, nama_studio, tipe_studio, harga_per_jam, deskripsi) VALUES
(1, 'Studio Rock A', 'Reguler', 50000.00, 'Cocok untuk latihan band standar'),
(2, 'Studio Pop B', 'Reguler', 60000.00, 'Dilengkapi keyboard dan AC dingin'),
(3, 'Studio VIP Heavy', 'VIP', 100000.00, 'Alat kelas premium dan soundproof tebal'),
(4, 'Studio VIP Jazz', 'VIP', 120000.00, 'Dilengkapi Grand Piano akustik'),
(5, 'Studio VVIP Live', 'VVIP', 250000.00, 'Bisa langsung untuk rekaman live multitrack');

INSERT INTO bookings (id, user_id, studio_id, tanggal_booking, total_harga, status_booking) VALUES
(1, 2, 1, CURDATE(), 50000.00, 'confirmed'),
(2, 3, 2, CURDATE(), 120000.00, 'confirmed'),
(3, 4, 3, CURDATE(), 100000.00, 'confirmed'),
(4, 5, 4, CURDATE(), 120000.00, 'pending'),
(5, 6, 5, CURDATE(), 500000.00, 'confirmed'),
(6, 7, 1, CURDATE() + INTERVAL 1 DAY, 100000.00, 'confirmed'),
(7, 8, 2, CURDATE() + INTERVAL 1 DAY, 60000.00, 'pending'),
(8, 9, 3, CURDATE() + INTERVAL 1 DAY, 200000.00, 'confirmed'),
(9, 10, 4, CURDATE() + INTERVAL 1 DAY, 120000.00, 'cancelled'),
(10, 11, 5, CURDATE() + INTERVAL 2 DAY, 250000.00, 'confirmed'),
(11, 12, 1, CURDATE() + INTERVAL 2 DAY, 50000.00, 'confirmed'),
(12, 13, 2, CURDATE() + INTERVAL 2 DAY, 120000.00, 'confirmed'),
(13, 14, 3, CURDATE() + INTERVAL 3 DAY, 100000.00, 'pending'),
(14, 15, 4, CURDATE() + INTERVAL 3 DAY, 240000.00, 'confirmed'),
(15, 16, 5, CURDATE() + INTERVAL 3 DAY, 500000.00, 'confirmed'),
(16, 17, 1, CURDATE() + INTERVAL 4 DAY, 50000.00, 'confirmed'),
(17, 18, 2, CURDATE() + INTERVAL 4 DAY, 60000.00, 'confirmed'),
(18, 19, 3, CURDATE() + INTERVAL 4 DAY, 300000.00, 'confirmed'),
(19, 20, 4, CURDATE() + INTERVAL 5 DAY, 120000.00, 'pending'),
(20, 2, 5, CURDATE() + INTERVAL 5 DAY, 250000.00, 'confirmed');

INSERT INTO booking_details (booking_id, jam_mulai, jam_selesai, subtotal) VALUES
(1, '10:00:00', '11:00:00', 50000.00),
(2, '13:00:00', '15:00:00', 120000.00),
(3, '16:00:00', '17:00:00', 100000.00),
(4, '19:00:00', '20:00:00', 120000.00),
(5, '14:00:00', '16:00:00', 500000.00),
(6, '09:00:00', '11:00:00', 100000.00),
(7, '11:00:00', '12:00:00', 60000.00),
(8, '13:00:00', '15:00:00', 200000.00),
(9, '15:00:00', '16:00:00', 120000.00),
(10, '18:00:00', '19:00:00', 250000.00),
(11, '10:00:00', '11:00:00', 50000.00),
(12, '11:00:00', '13:00:00', 120000.00),
(13, '14:00:00', '15:00:00', 100000.00),
(14, '15:00:00', '17:00:00', 240000.00),
(15, '19:00:00', '21:00:00', 500000.00),
(16, '09:00:00', '10:00:00', 50000.00),
(17, '10:00:00', '11:00:00', 60000.00),
(18, '13:00:00', '16:00:00', 300000.00),
(19, '17:00:00', '18:00:00', 120000.00),
(20, '20:00:00', '21:00:00', 250000.00);

INSERT INTO payments (booking_id, metode_pembayaran, status_pembayaran) VALUES
(1, 'Transfer BCA', 'lunas'),
(2, 'OVO', 'lunas'),
(3, 'Dana', 'lunas'),
(4, 'Belum Memilih', 'belum_bayar'),
(5, 'Transfer Mandiri', 'lunas'),
(6, 'Cash', 'lunas'),
(7, 'Belum Memilih', 'belum_bayar'),
(8, 'GoPay', 'lunas'),
(9, 'Transfer BCA', 'belum_bayar'),
(10, 'OVO', 'lunas'),
(11, 'Cash', 'lunas'),
(12, 'Dana', 'lunas'),
(13, 'Belum Memilih', 'belum_bayar'),
(14, 'Transfer BCA', 'lunas'),
(15, 'Transfer Mandiri', 'lunas'),
(16, 'Cash', 'lunas'),
(17, 'GoPay', 'lunas'),
(18, 'OVO', 'lunas'),
(19, 'Belum Memilih', 'belum_bayar'),
(20, 'Transfer BCA', 'lunas');

-- ==========================================
-- 2. 3 INDEX
-- ==========================================

CREATE INDEX idx_tanggal_booking ON bookings(tanggal_booking);

CREATE INDEX idx_status_pembayaran ON payments(status_pembayaran);

CREATE INDEX idx_tipe_studio ON studios(tipe_studio);

-- ==========================================
-- 3. 3 VIEW
-- ==========================================


CREATE VIEW view_booking_aktif AS
SELECT b.id AS booking_id, u.name AS nama_pelanggan, s.nama_studio, b.tanggal_booking, b.status_booking
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN studios s ON b.studio_id = s.id;

CREATE VIEW view_laporan_pembayaran AS
SELECT p.id AS payment_id, u.name AS nama_pelanggan, b.total_harga, p.metode_pembayaran, p.status_pembayaran
FROM payments p
JOIN bookings b ON p.booking_id = b.id
JOIN users u ON b.user_id = u.id;

CREATE VIEW view_profil_user_lengkap AS
SELECT u.id, u.name, u.email, u.role, p.phone_number, p.address
FROM users u
LEFT JOIN user_profiles p ON u.id = p.user_id;

-- ==========================================
-- 4. 3 PROCEDURE
-- ==========================================

-- Procedure ke 1
DELIMITER //
CREATE PROCEDURE GetTotalPendapatanStudio(IN studioId INT, OUT total DECIMAL(10,2))
BEGIN
    SELECT SUM(total_harga) INTO total 
    FROM bookings 
    WHERE studio_id = studioId AND status_booking = 'confirmed';
END //
DELIMITER ;

-- Procedure ke 2
DELIMITER //
CREATE PROCEDURE CancelExpiredBooking(IN bookingId INT)
BEGIN
    UPDATE bookings SET status_booking = 'cancelled' WHERE id = bookingId;
    UPDATE payments SET status_pembayaran = 'belum_bayar' WHERE booking_id = bookingId;
END //
DELIMITER ;

-- Procedure ke 3
DELIMITER //
CREATE PROCEDURE RegisterUser(
    IN u_name VARCHAR(100), IN u_email VARCHAR(100), IN u_pass VARCHAR(255),
    IN p_phone VARCHAR(15), IN p_address TEXT
)
BEGIN
    DECLARE last_user_id INT;
    INSERT INTO users (name, email, password, role) VALUES (u_name, u_email, u_pass, 'user');
    SET last_user_id = LAST_INSERT_ID();
    INSERT INTO user_profiles (user_id, phone_number, address, bio) VALUES (last_user_id, p_phone, p_address, 'Terdaftar via prosedur.');
END //
DELIMITER ;

-- ==========================================
-- 5. 3 TRIGGER
-- ==========================================

-- Trigger 1 (Before Insert)
DELIMITER //
CREATE TRIGGER sebelum_input_detail_booking
BEFORE INSERT ON booking_details
FOR EACH ROW
BEGIN
    DECLARE harga_jam DECIMAL(10,2);
    DECLARE jam_durasi INT;
    SELECT s.harga_per_jam INTO harga_jam FROM bookings b JOIN studios s ON b.studio_id = s.id WHERE b.id = NEW.booking_id;
    SET jam_durasi = HOUR(TIMEDIFF(NEW.jam_selesai, NEW.jam_mulai));
    SET NEW.subtotal = harga_jam * jam_durasi;
END //
DELIMITER ;

-- Trigger 2 (After Insert)
DELIMITER //
CREATE TRIGGER buat_tagihan_pembayaran
AFTER INSERT ON bookings
FOR EACH ROW
BEGIN
    INSERT INTO payments (booking_id, metode_pembayaran, status_pembayaran)
    VALUES (NEW.id, 'Belum Memilih', 'belum_bayar');
END //
DELIMITER ;

-- Trigger 3 (Jenis: After Update)
DELIMITER //
CREATE TRIGGER log_pembatalan_booking
AFTER UPDATE ON bookings
FOR EACH ROW
BEGIN
    IF OLD.status_booking <> NEW.status_booking AND NEW.status_booking = 'cancelled' THEN
        UPDATE payments SET status_pembayaran = 'belum_bayar' WHERE booking_id = NEW.id;
    END IF;
END //
DELIMITER ;

-- ==========================================
-- 6. Table-session
-- ==========================================

CREATE TABLE sessions (
    id VARCHAR(255) PRIMARY KEY,
    user_id BIGINT UNSIGNED NULL,
    ip_address VARCHAR(45) NULL,
    user_agent TEXT NULL,
    payload LONGTEXT NOT NULL,
    last_activity INT NOT NULL
);	

-- ==========================================
-- 6. 3 UPDATE_AT
-- ==========================================

USE studio_musik_db;

-- Menambahkan kolom updated_at setelah kolom created_at di tabel users
ALTER TABLE users 
ADD COLUMN updated_at TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP AFTER created_at;
ALTER TABLE user_profiles ADD COLUMN updated_at TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE studios ADD COLUMN updated_at TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE bookings ADD COLUMN updated_at TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE booking_details ADD COLUMN updated_at TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE payments ADD COLUMN updated_at TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP;

-- ==========================================
-- 7. 3 userPrivileges
-- ==========================================

-- Buat User 1: Admin Database Utama
CREATE USER 'admin_studio_user'@'localhost' IDENTIFIED BY 'AdminStudioSecure123!';
-- Berikan semua hak akses pada database proyek kita
GRANT ALL PRIVILEGES ON studio_musik_db.* TO 'admin_studio_user'@'localhost';

-- Buat User 2: Kasir / Staf Terbatas
CREATE USER 'kasir_studio_user'@'localhost' IDENTIFIED BY 'KasirStudioPass456!';
-- Kasir hanya boleh membaca (SELECT) seluruh tabel
GRANT SELECT ON studio_musik_db.* TO 'kasir_studio_user'@'localhost';
-- Kasir boleh melakukan update (UPDATE) hanya pada data pembayaran transaksi
GRANT UPDATE ON studio_musik_db.payments TO 'kasir_studio_user'@'localhost';

-- Terapkan perubahan hak akses
FLUSH PRIVILEGES;