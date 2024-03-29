<!DOCTYPE html>
<html>
<head>
	<title>Perpustakaan | Laporan Print Buku</title>
</head>
<body>
<style>
	.table-data{
		width: 100%;
		border-collapse: collapse;
	}

	.table-data tr th,
	.table-data tr td{
		border: 1px solid #000;
		font-size: 10pt;
		text-align: center;
	}
</style>
<h3>Laporan Data Buku Peprustakaan SMK AL-MADANI GARUT</h3>
<br>
<table class="table-data">
	<thead>
		<tr>
			<th>No</th>
			<th>Gambar</th>
			<th>Judul Buku</th>
			<th>Pengarang</th>
			<th>Tahun Terbit</th>
			<th>Penerbit</th>
			<th>ISBN</th>
			<th>Jumlah Buku</th>
			<th>Lokasi</th>
		</tr>
	</thead>
	<tbody>
      <?php
      $no = 1;
      foreach ($buku as $b) {
      ?>
      <tr>
        <td><?php echo $no++; ?></td>
        <td><img src="<?php echo base_url().'/assets/upload/'.$b->gambar; ?>" width="80" height="80" alt="gambar tidak ada"></td>
        <td><?php echo $b->judul_buku ?></td>
        <td><?php echo $b->pengarang ?></td>
        <td><?php echo $b->penerbit ?></td>
        <td><?php echo $b->thn_terbit ?></td>
        <td><?php echo $b->isbn ?></td>
        <td><?php echo $b->jumlah_buku ?></td>
        <td><?php echo $b->lokasi ?></td>
      </tr>
      <?php } ?>
  </tbody>
</table>
<script type="text/javascript">
	window.print();
</script>

</body>
</html>