<div class="card">
				<div class="card-header">
					<h3 class="card-title">Data Karyawan</h3>
				</div>
				<!-- /.card-header -->
				<div class="card-body">

				<div class="row">
			<div class="col-md-12" style="text-align: right;">

			<button class="btn btn-primary" data-toggle="modal" data-target="#tambah">+ Tambah</button>

					</div>
				</div>

				<div class="row" style="padding-top: 20px;">
					<div class="col-md-12">
					<table id="example2" class="table table-striped table-bordered">
					<thead>
					<tr>
					<th style="width: 10px">No</th>
						<th style="text-align: center;">Nama</th>
						<th style="text-align: center;">Email</th>
						<th style="text-align: center;">Jabatan</th>
						<th style="text-align: center;">Tempat Lahir</th>
						<th style="text-align: center;">Action</th>
					</tr>
				</thead>
				<tbody>
					<?php
				$no = 1;
				foreach ($karyawan as $value) : ?>

						<tr>
							<td style="text-align: center;">
								<?= $no++?>
							</td>
							
								<td style="text-align: center;"><?= $value['nama'] ?></td>
								<td style="text-align: center;"><?= $value['email'] ?></td>
								<td style="text-align: center;"><?= $value['jabatan'] ?></td>
								<td style="text-align: center;"><?= $value['tempat_lahir'] ?></td>
							
								</td>
							</tr>

							<?php endforeach;
					?>
					</tbody>
					
				</table>
			</div>
		</div>
					
	</div>
	<!-- /.card-body -->
</div>