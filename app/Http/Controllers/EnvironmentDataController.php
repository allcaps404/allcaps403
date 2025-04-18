<?php
namespace App\Http\Controllers;

use App\Exports\EnvironmentDataExport;
use App\Models\EnvironmentData;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use Symfony\Component\HttpFoundation\StreamedResponse;
use Carbon\Carbon;
use Barryvdh\DomPDF\Facade as PDF;
use Illuminate\Support\Facades\Storage;


class EnvironmentDataController extends Controller
{
    private $perPage = 30;

    public function index(Request $request)
    {
        $data = EnvironmentData::where('created_at', '>=', Carbon::now()->subMinute())
        ->orderBy('created_at', 'desc')
        ->paginate($this->perPage);
        return view('admin.logs.log', compact('data'));
    }

    public function viewChart(Request $request)
    {
        $data = EnvironmentData::where('created_at', '>=', Carbon::now()->subMinute())
        ->orderBy('created_at', 'desc')
        ->paginate($this->perPage);
        return view('admin.logs.chart', compact('data'));
    }

   public function store(Request $request)
    {

        $currentDate = Carbon::now();
        
        // EnvironmentData::whereDate('created_at', '<', $currentDate->toDateString())->delete();

        \Log::debug('Incoming request data: ', $request->all());
        $saveData = new EnvironmentData;
        $saveData->temperature = $request->temperature;
        $saveData->humidity = $request->humidity;
        $saveData->avg_soil_moisture = $request->avg_soil_moisture;
        $saveData->soil_moisture_1 = $request->soil_moisture_1;
        $saveData->soil_moisture_2 = $request->soil_moisture_2;
        $saveData->soil_moisture_3 = $request->soil_moisture_3;

        if ($saveData->save()) {
            \Log::info('Data saved: ', $saveData->toArray());
            return response()->json(['success' => true, 'data' => $saveData], 201);
        }
    }

    public function exportExcel(Request $request)
    {
        $request->validate([
            'filename' => 'required|string',
            'pages' => 'required|string',
        ]);

        $pagesInput = explode(',', $request->input('pages'));
        $pages = array_filter($pagesInput, function ($page) {
            return is_numeric($page) && $page > 0;
        });

        if (empty($pages)) {
            return back()->with('error', 'Please enter valid page numbers.');
        }

        $data = collect();
        foreach ($pages as $page) {
            $offset = ($page - 1) * $this->perPage;
            $pageData = EnvironmentData::skip($offset)
                ->take($this->perPage)
                ->get(['temperature', 'humidity', 'avg_soil_moisture', 'created_at']);
            $data = $data->merge($pageData);
        }

        if ($data->isEmpty()) {
            return back()->with('error', 'No data available for the selected pages.');
        }

        $filename = $request->input('filename') . '.xlsx';

        session()->flash('filename', $filename);
        
        return Excel::download(new EnvironmentDataExport($data), $filename);
    }
      
        
    public function exportChart(Request $request)
    {
        $imageData = $request->input('image');
        $image = Image::make($imageData);

        $fileName = 'chart-' . time() . '.png';
        
        $imagePath = 'charts/' . $fileName;
        Storage::disk('public')->put($imagePath, $image->encode());

        return response()->json(['downloadUrl' => Storage::url($imagePath)]);
    }
}