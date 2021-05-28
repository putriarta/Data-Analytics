USE data;

-- TUGAS PRAKTEK
-- Tugas Praktek: Menggunakan INNER JOIN pada tabel ms_item_warna dan ms_item_kategori

SELECT *
FROM
    ms_item_warna
    INNER JOIN ms_item_kategori ON ms_item_warna.nama_barang = ms_item_kategori.nama_item;

SELECT *
FROM
    tr_penjualan
    INNER JOIN ms_produk ON tr_penjualan.kode_produk = ms_produk.kode_produk;

SELECT
    tr_penjualan.kode_transaksi,
    tr_penjualan.kode_pelanggan,
    tr_penjualan.kode_produk,
    ms_produk.nama_produk,
    ms_produk.harga,
    tr_penjualan.qty,
    ms_produk.harga * tr_penjualan.qty AS total
FROM
    tr_penjualan
    INNER JOIN ms_produk ON tr_penjualan.kode_produk = ms_produk.kode_produk;


-- Tugas Praktek: Menggunakan UNION pada tabel_a dan tabel_b

SELECT *
FROM tabel_a
UNION
SELECT *
FROM tabel_b;


-- Tugas Praktek: Menggunakan UNION dengan Klausa WHERE

SELECT *
FROM tabel_a
WHERE kode_pelanggan = 'dqlabcust03'
UNION
SELECT *
FROM tabel_b
WHERE kode_pelanggan = 'dqlabcust03';

-- Menggunakan UNION dan Menyelaraskan Kolom-Kolomnya

SELECT
    customername,
    contactname,
    city,
    postalcode
FROM
    customers
UNION
SELECT
    suppliername,
    contactname,
    city,
    postalcode
FROM
    suppliers;



-- MINI PROJECT
-- Mini Project dengan INNER JOIN

SELECT
    DISTINCT ms_pelanggan.kode_pelanggan,
    ms_pelanggan.nama_customer,
    ms_pelanggan.alamat
FROM
    ms_pelanggan
    INNER JOIN tr_penjualan ON ms_pelanggan.kode_pelanggan = tr_penjualan.kode_pelanggan
WHERE
    tr_penjualan.nama_produk = 'Kotak Pensil DQLab'
    OR tr_penjualan.nama_produk = 'Flashdisk DQLab 32 GB'
    OR tr_penjualan.nama_produk = 'Sticky Notes DQLab 500 sheets';

-- Mini Project dengan UNION
SELECT
    nama_produk,
    kode_produk,
    harga
FROM
    ms_produk_1
WHERE
    harga < 100000
UNION
SELECT
    nama_produk,
    kode_produk,
    harga
FROM
    ms_produk_2
WHERE
    harga < 50000;
