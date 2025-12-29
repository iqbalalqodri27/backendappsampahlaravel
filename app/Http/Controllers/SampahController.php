<?php

namespace App\Http\Controllers;
use App\Models\sampah;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use DB;
use Carbon\Carbon;
use App\Models\User;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\File;
// use Illuminate\Support\Facades\DB;

class SampahController extends Controller
{

    public function index(Request $request ,$userId)
{
    // ðŸ”´ WAJIB user_id
    // if (!$userId->has('user_id')) {
    //     return response()->json([
    //         'status' => false,
    //         'message' => 'user_id wajib dikirim'
    //     ], 400);
    // }

    // $user_id = $userId->query('user_id');
$tanggal = $request->query('date', Carbon::now()->format('Y-m-d'));
    $data = sampah::where('user_id', $userId)
            ->whereDate('waktu', $tanggal)
        ->orderBy('id', 'desc')
        ->get();

    $baseUrl = url('uploads');

    $result = $data->map(function ($item) use ($baseUrl) {
        return [
            'id' => $item->id,
            'user_id' => $item->user_id,
            'nis' => $item->nis,
            'nama' => $item->nama,
            'kelas' => $item->kelas,
            'kategori' => $item->kategori,
            'nama_sampah' => $item->nama_sampah,
            'foto' => $item->foto ? "$baseUrl/{$item->foto}" : null,
            'waktu' => $item->waktu,
        ];
    });

    return response()->json([
        'status' => true,
        'data' => $result
    ], 200);
}


public function filterTanggal(Request $r){
    return Sampah::where('user_id',$r->user_id)
        ->whereBetween('waktu',[
            $r->start,
            $r->end
        ])->get();
}

public function grafikHarian($id){
    return Sampah::where('user_id',$id)
    ->select(DB::raw("DATE(waktu) as tanggal"), DB::raw("COUNT(*) as total"))
    ->groupBy('tanggal')->get();
}
 public function harian(Request $r, $id)
    {
        $date = $r->query('date');

        $data = Sampah::select('kategori', DB::raw('count(*) as total'))
            ->where('user_id', $id)
            ->whereDate('waktu', $date)
            ->groupBy('kategori')
            ->get();

        return response()->json([
            'status' => true,
            'data' => $data
        ]);
    }


public function grafikBulanan($id){
    return Sampah::where('user_id',$id)
    ->select(DB::raw("MONTH(waktu) as bulan"), DB::raw("COUNT(*) as total"))
    ->groupBy('bulan')->get();
}
    
public function store(Request $r)
    {
        $destination = $_SERVER['DOCUMENT_ROOT'].'/uploads';

        if ($r->hasFile('foto')) {
            $foto = $r->file('foto');
            // $fotoName = $r->nama_sampah.'.'.$foto->getClientOriginalExtension();
            $fotoName = now()->format('Ymd_His') . '_' . uniqid() . '.' . $foto->getClientOriginalExtension();
            $foto->move($destination, $fotoName);
        }

        Sampah::create([
            'user_id' => $r->user_id,
            'nis' => $r->nis,
            'nama' => $r->nama,
            'kelas' => $r->kelas,
            'kategori' => $r->kategori,
            'nama_sampah' => $r->nama_sampah,
            'foto' => $fotoName,
            'waktu' => now(),
        ]);

        return response()->json(['status' => true]);
    }

public function destroy($id)
    {
        $data = Sampah::find($id);

        if (!$data) {
            return response()->json([
                'status' => false,
                'message' => 'Data tidak ditemukan'
            ], 404);
        }

        // ===============================
        // PATH KE public_html/uploads
        // ===============================
        $uploadPath = $_SERVER['DOCUMENT_ROOT'] . '/uploads/';

        if ($data->foto) {
            $filePath = $uploadPath . $data->foto;

            if (file_exists($filePath)) {
                unlink($filePath); // 🔥 HAPUS FILE
            }
        }

        // ===============================
        // HAPUS DATA DB
        // ===============================
        $data->delete();

        return response()->json([
            'status' => true,
            'message' => 'Data & foto berhasil dihapus'
        ], 200);
    }
    

public function exportUser(Request $request, $userId)
{
    $type = $request->type; // day | week | month

    $query = Sampah::where('user_id', $userId);

    if ($type == 'day') {
        $query->whereDate('created_at', now());
    } elseif ($type == 'week') {
        $query->whereBetween('created_at', [
            now()->startOfWeek(),
            now()->endOfWeek()
        ]);
    } elseif ($type == 'month') {
        $query->whereMonth('created_at', now()->month)
              ->whereYear('created_at', now()->year);
    }

    $data = $query->get();

    $pdf = PDF::loadView('pdf.export_sampah', compact('data', 'type'))
              ->setPaper('A4', 'portrait');

    return response($pdf->output(), 200)
        ->header('Content-Type', 'application/pdf')
        ->header(
            'Content-Disposition',
            'attachment; filename="laporan_'.$userId.'_'.time().'.pdf"'
        );
} //
}
