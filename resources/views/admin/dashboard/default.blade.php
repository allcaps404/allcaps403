@extends('layouts.admin.index')

@section('content')
<div class="content-wrapper" style="background: linear-gradient(to bottom right, #e0ffe0, #f0f8e2); padding: 20px; border-radius: 8px;">
    <div class="row mb-4">
        <div class="col-12 text-center">
            <h3 class="font-weight-bold">Agriculture Dashboard</h3>
            <p>Welcome back, {{ $user->name }}</p>
        </div>            
    </div>

    <div class="row">
        <!-- Total Users Card -->
        <div class="col-12 col-md-6 col-lg-4 mb-4">
            <div class="card shadow-sm" style="background-color: #8BC34A; color: #fff;">
                <div class="card-body text-center">
                    <h4 class="card-title"><i class="fas fa-users"></i> Total Users</h4>
                    <h2 class="display-4">{{ $userCount }}</h2>
                </div>
            </div>
        </div>

        <!-- Seedling Health Card -->
        <div class="col-12 col-md-6 col-lg-4 mb-4">
            <div class="card shadow-sm" style="background-color: #FF9800; color: #fff;">
                <div class="card-body text-center">
                    <h4 class="card-title"><i class="fas fa-seedling"></i> Seedling </h4>
                    <h2 class="display-4"></h2>
                </div>
            </div>
        </div>

        <!-- Soil Moisture Card -->
        <div class="col-12 col-md-6 col-lg-4 mb-4">
            <div class="card shadow-sm" style="background-color: #2196F3; color: #fff;">
                <div class="card-body text-center">
                    <h4 class="card-title"><i class="fas fa-fire"></i> Heat Index</h4>
                    <h2 class="display-4"></h2>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
