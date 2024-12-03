<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddSoilMoistureToEnvironmentDataTable extends Migration
{
    public function up()
    {
        Schema::table('environment_data', function (Blueprint $table) {
            $table->float('soil_moisture_1')->after('avg_soil_moisture');
            $table->float('soil_moisture_2')->after('soil_moisture_1');
            $table->float('soil_moisture_3')->after('soil_moisture_2');
        });
    }

    public function down()
    {
        Schema::table('environment_data', function (Blueprint $table) {
            $table->dropColumn('soil_moisture_1');
            $table->dropColumn('soil_moisture_2');
            $table->dropColumn('soil_moisture_3');
        });
    }
}
