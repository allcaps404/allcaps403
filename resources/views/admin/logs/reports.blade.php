@extends('layouts.admin.index')
@section('title', 'Environment Report - Table View')

@section('content')
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        @if ($data->isEmpty())
                            <p>No data available.</p>
                        @else
                            <table class="table">
                                <thead>
                                    <!-- Table Navigation Tabs Row with Aligned Buttons -->
                                    <tr>
                                        <th colspan="5">
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <!-- Left Aligned Tabs -->
                                                <div>
                                                    <a class="btn btn-primary me-2 {{ request()->routeIs('environment.report') ? 'active' : '' }}" href="{{ route('environment.report', ['page' => $data->currentPage()]) }}">Table View</a>
                                                    <a class="btn btn-primary {{ request()->routeIs('environment.chart') ? 'active' : '' }}" href="{{ route('environment.chart', ['page' => $data->currentPage()]) }}">Chart View</a>
                                                </div>
                                                <!-- Right Aligned Download Button -->
                                                <div>
                                                    <a href="{{ route('environment.export.csv') }}" class="btn btn-success btn-md">
                                                        <i class="fas fa-download"></i> Download
                                                    </a>
                                                </div>
                                            </div>
                                        </th>
                                    </tr>
                                    <!-- Table Header Row -->
                                    <tr>
                                        <th>ID</th>
                                        <th>Temperature</th>
                                        <th>Humidity</th>
                                        <th>Soil Moisture</th>
                                        <th>Date & Time</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php
                                        $index = 1;
                                    @endphp
                                    @foreach ($data as $entry)
                                        <tr>
                                            <td>{{ $index++ }}</td>
                                            <td>{{ number_format($entry->temperature, 2) }} °C</td>
                                            <td>{{ number_format($entry->humidity, 2) }} %</td>
                                            <td>{{ number_format($entry->soil_moisture, 2) }} %</td>
                                            <td>{{ $entry->created_at->format('Y-m-d H:i') }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>

                            <div class="pagination-wrapper">
                                {{ $data->appends(request()->input())->links() }}
                            </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
