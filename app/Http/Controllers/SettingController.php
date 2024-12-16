<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Setting;
use GuzzleHttp\Client;
use Redirect;

class SettingController extends Controller
{
    public function controlDevice(Request $request)
    {
        $setting = Setting::find($request->setting_id);

        $status = $setting->status;
        $temperature = $setting->temperature;
        $humidity = $setting->humidity;
        $soilmoisture = $setting->soilmoisture;
        $automatic = $setting->automatic;

        return response()->json([
            'device' => $setting->device,
            'status' => $status,
            'temperature' => $temperature,
            'humidity' => $humidity,
            'soilmoisture' => $soilmoisture,
            'automatic' => $automatic
        ]);
    }

    public function showSettings()
    {
       $settings = Setting::OrderBy('id', 'ASC')->get();
        return view('admin.setting.index',[
            'settings' => $settings
        ]);
    }

    public function getDeviceStatus()
    {
        $waterPumpStatus = Setting::where('device', 'water_pump')->value('status') ?? 0;
        $foggerStatus = Setting::where('device', 'fogger')->value('status') ?? 0;

        return response()->json([
            'water_pump' => $waterPumpStatus,
            'fogger' => $foggerStatus,
        ], 200, [], JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK);
    }

    public function updatePumpStatus(Request $request)
    {
        $updatePumpStatus = Setting::where('id',$request->id)->first();

        if ($updatePumpStatus) {
            if ($updatePumpStatus->status == 1) {
                $updatePumpStatus->status = 0;
            }else{
               $updatePumpStatus->status = 1;
            }
            $updatePumpStatus->save();
        }
        return Redirect::back()->with('message','Successful !');
    }

    public function toggleAutomatic(Request $request, $id)
    {
        $setting = Setting::find($id);

        if ($setting) {
            $setting->automatic = !$setting->automatic;
            $setting->save();

            return response()->json(['message' => 'Automatic mode updated successfully!', 'automatic' => $setting->automatic], 200);
        }

        return response()->json(['message' => 'Setting not found!'], 404);
    }
}
