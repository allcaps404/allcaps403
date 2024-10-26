<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\EnvironmentData;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function viewReport()
    {
        $data = EnvironmentData::all();

        $data = EnvironmentData::paginate(10);

        return view('admin.users.reports', compact('data'));
    }
}
?>
