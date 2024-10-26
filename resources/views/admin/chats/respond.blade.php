@extends('layouts.app')

@section('content')
<div class="container">
    <h1>ChatGPT Response</h1>
    <form action="{{ route('chats.respond.post') }}" method="POST">
        @csrf
        <div class="form-group">
            <label for="prompt">Enter your question:</label>
            <input type="text" id="prompt" name="prompt" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>

    @if(isset($response))
        <h2>Response:</h2>
        <pre>{{ json_encode($response, JSON_PRETTY_PRINT) }}</pre>
    @endif
</div>
@endsection
