<?php
include "komponen/header.php";

//redirect registrasi
if (!isset($_SESSION['username'])) {
    echo "<script>window.location.replace('registrasi.php');</script>";
}
$conn = include "connection.php";
?>
<main>
    <section class="container-fluid py-3">
        <div class="row">
            <?php
            if (isset($_SESSION['reservasi'])) { ?>
                <div class="row mb-3">
                    <div class="col-lg-6 mx-auto">
                        <?php include "komponen/alert.php"; ?>
                        <div class="card card text-bg-success">
                            <div class="card-header text-uppercase text-center">
                                <h5>Rangkuman Reservasi TIket Wisata</h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-borderless text-light">
                                        <tbody>
                                            <tr>
                                                <td width="50%">Nama Pemesan</td>
                                                <td>: <?= $_SESSION['reservasi']['pemesanan']['nama'] ?></td>
                                            </tr>
                                            <tr>
                                                <td width="50%">Nomor Identitas</td>
                                                <td>: <?= $_SESSION['reservasi']['pemesanan']['nomor_id'] ?></td>
                                            </tr>
                                            <tr>
                                                <td width="50%">No Hp</td>
                                                <td>: <?= $_SESSION['reservasi']['pemesanan']['no_hp'] ?></td>
                                            </tr>
                                            <tr>
                                                <td width="50%">Tempat Wisata</td>
                                                <td>: <?= $_SESSION['reservasi']['paket_wisata']['nama_paket'] ?></td>
                                            </tr>
                                            <tr>
                                                <td width="50%">Pengunjung Dewasa</td>
                                                <td>: <?= $_SESSION['reservasi']['pemesanan']['pengunjung_dewasa'] ?></td>
                                            </tr>
                                            <tr>
                                                <td width="50%">Pengunjung Anak</td>
                                                <td>: <?= $_SESSION['reservasi']['pemesanan']['pengunjung_anak'] ?></td>
                                            </tr>
                                            <tr>
                                                <td width="50%">Harga Tiket</td>
                                                <td>: Rp <?= number_format($_SESSION['reservasi']['pemesanan']['harga_tiket'], 0, ",", ".") ?></td>
                                            </tr>
                                            <tr>
                                                <td width="50%">Total Bayar</td>
                                                <td>: Rp <?= number_format($_SESSION['reservasi']['pemesanan']['total_bayar'], 0, ",", ".") ?></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-lg-6 mx-auto">
                        <div class="card card text-bg-success">
                            <div class="card-body">
                                <h6 class="card-title text-center">Pesan Lagi ?</h6>
                                <a href="pemesanan.php" class="btn btn-secondary float-start col-lg-5 m-1">Ya</a>
                                <a href="index.php" class="btn btn-danger float-end col-lg-5 m-1">Tidak</a>
                            </div>
                        </div>
                    </div>
                </div>
            <?php
                unset($_SESSION['reservasi']);
            } else { ?>
                <div class="col-lg-8 mx-auto">
                    <form action="komponen/data/simpanPesanan.php" method="post">

                        <input type="hidden" name="user_id" value="<?= $_SESSION['user_id'] ?>">
                        <div class="card">
                            <div class="card-body">
                                <h2 class="card-title  text-center">Form Pemesanan</h2>
                                <div class="row mb-2">
                                    <label for="" class="col-lg-4">Nama Pemesanan</label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control" name="nama" value="<?= $_SESSION['nama'] ?>" required>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <label for="" class="col-lg-4">Nomor Indetitas</label>
                                    <div class="col-lg-8">
                                        <input type="number" class="form-control" name="nomor_id" value="<?= isset($_SESSION["nomor_id"]) ? $_SESSION['nomor_id'] : "" ?>" required>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <label for="" class="col-lg-4">Nomor Telp/HP</label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control" maxlength="15" name="no_hp" value="<?= $_SESSION['no_hp'] ?>" required>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <label for="" class="col-lg-4">Tempat Wisata</label>
                                    <div class="col-lg-8">
                                        <select name="paket_wisata_id" id="paketWisata" class="form-select">
                                            <option value="">-- Pilih Paket Wisata--</option>
                                            <?php
                                            $query = "SELECT id,nama_paket,(SELECT nama FROM obyek_wisata WHERE id=paket_wisata.obyek_wisata_id) as obyek_wisata FROM paket_wisata";
                                            $result = mysqli_query($conn, $query);
                                            while ($data = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                                            ?>
                                                <?php if (isset($_SESSION["paket_wisata_id"]) && $_SESSION["paket_wisata_id"] == $data["id"]) { ?>
                                                    <option value="<?= $data['id'] ?>" selected><?= $data['nama_paket'] . " - " . $data['obyek_wisata'] ?></option>
                                                <?php } else { ?>
                                                    <option value="<?= $data['id'] ?>"><?= $data['nama_paket'] . " - " . $data['obyek_wisata'] ?></option>
                                                <?php } ?>

                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <label class="label col-lg-4">Tanggal Kunjungan</label>
                                    <div class="col-lg-4">
                                        <input type="date" name="tanggal" value="<?= isset($_SESSION["tanggal"]) ? $_SESSION['tanggal'] : "" ?>" id="" class="form-control" required>
                                    </div>

                                </div>

                                <div class="row mb-2">
                                    <label for="" class="col-lg-4">Pengunjung dewasa</label>
                                    <div class="col-lg-4">
                                        <input type="number" min=1 class="form-control" value="<?= isset($_SESSION["pengunjung_dewasa"]) ? $_SESSION['pengunjung_dewasa'] : "1" ?>" name="pengunjung_dewasa" id="jmlPeserta" required>

                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-4">
                                        <label for="">Pengunjung anak-anak</label>
                                        <div class="form-text">Usia dibawah 12 tahun</div>
                                    </div>

                                    <div class="col-lg-4">
                                        <input type="number" min=1 class="form-control" value="<?= isset($_SESSION["pengunjung_anak"]) ? $_SESSION['pengunjung_anak'] : "1" ?>" name="pengunjung_anak" id="jmlPeserta" required>

                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <label for="" class="from-label col-lg-4">Harga Tiket</label>
                                    <div class="col-lg-4">
                                        <input type="text" value="<?= isset($_SESSION["harga_tiket"]) ? $_SESSION['harga_tiket'] : "" ?>" class="form-control" readonly>
                                        <input type="hidden" name="harga_tiket" value="<?= isset($_SESSION["harga_tiket"]) ? str_replace(".", "", $_SESSION['harga_tiket']) : "" ?>" id="harga_tiket">
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <label for="" class="from-label col-lg-4">Total Bayar</label>
                                    <div class="col-lg-4">
                                        <input type="text" value="<?= isset($_SESSION["total_bayar"]) ? $_SESSION['total_bayar'] : "" ?>" class="form-control" readonly>
                                        <input type="hidden" name="total_bayar" value="<?= isset($_SESSION["total_bayar"]) ? str_replace(".", "", $_SESSION['total_bayar']) : "" ?>" id="total_bayar">
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-4"></div>
                                    <div class="form-check col-lg-8">
                                        <input class="form-check-input" type="checkbox" value="" id="permission">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            saya dan/atau rombongan telah membaca, memahami, dan setuju berdasarkan syarat dan ketentuan yang telah ditetapkan
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="float-start"><button type="submmit" name="hitung_total" class="btn btn-primary" id="hitung_total" disabled>Hitung Total Bayar</button></div>
                                <div class="float-end">
                                    <button type="reset" class="btn btn-danger me-2">Cancel</button>
                                    <button type="submit" name="pesan_tiket" class="btn btn-success" id="pesan_tiket" disabled>Pesan Tiket</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            <?php } ?>
        </div>

    </section>
</main>
<script src="assets/js/jquery-3.7.1.min.js.js"></script>
<script>
    //ketika mengubah paket maka harus klik hitung lagi
    $('#paketWisata').change(function() {
        $("#pesan_tiket").attr("disabled", "true");
    })

    //fungsi checkbox
    $('#permission').change(function() {
        if (this.checked) {
            $("#hitung_total").removeAttr("disabled");
            if ($("#harga_tiket").val() <= 0 && $("#total_bayar").val() <= 0) {

            } else {
                $("#pesan_tiket").removeAttr("disabled");
            }


        } else {
            $("#hitung_total").attr("disabled", "true");
            $("#pesan_tiket").attr("disabled", "true");
        }



    });

</script>
<?php
include "komponen/footer.php";
?>