<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddAvgSoilMoistureToEnvironmentDataTable extends Migration
{
    public function up()
    {
        Schema::table('environment_data', function (Blueprint $table) {
            $table->integer('avg_soil_moisture')->after('humidity');
        });
    }

    public function down()
    {
        Schema::table('environment_data', function (Blueprint $table) {
            $table->dropColumn('avg_soil_moisture');
        });
    }
}
