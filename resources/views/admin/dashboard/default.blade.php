@extends('layouts.admin.index')

@section('content')
<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Overview</h3>
                    <div class="card">
                        <!-- <div class="card-body">
                            <p>Welcome to your attendance monitoring dashboard.</p>
                        </div> -->
                    </div>
                </div>
               
            </div>
        </div>
    </div>

    <div class="row">
    <!-- Students Section -->
    <div class="col-md-4">
        <div class="card bg-primary text-white mb-4">
            <div class="card-body text-center">
                <h4 class="card-title"><i class="fas fa-user-graduate"></i> Students</h4>
                <div class="row">
                    <div class="col-md-6">
                        <p>Total Students</p>
                        <h2>100</h2> <!-- Replace with dynamic data -->
                    </div>
                    <div class="col-md-6">
                        <p>Present Students</p>
                        <h2>80</h2> <!-- Replace with dynamic data -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <p>Absent Students</p>
                        <h2>20</h2> <!-- Replace with dynamic data -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Faculty Section -->
    <div class="col-md-4">
        <div class="card bg-primary text-white mb-4">
            <div class="card-body text-center">
                <h4 class="card-title"><i class="fas fa-chalkboard-teacher"></i> Faculty</h4>
                <div class="row">
                    <div class="col-md-6">
                        <p>Total Faculty</p>
                        <h2>50</h2> <!-- Replace with dynamic data -->
                    </div>
                    <div class="col-md-6">
                        <p>Present Faculty</p>
                        <h2>40</h2> <!-- Replace with dynamic data -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <p>Absent Faculty</p>
                        <h2>10</h2> <!-- Replace with dynamic data -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Staff Section -->
    <div class="col-md-4">
        <div class="card bg-primary text-white mb-4">
            <div class="card-body text-center">
                <h4 class="card-title"><i class="fas fa-user-tie"></i> Staff</h4>
                <div class="row">
                    <div class="col-md-6">
                        <p>Total Staff</p>
                        <h2>30</h2> <!-- Replace with dynamic data -->
                    </div>
                    <div class="col-md-6">
                        <p>Present Staff</p>
                        <h2>25</h2> <!-- Replace with dynamic data -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <p>Absent Staff</p>
                        <h2>5</h2> <!-- Replace with dynamic data -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

      <div class="row mt-4">
        <!-- Attendance Logs Section -->
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="card-title">Attendance Logs</h4>
                        <div class="input-group w-25">
                            <input type="text" class="form-control" placeholder="Search...">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="icon-magnifier"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID Number</th>
                                    <th>Name</th>
                                    <th>Role</th>
                                    <th>Location or Room</th>
                                    <th>Time In</th>
                                    <th>Time Out</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>John Doe</td>
                                    <td>Student</td>
                                    <td>Room 101</td>
                                    <td>08:00 AM</td>
                                    <td>04:00 PM</td>
                                </tr>
                                <!-- Add more rows dynamically with actual data -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Additional Sections or Cards -->
    <div class="row">
        <div class="col-md-6">
            <!-- Add any additional sections or cards here -->
        </div>
    </div>
</div>
@endsection
 