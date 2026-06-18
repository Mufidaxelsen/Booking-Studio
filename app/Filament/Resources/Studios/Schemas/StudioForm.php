<?php

namespace App\Filament\Resources\Studios\Schemas;

use Filament\Schemas\Schema;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\FileUpload; // <-- Pastikan ini di-import

class StudioForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('nama_studio')
                    ->required()
                    ->maxLength(255),

                TextInput::make('tipe_studio')
                    ->required()
                    ->maxLength(50),

                TextInput::make('harga_per_jam')
                    ->numeric()
                    ->required(),

                Textarea::make('deskripsi')
                    ->nullable(),
                
                // FITUR UPLOAD GAMBAR TAMBAHAN UNTUK PEMWEB
                FileUpload::make('foto_studio')
                    ->image() // Validasi agar hanya menerima file gambar (jpg, png, dll)
                    ->directory('foto-studio') // File akan disimpan di storage/app/public/foto-studio
                    ->maxSize(2048) // Membatasi ukuran file maksimal 2MB
                    ->nullable(),
            ]);
    }
}