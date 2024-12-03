<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class RoleMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string  $role
     * @return mixed
     */
    public function handle($request, Closure $next, $role)
    {
        // Check if the user is not authenticated or if the role doesn't match
        if (!Auth::check() || Auth::user()->role !== $role) {
            // Redirect the user with a custom error message
            return redirect()->route('login') // You can change this route to a more appropriate one
                             ->with('error', 'You do not have the required permissions to access this page.');
        }

        // Allow the request to proceed
        return $next($request);
    }
}
