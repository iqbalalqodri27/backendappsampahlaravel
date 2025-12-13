<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class sampah extends Model
{
    protected $table = 'sampahs';

    protected $fillable = [
        'user_id',
        'nis',
        'nama',
        'kelas',
        'kategori',
        'nama_sampah',
        'foto',
        'waktu',
    ];

    protected $casts = [
        'waktu' => 'datetime',
    ];
}
