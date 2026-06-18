<?php

namespace App\Filament\Resources\Instruments\Schemas;

use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class InstrumentForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('nama_instrumen')
                    ->required(),
                TextInput::make('jenis_instrumen')
                    ->required(),
                TextInput::make('harga_sewa')
                    ->required()
                    ->numeric(),
            ]);
    }
}
