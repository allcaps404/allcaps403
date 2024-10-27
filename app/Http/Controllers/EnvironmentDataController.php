<?php
namespace App\Http\Controllers;

use App\Exports\EnvironmentDataExport;
use App\Models\EnvironmentData;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use Symfony\Component\HttpFoundation\StreamedResponse;
use Carbon\Carbon;


class EnvironmentDataController extends Controller
{
    private $perPage = 10;

    public function index(Request $request)
    {
        $data = EnvironmentData::paginate($this->perPage);
        return view('admin.logs.log', compact('data'));
    }

    public function viewChart(Request $request)
    {
        $data = EnvironmentData::paginate($this->perPage);
        return view('admin.logs.chart', compact('data'));
    }

   public function store(Request $request)
    {
        $currentMonth = Carbon::now()->month;

        EnvironmentData::whereMonth('created_at', '<>', $currentMonth)->delete();

        \Log::debug('Incoming request data: ', $request->all());

        $validated = $request->validate([
            'temperature' => 'required|numeric',
            'humidity' => 'required|numeric',
            'soil_moisture' => 'required|numeric',
        ]);

        $environmentData = EnvironmentData::create($validated);
        \Log::info('Data saved: ', $environmentData->toArray());

        return response()->json(['success' => true, 'data' => $environmentData], 201);
    }

       public function exportCSV(Request $request)
    {
        // Validate the filename
        $request->validate([
            'filename' => 'required|string|max:255',
        ]);

        // Get the current page
        $currentPage = $request->input('page', 1);
        
        // Fetch all data for export
        $data = EnvironmentData::all(); // Fetch all data

        // Filter data based on the current page
        $currentPageData = $data->forPage($currentPage, $this->perPage); // Ensure this is correct

        // Use the user-defined filename and append .csv
        $filename = $request->input('filename') . '.csv';

        return Excel::download(new EnvironmentDataExport($currentPageData), $filename);
    }
}