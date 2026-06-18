<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Instrument extends Model
{
    protected $fillable = ['nama_instrumen', 'jenis_instrumen', 'harga_sewa'];

    public function bookings()
    {
        return $this->belongsToMany(Booking::class, 'booking_instrument');
    }
}