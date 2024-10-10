<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEnvironmentDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('environment_data', function (Blueprint $table) {
            $table->id();
            $table->decimal('temperature', 5, 2); // Example: 25.50
            $table->decimal('humidity', 5, 2);    // Example: 60.00
            $table->decimal('soil_moisture', 5, 2); // Example: 30.00
            $table->boolean('water_pump')->default(false); // On/Off
            $table->boolean('fogger')->default(false);     // On/Off
            $table->timestamps(); // created_at and updated_at
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('environment_data');
    }
}
