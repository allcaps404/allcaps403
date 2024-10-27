<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use GuzzleHttp\Client;

class ChatController extends Controller
{
    protected $httpClient;
   
    public function __construct()
    {
        $this->httpClient = new Client([
            'base_uri' => 'https://api.openai.com/v1/',
            'headers' => [
                'Authorization' => 'Bearer ' . env('OPENAI_API_KEY'),
                'Content-Type' => 'application/json',
            ],
        ]);
    }

   public function askToChatGpt(Request $request)
    {
        $request->validate(['message' => 'required|string|max:255']);

        $message = $request->input('message');

        try {
            $response = $this->httpClient->post('chat/completions', [
                'json' => [
                    'model' => 'gpt-3.5-turbo',
                    'messages' => [
                        ['role' => 'system', 'content' => 'You are a helpful assistant.'],
                        ['role' => 'user', 'content' => $message],
                    ],
                ],
            ]);

            $chatGptResponse = json_decode($response->getBody(), true)['choices'][0]['message']['content'];
            return view('chats.respond', ['response' => $chatGptResponse]);

        } catch (\GuzzleHttp\Exception\RequestException $e) {
            \Log::error('Request Error: ' . $e->getMessage());
            return view('chats.respond', ['response' => 'Error communicating with ChatGPT.']);
        }
    }
}
