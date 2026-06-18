<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Studio;      
use App\Models\Instrument;  
use App\Models\Booking;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // 1. Membuat Role menggunakan Spatie
        $adminRole = Role::create(['name' => 'Admin']);
        $kasirRole = Role::create(['name' => 'Kasir']);

        // 2. Membuat Akun Admin & Tempelkan Rolenya
        $admin = User::factory()->create([
            'name' => 'Mufid Admin',
            'email' => 'admin@gmail.com',
            'password' => bcrypt('password'), // passwordnya adalah: password
        ]);
        $admin->assignRole($adminRole);

        // 3. Membuat Akun Kasir & Tempelkan Rolenya
        $kasir = User::factory()->create([
            'name' => 'Staf Kasir',
            'email' => 'kasir@gmail.com', // akun untuk simulasi logout/login kasir
            'password' => bcrypt('password'), // passwordnya adalah: password
        ]);
        $kasir->assignRole($kasirRole);

        // Membuat 10 User/Pelanggan biasa secara acak
        User::factory(10)->create();

        // Membuat data Studio langsung ke database
        Studio::create([
            'nama_studio' => 'Studio Rock A',
            'tipe_studio' => 'Premium',
            'harga_per_jam' => 75000,
            'deskripsi' => 'Cocok untuk latihan band rock dengan peredam suara ganda.',
        ]);
        Studio::create([
            'nama_studio' => 'Studio Pop B',
            'tipe_studio' => 'Standard',
            'harga_per_jam' => 50000,
            'deskripsi' => 'Cocok untuk latihan akustik dan pop santai.',
        ]);
        Studio::create([
            'nama_studio' => 'Studio Jazz C',
            'tipe_studio' => 'Standard',
            'harga_per_jam' => 55000,
            'deskripsi' => 'Ruang nyaman untuk latihan jazz dan musik instrumental.',
        ]);

        Studio::create([
            'nama_studio' => 'Studio Metal D',
            'tipe_studio' => 'Premium',
            'harga_per_jam' => 85000,
            'deskripsi' => 'Dilengkapi peredam suara ekstra untuk musik metal dan hardcore.',
        ]);

        Studio::create([
            'nama_studio' => 'Studio Akustik E',
            'tipe_studio' => 'Standard',
            'harga_per_jam' => 45000,
            'deskripsi' => 'Ideal untuk latihan gitar akustik, vokal, dan musik santai.',
        ]);

        Studio::create([
            'nama_studio' => 'Studio Indie F',
            'tipe_studio' => 'Premium',
            'harga_per_jam' => 70000,
            'deskripsi' => 'Ruang modern dengan akustik seimbang untuk band indie.',
        ]);

        Studio::create([
            'nama_studio' => 'Studio Blues G',
            'tipe_studio' => 'Standard',
            'harga_per_jam' => 50000,
            'deskripsi' => 'Cocok untuk latihan blues, soul, dan musik klasik.',
        ]);

        Studio::create([
            'nama_studio' => 'Studio EDM H',
            'tipe_studio' => 'VIP',
            'harga_per_jam' => 100000,
            'deskripsi' => 'Dilengkapi sound system berkualitas tinggi untuk musik elektronik.',
        ]);

        Studio::create([
            'nama_studio' => 'Studio Klasik I',
            'tipe_studio' => 'Standard',
            'harga_per_jam' => 60000,
            'deskripsi' => 'Ruangan tenang untuk latihan piano dan musik klasik.',
        ]);

        Studio::create([
            'nama_studio' => 'Studio Reggae J',
            'tipe_studio' => 'Premium',
            'harga_per_jam' => 65000,
            'deskripsi' => 'Suasana santai dengan akustik hangat untuk musik reggae.',
        ]);

        Studio::create([
            'nama_studio' => 'Studio HipHop K',
            'tipe_studio' => 'VIP',
            'harga_per_jam' => 95000,
            'deskripsi' => 'Cocok untuk recording demo dan latihan hip hop.',
        ]);

        Studio::create([
            'nama_studio' => 'Studio Dangdut L',
            'tipe_studio' => 'Standard',
            'harga_per_jam' => 55000,
            'deskripsi' => 'Ruang latihan luas untuk grup musik dangdut dan melayu.',
        ]);

        // Membuat data Instrumen langsung ke database
        Instrument::create([
            'nama_instrumen' => 'Gitar Listrik Fender',
            'jenis_instrumen' => 'Gitar',
            'harga_sewa' => 15000,
        ]);
        Instrument::create([
            'nama_instrumen' => 'Drum Kit Yamaha',
            'jenis_instrumen' => 'Drum',
            'harga_sewa' => 25000,
        ]);
        Instrument::create([
            'nama_instrumen' => 'Bass Keyboard Roland',
            'jenis_instrumen' => 'Keyboard',
            'harga_sewa' => 20000,
        ]);
         Instrument::create([
        'nama_instrumen' => 'Bass Ibanez SR300',
        'jenis_instrumen' => 'Bass',
        'harga_sewa' => 18000,
        ]);

        Instrument::create([
            'nama_instrumen' => 'Keyboard Yamaha PSR-E373',
            'jenis_instrumen' => 'Keyboard',
            'harga_sewa' => 20000,
        ]);

        Instrument::create([
            'nama_instrumen' => 'Piano Digital Roland FP-10',
            'jenis_instrumen' => 'Piano',
            'harga_sewa' => 30000,
        ]);

        Instrument::create([
            'nama_instrumen' => 'Gitar Akustik Yamaha F310',
            'jenis_instrumen' => 'Gitar',
            'harga_sewa' => 12000,
        ]);

        Instrument::create([
            'nama_instrumen' => 'Cajon Meinl Standard',
            'jenis_instrumen' => 'Perkusi',
            'harga_sewa' => 10000,
        ]);

        Instrument::create([
            'nama_instrumen' => 'Saxophone Alto Yamaha YAS-280',
            'jenis_instrumen' => 'Saxophone',
            'harga_sewa' => 35000,
        ]);

        Instrument::create([
            'nama_instrumen' => 'Biola Yamaha V3SKA',
            'jenis_instrumen' => 'Biola',
            'harga_sewa' => 15000,
        ]);

        Instrument::create([
            'nama_instrumen' => 'Ukulele Mahalo MR1',
            'jenis_instrumen' => 'Ukulele',
            'harga_sewa' => 8000,
        ]);

        Instrument::create([
            'nama_instrumen' => 'Elektronik Drum Roland TD-1DMK',
            'jenis_instrumen' => 'Drum',
            'harga_sewa' => 28000,
        ]);

        Instrument::create([
            'nama_instrumen' => 'Mikrofon Shure SM58',
            'jenis_instrumen' => 'Audio',
            'harga_sewa' => 5000,
        ]);
        
    }
}
