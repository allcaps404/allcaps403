<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\EnvironmentData;
use App\Http\Controllers\Auth;

class DashboardController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $user = auth()->user();
        $userCount = User::count();

        return view('admin.dashboard.default', compact('user', 'userCount'));
    }
    
    public function getDashboardData()
    {
        return EnvironmentData::OrderBy('created_at', 'DESC')->first();
    }
}
