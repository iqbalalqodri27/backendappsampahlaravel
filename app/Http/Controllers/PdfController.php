<?php

namespace App\Http\Controllers;
use Barryvdh\DomPDF\Facade\Pdf;

use Illuminate\Http\Request;

class PdfController extends Controller
{
    public function export($id){
    $data = Sampah::where('user_id',$id)->get();
    $pdf = Pdf::loadView('pdf.sampah',compact('data'));
    return $pdf->download('sampah.pdf');
}
}
