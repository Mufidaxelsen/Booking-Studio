<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Studio extends Model
{
    protected $fillable = ['nama_studio', 'tipe_studio', 'harga_per_jam', 'deskripsi', 'foto_studio'];

    public function bookings()

    {
        return $this->hasMany(Booking::class);
    }
}