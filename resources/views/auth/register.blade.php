@extends('layouts.admin.auth')

@section('content')

<div class="row justify-content-center mt-5">
    <div class="col-md-6">
        <div class="card">
            <div class="card-header bg-primary">Register Here!</div>
            <div class="card-body">
                <form action="{{ route('store') }}" method="post">
                    @csrf
                    <div class="mb-3 row">
                        <label for="name" class="col-md-4 col-form-label text-md-end text-start">Name:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control @error('name') is-invalid @enderror" id="name" name="name" value="{{ old('name') }}">
                            @error('name')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="email" class="col-md-4 col-form-label text-md-end text-start">Email Address:</label>
                        <div class="col-md-6">
                            <input type="email" class="form-control @error('email') is-invalid @enderror" id="email" name="email" value="{{ old('email') }}">
                            @error('email')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="password" class="col-md-4 col-form-label text-md-end text-start">Password:</label>
                        <div class="col-md-6">
                            <input type="password" class="form-control @error('password') is-invalid @enderror" id="password" name="password">
                            @error('password')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="password_confirmation" class="col-md-4 col-form-label text-md-end text-start">Confirm Password:</label>
                        <div class="col-md-6">
                            <input type="password" class="form-control" id="password_confirmation" name="password_confirmation">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <input type="submit" class="col-md-3 offset-md-5 btn btn-primary" value="Register">
                    </div>

                    <!-- Continue Sign in with Icons -->
                    <p class="text-center">or</p>
                    <p class="text-center"       style="color: blue;">Continue Sign in with:</p>
                    <div class="row justify-content-center" style="margin-top: 20px;">
                        <div class="col-md-12 text-center">
                            <a href="{{ url('/auth/redirect/google') }}" class="btn btn-google btn-sm" style="display: inline-block; width: 50px; margin-right: 10px;">
                                <img src="{{ asset('images/icon/google-icon.png') }}" alt="Google Icon" style="max-width: 30px;"> 
                            </a>
                            <a href="{{ url('/auth/redirect/facebook') }}" class="btn btn-facebook btn-sm" style="display: inline-block; width: 50px; margin-right: 10px;">
                                <img src="{{ asset('images/icon/facebook-icon.png') }}" alt="Facebook Icon" style="max-width: 30px;">
                            </a>
                            <a href="{{ url('/auth/redirect/github') }}" class="btn btn-github btn-sm" style="display: inline-block; width: 50px; margin-right: 10px;">
                                <img src="{{ asset('images/icon/github-icon.png') }}" alt="GitHub Icon" style="max-width: 30px;">
                            </a>
                        </div>
                    </div>
                    <!-- End of Continue Sign in with Icons -->

                </form>
            </div>
        </div>
    </div>
</div>

@endsection
