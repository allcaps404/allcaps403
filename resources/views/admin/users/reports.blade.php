@extends('layouts.admin.index')

@section('title', 'Report')

@section('content')
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Report</h4>
                    </div>
                    <div class="card-body">
                        <!-- Add content related to student management -->
                        <p>This section could include a table listing all relevant data for your report.</p>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Temperature</th>
                                    <th>Humidity</th>
                                    <th>Soil Moisture</th>
                                    <th>Water Pump</th>
                                    <th>Fogger</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>25°C</td>
                                    <td>60%</td>
                                    <td>30%</td>
                                    <td><a href="#" class="btn btn-sm btn-success">On</a></td>
                                    <td><a href="#" class="btn btn-sm btn-success">Active</a></td>
                                    <td>
                                        <a href="#" class="btn btn-sm btn-primary">Edit</a>
                                        <a href="#" class="btn btn-sm btn-danger">Delete</a>
                                    </td>
                                </tr>
                                <!-- More rows can be added dynamically or fetched from the database -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
