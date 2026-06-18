<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo; // <-- Pastikan import ini ada
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Booking extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'studio_id',
        'tanggal_booking',
        'total_harga',
        'status_booking',
    ];

    // 1. HUBUNGKAN BOOKING KE USER (Solusi Error Undefined Method 'user')
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    // 2. HUBUNGKAN BOOKING KE STUDIO
    public function studio(): BelongsTo
    {
        return $this->belongsTo(Studio::class, 'studio_id');
    }

    // 3. HUBUNGKAN BOOKING KE INSTRUMENTS (Many-to-Many)
    public function instruments(): BelongsToMany
    {
        return $this->belongsToMany(Instrument::class, 'booking_instrument');
    }
}