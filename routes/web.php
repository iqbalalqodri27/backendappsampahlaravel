<?php

use Illuminate\Support\Facades\Route;
use Carbon\Carbon;


Route::get('/', function () {
    return view('welcome');
});

Route::get('/time', function () {
    return Carbon::now('Asia/Jakarta');

});
