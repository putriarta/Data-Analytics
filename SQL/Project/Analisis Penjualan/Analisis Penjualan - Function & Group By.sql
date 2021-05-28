-- Analisis Penjualan

-- 1. Total jumlah seluruh penjualan (total/revenue)
SELECT
    SUM(total) AS total
FROM
    tr_penjualan;

-- 2. Total quantity seluruh produk yang terjual
SELECT
    SUM(qty) AS qty
FROM
    tr_penjualan;

-- 3. Total quantity dan total revenue untuk setiap kode produk
SELECT
    kode_produk,
    SUM(qty) AS qty,
    SUM(total) AS total
FROM
    tr_penjualan
GROUP BY
    kode_produk;

-- 4. Rata - Rata total belanja per kode pelanggan
SELECT
    kode_pelanggan,
    AVG(total) AS avg_total
FROM
    tr_penjualan
GROUP BY
    kode_pelanggan;

-- 5. Kategori belanja pelanggan
SELECT
    kode_transaksi,
    kode_pelanggan,
    no_urut,
    kode_produk,
    nama_produk,
    qty,
    total,
    CASE
        WHEN total > 300000 THEN 'High'
        WHEN total < 100000 THEN 'Low'
        ELSE 'Medium'
    END AS kategori
FROM
    tr_penjualan;
