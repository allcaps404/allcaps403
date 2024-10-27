<!-- @extends('layouts.app')

@section('content')
<div class="container">
    <h1>Ask ChatGPT</h1>
    <form action="{{ route('chats.respond') }}" method="POST">
        @csrf
        <div class="form-group">
            <label for="message">Your question:</label>
            <input type="text" id="message" name="message" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>

    @if(isset($response))
        <h2>Response from ChatGPT:</h2>
        <div class="alert alert-info">{{ $response }}</div>
    @endif
</div>
@endsection
 -->