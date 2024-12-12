@extends('layouts.admin.index')

@section('styles')
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOMT3z1b6SxXW/s6I0qVn5cR/Hgx3nEPhLIFvka" crossorigin="anonymous">
@endsection

@section('content')
<div class="content-wrapper" style="background: linear-gradient(to bottom right, #e0ffe0, #f0f8e2); padding: 20px; border-radius: 8px;">
    <div class="row mb-4">
        <div class="col-12 text-center">
            <h3 class="font-weight-bold">Agriculture Dashboard</h3>
            <p>Welcome back, {{ $user->name }}</p>
        </div>            
    </div>

    <div class="row">
        <div class="col-12 col-md-6 col-lg-3 mb-3">
            <a href="{{ route('users.index') }}" style="text-decoration: none;">
                <div class="card shadow-sm" style="background-color: #8BC34A; color: #fff;">
                    <div class="card-body text-center">
                        <h5 class="card-title"><i class="fas fa-users"></i> Total Users</h5>
                        <h4 class="display-6">{{ $userCount }}</h4>
                    </div>
                </div>
            </a>
        </div>

        <!-- Temperature Card -->
        <div class="col-12 col-md-6 col-lg-3 mb-3">
            <div class="card shadow-sm" style="background-color: #FF9800; color: #fff;">
                <div class="card-body text-center">
                    <h5 class="card-title"><i class="fas fa-temperature-high"></i> Temperature</h5>
                    <h4 class="display-6" id="displayTemperature"></h4>
                </div>
            </div>
        </div>

        <!-- Humidity Card -->
        <div class="col-12 col-md-6 col-lg-3 mb-3">
            <div class="card shadow-sm" style="background-color: #009688; color: #fff;">
                <div class="card-body text-center">
                    <h5 class="card-title"><i class="fas fa-water"></i> Humidity</h5>
                    <h4 class="display-6" id="displayHumidity"></h4>
                </div>
            </div>
        </div>

        <!-- Soil Moisture Average Card -->
        <div class="col-12 col-md-6 col-lg-3 mb-3">
            <div class="card shadow-sm" style="background-color: #2196F3; color: #fff;">
                <div class="card-body text-center">
                    <h5 class="card-title"><i class="fas fa-tint"></i> Average Soil Moisture</h5>
                    <h4 class="display-6" id="displaySoilMoisture"></h4>
                </div>
            </div>
        </div>

        <!-- Individual Soil Moisture Cards -->
        <div class="col-12 col-md-4 col-lg-3 mb-3">
            <div class="card shadow-sm" style="background-color: #4CAF50; color: #fff;">
                <div class="card-body text-center">
                    <h5 class="card-title"><i class="fas fa-tint"></i> Soil Moisture 1</h5>
                    <h4 class="display-6" id="displaySoilMoisture1"></h4>
                </div>
            </div>
        </div>

        <div class="col-12 col-md-4 col-lg-3 mb-3">
            <div class="card shadow-sm" style="background-color: #FF5722; color: #fff;">
                <div class="card-body text-center">
                    <h5 class="card-title"><i class="fas fa-tint"></i> Soil Moisture 2</h5>
                    <h4 class="display-6" id="displaySoilMoisture2"></h4>
                </div>
            </div>
        </div>

        <div class="col-12 col-md-4 col-lg-3 mb-3">
            <div class="card shadow-sm" style="background-color: #00BCD4; color: #fff;">
                <div class="card-body text-center">
                    <h5 class="card-title"><i class="fas fa-tint"></i> Soil Moisture 3</h5>
                    <h4 class="display-6" id="displaySoilMoisture3"></h4>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script')
<script src="{{ asset('assets/js/jquery-3.6.0.min.js') }}"></script>
    <script type="text/javascript">
    $.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});
    
function fetchTemperature() {
    $.ajax({
        method: "GET",
        url: `{{ route('dashboard.getDashboardData') }}`,
        success: function(response) {
            console.log(response);
            $('#displayTemperature').text(response.temperature + "°C");
            $('#displayHumidity').text(response.humidity + "°%");
            $('#displaySoilMoisture').text(response.avg_soil_moisture + "%");
            $('#displaySoilMoisture1').text(response.soil_moisture_1 + "%");
            $('#displaySoilMoisture2').text(response.soil_moisture_2 + "%");
            $('#displaySoilMoisture3').text(response.soil_moisture_3 + "%");
        }
    });
}
setInterval(fetchTemperature, 1000);
</script>
@endpush
