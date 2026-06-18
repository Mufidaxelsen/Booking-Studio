<?php

namespace App\Filament\Resources\Bookings\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class BookingsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('user_id')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('studio_id')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('tanggal_booking')
                    ->date()
                    ->sortable(),
                TextColumn::make('total_harga')
                    ->numeric()
                    ->sortable(),
                TextColumn::make('status_booking')
                    ->badge(),
                TextColumn::make('instruments.nama_instrumen')
                    ->label('Alat Musik yang Disewa')
                    ->badge() // Mengubah tampilan teks menjadi kotak badge yang keren
                    // @phpstan-ignore-next-line
                    ->color('success') // Memberi warna hijau estetik pada badge
                    ->listWithLineBreaks(), // Jika menyewa lebih dari 1, otomatis rapi berjejer ke bawah
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
