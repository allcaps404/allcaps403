<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEnvironmentDataTable extends Migration
{
    public function up()
    {
        Schema::create('environment_data', function (Blueprint $table) {
            $table->id();
            $table->float('temperature');
            $table->float('humidity');
            $table->float('soil_moisture');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('environment_data');
    }
}
