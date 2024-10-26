@extends('layouts.admin.index')
@section('title', 'Environment Report - Chart View')

@section('content')
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <!-- Aligned Navigation Bar with Buttons -->
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <!-- Left Aligned Table and Chart View Buttons -->
                            <div>
                                <a class="btn btn-primary me-5 {{ request()->routeIs('environment.report') ? 'active' : '' }}" href="{{ route('environment.report', ['page' => $data->currentPage()]) }}">Table View</a>
                                <a class="btn btn-primary {{ request()->routeIs('environment.chart') ? 'active' : '' }}" href="{{ route('environment.chart', ['page' => $data->currentPage()]) }}">Chart View</a>
                            </div>
                        </div>

                        @if ($data->isEmpty())
                            <p>No data available to display in the chart.</p>
                        @else
                            <!-- Bar Chart Canvas -->
                            <canvas id="dataChart"></canvas>
                        @endif
                    </div>

                    <!-- Pagination for the chart with page synchronization -->
                    <div class="pagination-wrapper">
                        {{ $data->appends(request()->input())->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Include Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Prepare the data for the chart
        const dataLabels = {!! json_encode($data->pluck('created_at')->map(fn($date) => $date->format('Y-m-d H:i'))) !!};
        const temperatureData = {!! json_encode($data->pluck('temperature')) !!};
        const humidityData = {!! json_encode($data->pluck('humidity')) !!};
        const soilMoistureData = {!! json_encode($data->pluck('soil_moisture')) !!};

        // Initialize the chart after the page has fully loaded
        document.addEventListener('DOMContentLoaded', function () {
            const ctx = document.getElementById('dataChart').getContext('2d');

            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: dataLabels,
                    datasets: [
                        {
                            label: 'Temperature (°C)',
                            data: temperatureData,
                            backgroundColor: 'rgba(255, 99, 132, 0.2)',
                            borderColor: 'rgba(255, 99, 132, 1)',
                            borderWidth: 1
                        },
                        {
                            label: 'Humidity (%)',
                            data: humidityData,
                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 1
                        },
                        {
                            label: 'Soil Moisture',
                            data: soilMoistureData,
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }
                    ]
                },
                options: {
                    responsive: true,
                    scales: {
                        x: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Date & Time'
                            }
                        },
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Values'
                            }
                        }
                    }
                }
            });
        });
    </script>
@endsection


