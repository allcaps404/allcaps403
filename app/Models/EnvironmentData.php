<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EnvironmentData extends Model
    {
        use HasFactory;

        protected $table = 'environment_data';

        protected $fillable = ['temperature', 'humidity', 'avg_soil_moisture', 'soil_moisture_1', 'soil_moisture_2', 'soil_moisture_3'];
    }
?>