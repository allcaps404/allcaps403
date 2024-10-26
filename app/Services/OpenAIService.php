<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;

class OpenAIService
{
    protected $apiKey;
    protected $orgId;

    public function __construct()
    {
        $this->apiKey = env('OPENAI_API_KEY');
        $this->orgId = env('OPENAI_ORG_ID');
    }

    public function chat($prompt)
    {
        $response = Http::withHeaders([
            'Authorization' => 'Bearer ' . $this->apiKey,
            'OpenAI-Organization' => $this->orgId,
        ])->post('https://api.openai.com/v1/chat/completions', [
            'model' => 'gpt-3.5-turbo',
            'messages' => [['role' => 'user', 'content' => $prompt]],
            'temperature' => 0.7,
        ]);

        return $response->json();
    }
}
