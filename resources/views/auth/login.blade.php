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
        background-color: rgba(255, 255, 255, 0.8); 
    }

    .logo-container {
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .logo-container img {
        width: 90px;
        height: auto;
        margin-right: 15px;
    }

    .logo-text {
        font-size: 45px; 
        font-weight: 700; 
        color: #2C3E50;
        letter-spacing: 2px;
        font-family: 'Poppins', sans-serif;
        text-transform: uppercase;
        text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.15);
        background: linear-gradient(135deg, #6dd5ed, #2193b0);
        -webkit-background-clip: text;
        color: transparent;
        padding: 5px 10px;
        border-radius: 5px;
    }

    @media (max-width: 768px) {
        .content-wrapper {
            width: 90%;
            max-width: 100%;
            padding: 10px;
            transform: translate(-50%, -40%); 
        }

        .logo-container img {
            width: 70px;
            margin-right: 10px;
        }

        .logo-text {
            font-size: 30px;
        }

        .mb-3.row label {
            text-align: left; 
        }

        .col-md-4, .col-md-6 {
            flex: 0 0 100%;
            max-width: 100%;
        }

        .btn {
            width: 50%;
            max-width: 150px;
            margin: 0 auto;
            display: block;
        }

        .card-body {
            padding: 10px;
        }
    }
</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<div class="content-wrapper">
    <div class="card border-primary">
        <div class="card-body text-center">
            <div class="logo-container">
                <img src="{{ asset('images/mylogo.png') }}" alt="Logo">
                <span class="logo-text">SeedLoom</span>
            </div>
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
                <div class="mb-3 row">
                    <input type="submit" class="col-md-3 offset-md-5 btn bg-primary" value="Login">
                </div>
            </form>
        </div>
    </div>
</div>

@endsection
