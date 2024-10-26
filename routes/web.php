<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginRegisterController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\EnvironmentDataController;
use App\Http\Controllers\Auth\PasswordResetLinkController;
use App\Http\Controllers\Auth\NewPasswordController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return redirect('/login');
});

Route::controller(LoginRegisterController::class, '')->group(function () {
    Route::get('/register', 'register')->name('register');
    Route::post('/store', 'store')->name('store');
    Route::post('/authenticate', 'authenticate')->name('authenticate');
    Route::get('/logout', 'logout')->name('logout');
});

Route::get('/login', [LoginRegisterController::class, 'login'])->name('login')->middleware('guest');

Route::prefix('dashboard')->middleware(['auth'])->group(function(){
    Route::get('/', [DashboardController::class, 'login'])->name('dashboard');
});

Route::prefix('user-management')->group(function () {
    Route::get('report', [UserController::class, 'viewReport'])->name('report');
    Route::get('environment/report', [EnvironmentDataController::class, 'index'])->name('environment.report');
    Route::get('environment/export', [EnvironmentDataController::class, 'export'])->name('environment.export');
    Route::get('/log/store', [EnvironmentDataController::class, 'store'])->name('environment.store');
    Route::get('environment/chart', [EnvironmentDataController::class, 'viewChart'])->name('environment.chart');

     Route::get('environment/export/excel', [EnvironmentDataController::class, 'exportExcel'])->name('environment.export.excel');
    Route::get('environment/export/csv', [EnvironmentDataController::class, 'exportCSV'])->name('environment.export.csv');
});

use App\Http\Controllers\Auth\LoginController;

Route::get('/auth/redirect/{provider}', [LoginController::class, 'redirectToProvider']);
Route::get('/auth/callback/{provider}', [LoginController::class, 'handleProviderCallback']);

// // Password Reset Routes
// Route::get('forgot-password', [PasswordResetLinkController::class, 'create'])
//     ->name('password.request');
// Route::post('forgot-password', [PasswordResetLinkController::class, 'store'])
//     ->name('password.email');
// Route::get('reset-password/{token}', [NewPasswordController::class, 'create'])
//     ->name('password.reset');
// Route::post('reset-password', [NewPasswordController::class, 'store'])
//     ->name('password.update');