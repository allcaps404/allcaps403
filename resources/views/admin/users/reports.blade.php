@extends('layouts.admin.index')
@section('title', 'Environment Report - Table View')

@section('content')
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Environment Report</h4>

                        <div class="nav-wrapper">
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link {{ request()->routeIs('environment.report') ? 'active' : '' }}" href="{{ route('environment.report', ['page' => $data->currentPage()]) }}">Table View</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link {{ request()->routeIs('environment.chart') ? 'active' : '' }}" href="{{ route('environment.chart', ['page' => $data->currentPage()]) }}">Chart View</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="card-body">
                        <!-- Download Buttons Positioned Appropriately -->
                        <div class="mb-3">
                            <a href="{{ route('environment.export.excel') }}" class="btn btn-primary">Download Current Page as Excel</a>
                            <a href="{{ route('environment.export.csv') }}" class="btn btn-secondary">Download Current Page as CSV</a>
                        </div>

                        @if ($data->isEmpty())
                            <p>No data available.</p>
                        @else
                            <table class="table">
                                <thead>
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
                                        $count =1;
                                    @endphp
                                    @foreach ($data as $entry)
                                        <tr>
                                            <td>{{ $count++; }}</td>
                                            <td>{{ $entry->temperature }} °C</td>
                                            <td>{{ $entry->humidity }}</td>
                                            <td>{{ $entry->soil_moisture }}</td>
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
