@extends('layouts.admin.auth')

@section('content')

<style>
    body, html {
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100%;
        overflow: hidden;
    }

    .video-background {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
        z-index: -1;
    }

    .content-wrapper {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 1;
        width: 100%;
        max-width: 500px;
        padding: 20px;
    }

    .card {
        background-color: rgba(255, 255, 255, 0.8); /* Make the card slightly transparent */
    }
</style>

<video autoplay muted loop class="video-background">
    <source src="{{ asset('videos/slsubc.mp4') }}" type="video/mp4">
    Your browser does not support the video tag.
</video>

<div class="content-wrapper">
    <div class="card border-primary">
        <div class="card-body text-center">
            <img src="{{ asset('images/bitslog.png') }}" alt="Logo" style="width: 300px; height: auto;">
        </div>
        <div class="card-body">
            <form action="{{ route('authenticate') }}" method="post">
                @csrf
                <div class="mb-3 row">
                    <label for="email" class="col-md-4 col-form-label text-md-end text-start">Username:</label>
                    <div class="col-md-6">
                        <input type="email" class="form-control input-sm @error('email') is-invalid @enderror" id="email" name="email" value="{{ old('email') }}">
                        @if ($errors->has('email'))
                            <span class="text-danger">{{ $errors->first('email') }}</span>
                        @endif
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="password" class="col-md-4 col-form-label text-md-end text-start">Password:</label>
                    <div class="col-md-6">
                        <input type="password" class="form-control @error('password') is-invalid @enderror" id="password" name="password">
                        @if ($errors->has('password'))
                            <span class="text-danger">{{ $errors->first('password') }}</span>
                        @endif
                    </div>
                </div>
                <div class="mb-3 row">
                    <input type="submit" class="col-md-3 offset-md-5 btn bg-primary" value="Login">
                </div>
                <div class="my-2 d-flex justify-content-between align-items-center">
                    <!-- Add any additional content here -->
                </div>
            </form>
        </div>
    </div>
</div>

@endsection
