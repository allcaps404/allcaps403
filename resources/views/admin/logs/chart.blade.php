@extends('layouts.admin.index')
@section('title', 'Environment Report - Chart View')

@section('content')
    <div class="content-wrapper" style="padding: 20px 10px;">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <div class="card shadow-sm" style="border-radius: 10px;">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div>
                                <a class="btn btn-outline-primary me-2 {{ request()->routeIs('environment.log') ? 'active' : '' }}" href="{{ route('environment.log', ['page' => $data->currentPage()]) }}">
                                    Table View
                                </a>
                                <a class="btn btn-outline-primary {{ request()->routeIs('environment.chart') ? 'active' : '' }}" href="{{ route('environment.chart', ['page' => $data->currentPage()]) }}">
                                    Chart View
                                </a>
                            </div>
                            <div>
                                <!-- Download Chart Button -->
                                <button class="btn btn-success btn-md" data-bs-toggle="modal" data-bs-target="#renameModal">
                                    <i class="fas fa-download"></i> Download Chart
                                </button>
                            </div>
                        </div>

                        @if ($data->isEmpty())
                            <p>No data available to display in the chart.</p>
                        @else
                            <!-- Bar Chart Canvas with responsive container -->
                            <div class="chart-container" style="position: relative; height: 50vh; width: 100%;">
                                <canvas id="dataChart"></canvas>
                            </div>
                        @endif
                    </div>

                    <div class="pagination-wrapper mt-4 d-flex justify-content-center">
                        {{ $data->appends(request()->input())->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Rename Modal for File Download -->
    <div class="modal fade" id="renameModal" tabindex="-1" aria-labelledby="renameModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="renameModalLabel">Rename File Before Download</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <label for="fileName" class="form-label">Enter File Name</label>
                    <input type="text" id="fileName" class="form-control" placeholder="Enter file name" required>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" id="downloadChartBtn">Download</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const dataLabels = {!! json_encode($data->pluck('created_at')->map(fn($date) => $date->format('Y-m-d H:i'))) !!};
        const temperatureData = {!! json_encode($data->pluck('temperature')) !!};
        const humidityData = {!! json_encode($data->pluck('humidity')) !!};
        const avgSoilMoistureData = {!! json_encode($data->pluck('avg_soil_moisture')) !!};

        document.addEventListener('DOMContentLoaded', function () {
            const ctx = document.getElementById('dataChart').getContext('2d');

            const chart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: dataLabels,
                    datasets: [
                        {
                            label: 'Temperature (°C)',
                            data: temperatureData,
                            fill: false,
                            borderColor: 'red',
                            tension: 0.1,
                            borderWidth: 2
                        },
                        {
                            label: 'Humidity (%)',
                            data: humidityData,
                            fill: false,
                            borderColor: 'cyan',
                            tension: 0.1,
                            borderWidth: 2
                        },
                        {
                            label: 'Average Soil Moisture',
                            data: avgSoilMoistureData,
                            fill: false,
                            borderColor: 'darkblue',
                            tension: 0.1,
                            borderWidth: 2
                        }
                    ]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top'
                        }
                    },
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: 'Date & Time',
                                color: '#333',
                                font: {
                                    weight: 'bold'
                                }
                            },
                            ticks: {
                                autoSkip: true,
                                maxTicksLimit: 10,
                                color: '#333'
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Values',
                                color: '#333',
                                font: {
                                    weight: 'bold'
                                }
                            },
                            ticks: {
                                color: '#333'
                            },
                            beginAtZero: true
                        }
                    }
                }
            });

            const downloadChartBtn = document.getElementById('downloadChartBtn');
            const fileNameInput = document.getElementById('fileName');

            downloadChartBtn.addEventListener('click', function () {
                const fileName = fileNameInput.value || 'chart'; 
                const canvas = document.getElementById('dataChart');
                const context = canvas.getContext('2d');

                const tempCanvas = document.createElement('canvas');
                const tempContext = tempCanvas.getContext('2d');
                
                tempCanvas.width = canvas.width;
                tempCanvas.height = canvas.height;

                tempContext.fillStyle = 'white';
                tempContext.fillRect(0, 0, tempCanvas.width, tempCanvas.height);

                tempContext.drawImage(canvas, 0, 0);

                const dataURL = tempCanvas.toDataURL('image/png');

                const link = document.createElement('a');
                link.href = dataURL;
                link.download = fileName + '.png';
                link.click();

                const renameModal = new bootstrap.Modal(document.getElementById('renameModal'));
                renameModal.hide();
            });
        });
    </script>
@endsection
