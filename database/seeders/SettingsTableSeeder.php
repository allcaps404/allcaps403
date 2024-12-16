<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;
use Illuminate\Database\Seeder;

class SettingsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('settings')->insert([
            [
                'device' => 'water_pump',
                'status' => 0,
                'automatic' => 0,
                'soilmoisture' => 30.0,
                'temperature' => 0.0,
                'humidity' => 0.0,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'device' => 'fogger',
                'status' => 0,
                'automatic' => 0,
                'soilmoisture' => 0.0,
                'temperature' => 30.0,
                'humidity' => 40.0,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]
        ]);
    }
}
