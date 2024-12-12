<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\EnvironmentDataController;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\RelayNotificationController;


/*
|----------------------------------------------------------------------
| Web Routes
|----------------------------------------------------------------------
| Here is where you can register web routes for your application.
| Routes are loaded by the RouteServiceProvider and assigned to the "web" middleware group.
|----------------------------------------------------------------------
*/

Route::get('/', function () {
    return redirect('/login');
});

// Authentication routes
Route::controller(LoginController::class)->group(function () {
    Route::post('/store', 'store')->name('store');
    Route::post('/authenticate', 'authenticate')->name('authenticate');
    Route::get('/logout', 'logout')->name('logout');
    Route::get('/login', 'login')->name('login')->middleware('guest');
});

// Dashboard route (accessible to authenticated users)
Route::prefix('dashboard')->middleware(['auth'])->group(function () {
    Route::get('/', [DashboardController::class, 'index'])->name('admin.dashboard');
    Route::get('/dashboard-data', [DashboardController::class, 'getDashboardData'])->name('dashboard.getDashboardData');
});

// User management and log routes (restricted to admin role)
Route::middleware(['auth'])->group(function () {
    Route::get('log', [UserController::class, 'viewReport'])->name('log');
    Route::middleware(['role:admin'])->group(function () {
        Route::resource('users', UserController::class);
    });
    Route::get('users', [UserController::class, 'index'])->name('users.index');
});

Route::prefix('environment')->middleware('auth')->group(function () {
    Route::get('log', [EnvironmentDataController::class, 'index'])->name('environment.log');
    Route::get('chart', [EnvironmentDataController::class, 'viewChart'])->name('environment.chart');
    Route::post('export/excel', [EnvironmentDataController::class, 'exportEXCEL'])->name('environment.export.excel');
    Route::get('export/chart', [EnvironmentDataController::class, 'exportChart'])->name('environment.export.chart');
    Route::get('/check-arduino-response', [EnvironmentDataController::class, 'checkArduinoResponse'])->name('check.arduino.response');

});

//Settings routes (accessible to authenticated users)
// Route::middleware('auth')->group(function () {
//     Route::get('/settings/update/{id}', [SettingController::class, 'updatePumpStatus'])->name('settings.update.pump');
//     Route::get('/settings', [SettingController::class, 'showSettings'])->name('settings.index');
//     Route::post('/settings/control', [SettingController::class, 'controlDevice'])->name('settings.control');
// });

Route::post('/notifications/{notificationId}/read', [RelayNotificationController::class, 'markAsRead']);
Route::delete('/notifications/{notificationId}/delete', [RelayNotificationController::class, 'deleteNotification']);

// OAuth routes
Route::get('/auth/redirect/{provider}', [LoginController::class, 'redirectToProvider']);
Route::get('/auth/callback/{provider}', [LoginController::class, 'handleProviderCallback']);
