<?php

namespace App\Http\Controllers;
use App\Models\Sampah;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use DB;
use Carbon\Carbon;
// use Illuminate\Support\Facades\DB;

class SampahController extends Controller
{

    public function index(Request $request ,$userId)
{
    // 🔴 WAJIB user_id
    // if (!$userId->has('user_id')) {
    //     return response()->json([
    //         'status' => false,
    //         'message' => 'user_id wajib dikirim'
    //     ], 400);
    // }

    // $user_id = $userId->query('user_id');
$tanggal = $request->query('date', Carbon::now()->format('Y-m-d'));
    $data = Sampah::where('user_id', $userId)
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
public function harian(Request $request, $userId)
    {
        // tanggal dari query ?date=YYYY-MM-DD
        $tanggal = $request->query('date', Carbon::now()->format('Y-m-d'));

        $data = Sampah::select(
                'kategori',
                DB::raw('COUNT(*) as total')
            )
            ->where('user_id', $userId)
            ->whereDate('waktu', $tanggal)
            ->groupBy('kategori')
            ->get();

        return response()->json([
            'success' => true,
            'date' => $tanggal,
            'data' => $data
        ], 200);
    }


public function grafikBulanan($id){
    return Sampah::where('user_id',$id)
    ->select(DB::raw("MONTH(waktu) as bulan"), DB::raw("COUNT(*) as total"))
    ->groupBy('bulan')->get();
}
    
public function store(Request $request)
{
    $request->validate([
        'user_id' => 'required',
        'nis' => 'required',
        'nama' => 'required',
        'kelas' => 'required',
        'kategori' => 'required',
        'nama_sampah' => 'required',
        'waktu' => 'required',
        'foto' => 'required|image|mimes:jpg,jpeg,png',
    ]);

    $imageName = time() . '.' . $request->foto->extension();
    $request->foto->move(public_path('uploads'), $imageName);

    Sampah::create([
        'user_id' => $request->user_id,
        'nis' => $request->nis,
        'nama' => $request->nama,
        'kelas' => $request->kelas,
        'kategori' => $request->kategori,
        'nama_sampah' => $request->nama_sampah,
        'waktu' => $request->waktu ?? now(),
        'foto' => $imageName,
    ]);

    return response()->json(['success' => true, 'message' => 'Data disimpan']);
}

public function destroy($id)
{
    $s = Sampah::find($id);
    if (!$s) {
        return response()->json(['message' => 'Data tidak ditemukan'], 404);
    }

    $s->delete();

    return response()->json(['message' => 'Data berhasil dihapus']);
}



    //
}
