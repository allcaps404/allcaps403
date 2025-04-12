@extends('layouts.admin.index')

@section('content')
<div class="content-wrapper">
    <div class="row mb-4">
        <div class="col-12">
            <h3 class="font-weight-bold mb-3">Settings</h3>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            @if(session('success'))
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    {{ session('success') }}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            @endif
            @if(session('error'))
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    {{ session('error') }}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            @endif

            <!-- Device Status Table -->
            <div class="table-responsive shadow-sm">
                <table class="table table-hover table-bordered text-center align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>Device</th>
                            <th>Status</th>
                            <th>Automatic</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php
                            $devices = [
                                ['name' => 'Water Pump', 'key' => 'water_pump'],
                                ['name' => 'Fogger', 'key' => 'fogger'],
                            ];
                        @endphp

                        @foreach ($devices as $device)
                            @php
                                $setting = $settings->where('device', $device['key'])->first();
                                $status = $setting ? $setting->status : 0;
                                $automatic = $setting ? $setting->automatic : 0;
                                $id = $setting ? $setting->id : null;
                            @endphp
                            <tr>
                                <td>{{ $device['name'] }}</td>
                                <td>
                                    <span class="badge bg-{{ $status ? 'success' : 'danger' }}">
                                        {{ $status ? 'On' : 'Off' }}
                                    </span>
                                </td>
                                <td>
                                    <span class="badge bg-{{ $automatic ? 'info' : 'secondary' }}">
                                        {{ $automatic ? 'Enabled' : 'Disabled' }}
                                    </span>
                                </td>
                                <td>
                                    @if ($id)
                                        <button data-id="{{ $id }}" data-status="{{ $status }}" 
                                            class="status_update btn btn-outline-{{ $status ? 'danger' : 'success' }} btn-sm">
                                            {{ $status ? 'Turn Off' : 'Turn On' }}
                                        </button>
                                        <button data-id="{{ $id }}" data-automatic="{{ $automatic }}"
                                            class="automatic_toggle btn btn-outline-{{ $automatic ? 'secondary' : 'info' }} btn-sm">
                                            {{ $automatic ? 'Disable Auto' : 'Enable Auto' }}
                                        </button>
                                    @else
                                        <span class="text-muted">No data</span>
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>

            <div class="card mt-4 shadow-sm" style="max-width: 600px; margin: auto;">
            <div class="card-header">
                <h5 class="mb-0 text-center">Sensor Values Settings</h5>
            </div>
            <div class="card-body p-3">
            <form id="sensor-settings-form">
                @csrf
                @if(isset($settings) && count($settings) > 0)
                    @php $firstSetting = $settings->first(); @endphp
                    <div class="row g-2">
                        <div class="col-4">
                            <label class="form-label fw-semibold text-center w-100">Soil Moisture</label>
                            <div class="input-group">
                                <input type="number" class="form-control form-control-sm text-center soilmoisture_input"
                                    data-id="{{ $firstSetting->id }}" 
                                    value="{{ $firstSetting->soilmoisture }}"
                                    style="max-width: 80px;">
                                <span class="input-group-text">%</span>
                            </div>
                        </div>
                        <div class="col-4">
                            <label class="form-label fw-semibold text-center w-100">Temperature</label>
                            <div class="input-group">
                                <input type="number" class="form-control form-control-sm text-center temperature_input"
                                    data-id="{{ $firstSetting->id }}" 
                                    value="{{ $firstSetting->temperature }}"
                                    style="max-width: 80px;">
                                <span class="input-group-text">°C</span>
                            </div>
                        </div>
                        <div class="col-4">
                            <label class="form-label fw-semibold text-center w-100">Humidity</label>
                            <div class="input-group">
                                <input type="number" class="form-control form-control-sm text-center humidity_input"
                                    data-id="{{ $firstSetting->id }}" 
                                    value="{{ $firstSetting->humidity }}"
                                    style="max-width: 80px;">
                                <span class="input-group-text">%</span>
                            </div>
                        </div>
                    </div>
                <div class="mb-2 mt-3" style="margin-left: auto; width: fit-content;">
                    <button type="submit" class="btn btn-primary btn-sm" style="margin-left: 10px;">Save Settings</button>
                </div>
            @else
                <p class="text-muted text-center">No settings available.</p>
            @endif
        </form>
    </div>
</div>


        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    $(document).ready(function() {
        $('.status_update').on('click', function(e) {
            e.preventDefault();
            
            var id = $(this).data('id');
            
            $.ajax({
                method: 'GET',
                url: '/settings/update/' + id, 
                success: function(response) {
                    location.reload();
                },
                error: function(xhr, status, error) {
                    alert('An error occurred in Laravel: ' + error);
                }
            });
        });

        $('.automatic_toggle').on('click', function(e) {
            e.preventDefault();
            
            var id = $(this).data('id');
            
            $.ajax({
                method: 'GET',
                url: '/settings/toggle-automatic/' + id,
                success: function(response) {
                    location.reload();
                },
                error: function(xhr, status, error) {
                    alert('An error occurred in Laravel: ' + error);
                }
            });
        });

        $('#sensor-settings-form').on('submit', function(e) {
            e.preventDefault();

            var id = $('.soilmoisture_input').data('id');
            var soilmoisture = $('.soilmoisture_input').val();
            var temperature = $('.temperature_input').val();
            var humidity = $('.humidity_input').val();

            $.ajax({
                url: '/settings/update-values/' + id,
                method: 'POST',
                data: {
                    _token: "{{ csrf_token() }}",
                    soilmoisture: soilmoisture,
                    temperature: temperature,
                    humidity: humidity
                },
                success: function(response) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Updated!',
                        text: response.message,
                        showConfirmButton: false,
                        timer: 2000
                    });
                },
                error: function(xhr) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error!',
                        text: 'Failed to update values.',
                        showConfirmButton: true
                    });
                }
            });
        });
    });
</script>
@endsection
