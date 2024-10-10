<?php

namespace App\Http\Controllers;

use App\Models\EnvironmentData;
use Illuminate\Http\Request;

class EnvironmentDataController extends Controller
{
    public function index()
    {
        $data = EnvironmentData::all();
        return view('environment.report', compact('data'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'temperature' => 'required|numeric',
            'humidity' => 'required|numeric',
            'soil_moisture' => 'required|numeric',
            'water_pump' => 'required|boolean',
            'fogger' => 'required|boolean',
        ]);

        EnvironmentData::create($request->all());
        return redirect()->route('environment.report')->with('success', 'Data saved successfully.');
    }
}
