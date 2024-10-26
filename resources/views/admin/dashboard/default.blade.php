@extends('layouts.admin.index')

@section('content')
<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">DASHBOARD</h3>
                </div>            
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <div class="card bg-primary text-white">
                <div class="card-body text-center">
                    <h4 class="card-title">Total Users</h4>
                    <h2>{{ $userCount }}</h2> <!-- Display the user count here -->
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card bg-primary text-white mb-4">
                <div class="card-body text-center">
                    <h4 class="card-title">Some Other Metric</h4>
                    <h2>Value</h2>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card bg-primary text-white mb-4">
                <div class="card-body text-center">
                    <h4 class="card-title">Another Metric</h4>
                    <h2>Value</h2>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
