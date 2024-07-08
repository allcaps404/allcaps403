<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginRegisterController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\UserController; // Import UserController

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
    Route::get('students', [UserController::class, 'viewStudents'])->name('students');
    Route::get('faculty', [UserController::class, 'viewFaculty'])->name('faculty');
    Route::get('staff', [UserController::class, 'viewStaff'])->name('staff');
    Route::get('add-user', [UserController::class, 'addUser'])->name('add-user');
    Route::get('edit-user/{id}', [UserController::class, 'editUser'])->name('edit-user');
    Route::post('update-user/{id}', [UserController::class, 'updateUser'])->name('update-user');
    Route::get('delete-user/{id}', [UserController::class, 'deleteUser'])->name('delete-user');
});

use App\Http\Controllers\Auth\LoginController;

Route::get('/auth/redirect/{provider}', [LoginController::class, 'redirectToProvider']);
Route::get('/auth/callback/{provider}', [LoginController::class, 'handleProviderCallback']);
