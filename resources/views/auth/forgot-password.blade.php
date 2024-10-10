@extends('layouts.admin.auth')

@section('title', $title)  <!-- Make sure this line is present -->

@section('content')
<div class="content-wrapper">
    <div class="card border-primary">
        <div class="card-body">
            <h2 class="text-center">{{ $title }}</h2> <!-- Use the title variable here -->
            <form action="{{ route('password.email') }}" method="POST">
                @csrf
                <div class="mb-3">
                    <label for="email" class="form-label">Email Address</label>
                    <input type="email" class="form-control @error('email') is-invalid @enderror" id="email" name="email" required>
                    @error('email')
                        <span class="invalid-feedback" role="alert">{{ $message }}</span>
                    @enderror
                </div>
                <button type="submit" class="btn btn-primary">Send Password Reset Link</button>
            </form>
        </div>
    </div>
</div>
@endsection
