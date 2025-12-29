<!DOCTYPE html>
<html>

<head>
    <style>
        body {
            font-family: DejaVu Sans;
            font-size: 11px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            border: 1px solid #000;
            padding: 5px;
            text-align: center;
        }

        img {
            width: 80px;
            height: auto;
        }
    </style>
</head>

<body>

    <h3 align="center">LAPORAN SAMPAH ({{ strtoupper($type) }})</h3>

    <table>
        <thead>
            <tr>
                <th>No</th>
                <th>Nama</th>
                <th>Kelas</th>
                <th>Kategori</th>
                <th>Sampah</th>
                <th>Tanggal</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($data as $i => $d)
                <tr>
                    <td>{{ $i + 1 }}</td>
                    <td>{{ $d->nama }}</td>
                    <td>{{ $d->kelas }}</td>
                    <td>{{ $d->kategori }}</td>
                    <td>{{ $d->nama_sampah }}</td>

                    <td>{{ $d->created_at->format('d-m-Y') }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>

</body>

</html>
