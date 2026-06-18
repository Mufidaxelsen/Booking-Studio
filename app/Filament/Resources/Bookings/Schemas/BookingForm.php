<?php

namespace App\Filament\Resources\Bookings\Schemas;

use Filament\Schemas\Schema;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\DatePicker;

class BookingForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Select::make('user_id')
                    ->relationship('user', 'name') // Mengambil data nama penyewa dari tabel users
                    ->required()
                    ->searchable(), // Biar admin bisa ngetik nama user pas nyari

                Select::make('studio_id')
                    ->relationship('studio', 'nama_studio') // Mengambil nama studio dari tabel studios
                    ->required(),

                DatePicker::make('tanggal_booking')
                    ->required(),

                TextInput::make('total_harga')
                    ->numeric()
                    ->required(),

                Select::make('status_booking')
                    ->options([
                        'pending' => 'Pending',
                        'confirmed' => 'Confirmed',
                        'cancelled' => 'Cancelled',
                    ])
                    ->required(),

                // FITUR MANY-TO-MANY: SEWA ALAT MUSIK TAMBAHAN
                Select::make('instruments') // Nama field harus sama dengan nama relasi di Model Booking (instruments)
                    ->relationship('instruments', 'nama_instrumen') // Mengambil data alat musik dari tabel instruments
                    ->multiple() // Kunci utama Many-to-Many: mengizinkan pilih lebih dari 1 alat musik
                    ->preload() // Meload data instrumen di awal agar transisinya mulus pas diklik
                    ->label('Sewa Alat Musik Tambahan (Optional)'),
            ]);
    }
}