<?php

namespace App\Http\Controllers;

use App\Services\ChatGPTService;
use Illuminate\Http\Request;

class ChatController extends Controller
{
    protected $OpenAIService;

    public function __construct(ChatGPTService $OpenAIService)
    {
        $this->OpenAIService = $OpenAIService;
    }

    public function respond(Request $request)
    {
        $request->validate([
            'prompt' => 'required|string|max:255',
        ]);

        $prompt = $request->input('prompt');
        $response = $this->OpenAIService->chat($prompt);

        return view('respond', ['response' => $response]);
    }
}
