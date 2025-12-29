<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\SampahController;
use App\Http\Controllers\PdfController;

Route::post('/register',[AuthController::class,'register']);
Route::post('/login',[AuthController::class,'login']);

Route::get('/sampah/{id}', [SampahController::class, 'index']);
Route::post('/sampah/store', [SampahController::class, 'store']);
// Route::get('/sampah/user/{id}', [SampahController::class, 'perUser']);
Route::delete('/sampah/{id}', [SampahController::class, 'destroy']);

Route::post('/change-password', [AuthController::class, 'changePassword']);

Route::post('/forgot-password', [AuthController::class, 'forgotPassword']);


Route::post('/sampah/filter',[SampahController::class,'filterTanggal']);

Route::get('/grafik/{id}',[SampahController::class,'grafikHarian']);
Route::get('/dashboard/{userId}', [SampahController::class, 'harian']);

Route::get('/grafik/bulanan/{id}',[SampahController::class,'grafikBulanan']);

Route::get('/exportpdf/user/{userId}', [SampahController::class, 'exportUser']);


