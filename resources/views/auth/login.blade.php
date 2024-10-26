@extends('layouts.admin.auth')

@section('content')

<style>
     body, html {
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100%;
        overflow: hidden;
        background-color: lightblue;
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

    .register-link {
        font-weight: bold;
        text-decoration: none;
        color: #007bff; /* Bootstrap primary color */
    }

    .register-link:hover {
        text-decoration: underline; /* Underline on hover */
    }

    .register-icon {
        margin-right: 5px; /* Space between icon and text */
    }
</style>

<video autoplay muted loop class="video-background">
    <source src="{{ asset('videos/slsubc.mp4') }}" type="video/mp4">
</video>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<div class="content-wrapper">
    <div class="card border-primary">
        <div class="card-body text-center">
            <img src="{{ asset('images/slsulogo.png') }}" alt="Logo" style="width: 300px; height: auto;">
        </div>
        <div class="card-body">
            <form action="{{ route('authenticate') }}" method="post">
                @csrf
                <div class="mb-3 row">
                    <label for="email" class="col-md-4 col-form-label text-md-end text-start">Username:</label>
                    <div class="col-md-6">
                        <input type="email" class="form-control input-sm @error('email') is-invalid @enderror" id="email" name="email" value="{{ old('email') }}" aria-describedby="emailHelp">
                        @error('email')
                            <span class="invalid-feedback" role="alert">{{ $message }}</span>
                        @enderror
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="password" class="col-md-4 col-form-label text-md-end text-start">Password:</label>
                    <div class="col-md-6">
                        <input type="password" class="form-control @error('password') is-invalid @enderror" id="password" name="password" aria-describedby="passwordHelp">
                        @error('password')
                            <span class="invalid-feedback" role="alert">{{ $message }}</span>
                        @enderror
                    </div>
                </div>
                <div class="mb-3 row" >
                    <input type="submit" class="col-md-3 offset-md-5 btn bg-primary" value="Login">
                </div>
                  <div class="mb-3 row">
                    <div class="col-md-12 text-center">
                        <a href="{{ route('register') }}" class="register-link">
                            <i class="fas fa-user-plus register-icon"></i> Register Here!
                        </a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection
