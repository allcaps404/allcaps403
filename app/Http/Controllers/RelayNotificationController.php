<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Notification;
use App\Notifications\RelayTriggeredNotification;

class RelayNotificationController extends Controller
{
    public function store(Request $request)
    {
        \Log::info('Request Method:', context: ['method' => $request->method()]);
        \Log::info('Request Data:', $request->all());
        
        $validated = $request->validate([
            'message' => 'required|string',
            'relay' => 'required|string',
            'temperature' => 'required|numeric',
            'humidity' => 'required|numeric',
            'soil_moisture' => 'required|numeric',
        ]);

        $recipients = User::whereIn('role', ['admin', 'user'])->get();

        foreach ($recipients as $user) {
            Notification::create([
                'type' => 'App\Notifications\RelayTriggeredNotification',
                'notifiable_type' => 'App\Models\User',
                'notifiable_id' => $user->id,
                'data' => json_encode($validated),
            ]);
        }

        return response()->json(['message' => 'Notifications sent to all users'], 200);
    }

    public function markAsRead($notificationId)
    {
        $notification = Auth::user()->notifications()->find($notificationId);

        if ($notification) {
            $notification->markAsRead();
        }

        return response()->json(['message' => 'Notification marked as read'], 200);
    }

    public function create(Request $request)
    {
        $notification = new Notification;
        $notification->message = $request->message;
        $notification->save();

        return response()->json([
            'success' => true,
            'notification' => $notification,
        ]);
    }

    public function deleteNotification($notificationId)
    {
        $notification = Auth::user()->notifications()->find($notificationId);

        if ($notification) {
            $notification->delete(); 
        }

        return response()->json(['message' => 'Notification deleted'], 200);
    }
}
