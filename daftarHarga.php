<?php
include "komponen/header.php";

$conn = include "connection.php";

// Query SQL untuk mengambil data
$sql = "SELECT * FROM daftar_harga";
$result = $conn->query($sql);

// Tampilkan data dalam bentuk tabel HTML
echo "<table class='table table-striped'>";
echo "<thead>";
echo "<tr>";
echo "<th>No</th>";
echo "<th>Nama Wisata</th>";
echo "<th>Harga Dewasa</th>";
echo "<th>Harga Anak-anak dibawah 12 Tahun</th>";
echo "</tr>";
echo "</thead>";
echo "<tbody>";

if ($result->num_rows > 0) {
    // Jika ada data, tampilkan dalam bentuk baris tabel
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["id"] . "</td>"; // Asumsikan ada kolom 'id'
        echo "<td>" . $row["nama_wisata"] . "</td>";
        echo "<td>" . number_format($row["harga_dewasa"], 0, ',', '.') . "</td>"; // Format mata uang Indonesia
        echo "<td>" . number_format($row["harga_anak_anak"], 0, ',', '.') . "</td>";
        echo "</tr>";
    }
} else {
    // Jika tidak ada data, tampilkan pesan
    echo "<tr><td colspan='4'>Tidak ada data wisata.</td></tr>";
}

echo "</tbody>";
echo "</table>";

$conn->close();
?>

</main>
<?php
include "komponen/footer.php";
?>