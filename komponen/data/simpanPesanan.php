<?php
session_start();
if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $conn = include "../../connection.php";
    $nama = $_POST['nama'];
    $nomor_id = $_POST['nomor_id'];
    $user_id = $_POST['user_id'];
    $no_hp = $_POST['no_hp'];
    $paket_wisata_id = $_POST['paket_wisata_id'];
    $tanggal = $_POST['tanggal'];
    $pengunjung_dewasa = $_POST['pengunjung_dewasa'];
    $pengunjung_anak = $_POST['pengunjung_anak'];
    $harga_tiket = $_POST['harga_tiket'];
    $total_bayar = $_POST['total_bayar'];



    if (isset($_POST["hitung_total"])) {
        $_SESSION['nama'] = $nama;
        $_SESSION['nomor_id'] = $nomor_id;
        $_SESSION['paket_wisata_id'] = $paket_wisata_id;
        $_SESSION['tanggal'] = $tanggal;
        $_SESSION['pengunjung_dewasa'] = $pengunjung_dewasa;
        $_SESSION['pengunjung_anak'] = $pengunjung_anak;
        $result = mysqli_fetch_assoc(mysqli_query($conn, "SELECT harga_paket FROM paket_wisata WHERE id=$paket_wisata_id"));
        $harga_paket = $result["harga_paket"];

        $total_tiket = ((int)$pengunjung_dewasa + (int)$pengunjung_anak) * (int)$harga_paket;
        $total_tiket_dewasa = (int)$pengunjung_dewasa * (int)$harga_paket;
        $total_tiket_anak = (int)$pengunjung_anak * ((int)$harga_paket * 0.5);
        $total_bayar_tiket = $total_tiket_dewasa + $total_tiket_anak;
        $_SESSION['harga_tiket'] = number_format($total_tiket, 0, ",", ".");
        $_SESSION['total_bayar'] = number_format($total_bayar_tiket, 0, ",", ".");
    } elseif (isset($_POST["pesan_tiket"])) {
        $query = "INSERT INTO pemesanan (nama,nomor_id,user_id,no_hp,paket_wisata_id,tanggal,pengunjung_dewasa,pengunjung_anak,harga_tiket,total_bayar) VALUES ('" . $nama . "','" . $nomor_id . "','" . $user_id . "','" . $no_hp . "','" . $paket_wisata_id . "','" . $tanggal . "','" . $pengunjung_dewasa . "','" . $pengunjung_anak . "','" . $harga_tiket . "','" . $total_bayar . "');";
        $result = mysqli_query($conn, $query);

        if ($result) {
            $_SESSION['alert'] = "success";
            $_SESSION['message'] = "Berhasil melakukan pemesanan";

            $query_pemesanan = "SELECT * FROM pemesanan where user_id=" . $user_id . " order by id desc limit 1";
            $result_pemesanan = mysqli_query($conn, $query_pemesanan);
            $pemesanan = mysqli_fetch_array($result_pemesanan, MYSQLI_ASSOC);
            $_SESSION['reservasi']['pemesanan'] = $pemesanan;

            $query_paket_wisata = "SELECT id,nama_paket,(select nama from obyek_wisata where id=paket_wisata.obyek_wisata_id) as nama_obyek_wisata FROM paket_wisata where id=" . $pemesanan['paket_wisata_id'];
            $result_paket_wisata = mysqli_query($conn, $query_paket_wisata);
            $paket_wisata = mysqli_fetch_array($result_paket_wisata, MYSQLI_ASSOC);
            $_SESSION['reservasi']['paket_wisata'] = $paket_wisata;

            
            $_SESSION['nomor_id'] = "";
            $_SESSION['paket_wisata_id'] = "";
            $_SESSION['tanggal'] = "";
            $_SESSION['pengunjung_dewasa'] = "";
            $_SESSION['pengunjung_anak'] = "";
            $_SESSION['harga_tiket'] = "";
            $_SESSION['total_bayar'] = "";
        } else {
            $_SESSION['alert'] = "danger";
            $_SESSION['message'] = "Gagal melakukan pemesanan";
        }
    }
}

echo "<script>window.location.replace('" . $_SERVER['HTTP_REFERER'] . "');</script>";
