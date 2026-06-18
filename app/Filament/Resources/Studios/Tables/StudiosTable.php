<?php

namespace App\Filament\Resources\Studios\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Table;

class StudiosTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('nama_studio')
                    ->searchable(),
                TextColumn::make('tipe_studio')
                    ->searchable(),
                TextColumn::make('harga_per_jam')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('harga_per_jam')
                    ->money('IDR') // Biar muncul format Rupiah otomatis
                    ->sortable(),
                ImageColumn::make('foto_studio')
                    ->label('Foto Studio')
                    ->width(120)  // Mengatur lebar gambar menjadi 120 pixel
                    ->height(80)  // Mengatur tinggi gambar menjadi 80 pixel
                    ->square()    // Mengubah bentuk dari bulat (circular) menjadi kotak rapi agar gambar studio terlihat luas
                    ->extraImgAttributes([
                        'class' => 'rounded-lg object-cover', // Membuat sudut gambar agak melengkung (rounded) dan proporsional
                    ]),
                TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->recordActions([
                EditAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
