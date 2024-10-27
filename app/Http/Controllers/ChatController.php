<?php

namespace App\Http\Controllers;

use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log; // Make sure to import Log
use App\Http\Controllers\Controller;

class ChatController extends Controller
{
    protected $huggingFaceKey;
    protected $huggingFaceEndpoint;

    public function __construct()
    {
        $this->huggingFaceKey = env('HUGGINGFACE_API_KEY');
        $this->huggingFaceEndpoint = 'https://api-inference.huggingface.co/models/roberta-large-squad2'; // Set the model here
    }

    public function chat(Request $request)
    {
        $client = new Client();
        $retryCount = 0;
        $maxRetries = 3;

        Log::info('Chat request received', [
            'request_body' => $request->all(),
        ]);

        while ($retryCount < $maxRetries) {
            try {
                Log::info('Making API request to Hugging Face', [
                    'request_body' => $request->all(),
                ]);

                $response = $client->post($this->huggingFaceEndpoint, [
                    'headers' => [
                        'Authorization' => 'Bearer ' . $this->huggingFaceKey, // Use the correct key here
                        'Content-Type' => 'application/json',
                    ],
                    'json' => [
                        'inputs' => $request->input('prompt'),
                    ],
                ]);

                Log::info('API Response received', [
                    'status_code' => $response->getStatusCode(),
                    'body' => json_decode($response->getBody()->getContents()),
                ]);

                return $response->getBody()->getContents();
            } catch (\GuzzleHttp\Exception\ClientException $e) {
                $responseBody = $e->getResponse()->getBody()->getContents();
                Log::error('API Request Failed: ', [
                    'status_code' => $e->getResponse()->getStatusCode(),
                    'response_body' => json_decode($responseBody),
                    'request_body' => $request->all()
                ]);

                if ($e->getResponse()->getStatusCode() === 429 && $retryCount < $maxRetries) {
                    sleep(pow(2, $retryCount)); // Exponential backoff
                    $retryCount++;
                } else {
                    return response()->json(['error' => json_decode($responseBody)], $e->getResponse()->getStatusCode());
                }
            }
        }

        return response()->json(['error' => 'Exceeded retry limit due to rate limits. Please try again later.'], 429);
    }
}
