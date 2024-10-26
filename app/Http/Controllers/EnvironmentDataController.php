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
        return view('admin.users.reports', compact('data'));
    }

    public function viewChart(Request $request)
    {
        $data = EnvironmentData::paginate($this->perPage);
        return view('admin.users.chart', compact('data'));
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

     public function exportExcel(Request $request)
    {
        // Get the current page data
        $currentPageData = EnvironmentData::paginate(10)->getCollection();

        return Excel::download(new EnvironmentDataExport($currentPageData), 'environment_data.xlsx');
    }

    // Method to handle the export as CSV
    public function exportCSV(Request $request)
    {
        // Get the current page data
        $currentPageData = EnvironmentData::paginate(10)->getCollection();

        return Excel::download(new EnvironmentDataExport($currentPageData), 'environment_data.csv');
    }
}
?>
