<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EnvironmentDataController;
use App\Http\Controllers\RelayNotificationController;
// use App\Http\Controllers\SettingController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::prefix('logs')->group(function () {
    Route::post('/log/store', [EnvironmentDataController::class, 'store'])->name('environment.store');
    Route::get('/latest-environment-data', [EnvironmentDataController::class, 'getLatestData']);

});
// Route::get('/settings/{setting_id}', [SettingController::class, 'controlDevice'])->name('settings.control');

Route::post('/notifications/relay', [RelayNotificationController::class, 'store']);


