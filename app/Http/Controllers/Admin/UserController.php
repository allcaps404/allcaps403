<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;


class UserController extends Controller
{
    public function viewStudents()
    {
        // Logic to fetch and display students
        return view('admin.users.students');
    }

    public function viewFaculty()
    {
        // Logic to fetch and display faculty
        return view('admin.users.faculty');
    }

    public function viewStaff()
    {
        // Logic to fetch and display staff
        return view('admin.users.staff');
    }

    public function addUser()
    {
        // Logic to show add user form
        return view('admin.users.add');
    }

    public function editUser($id)
    {
        // Logic to fetch user by ID and show edit form
        $user = User::findOrFail($id);
        return view('admin.users.edit', compact('user'));
    }

    public function updateUser(Request $request, $id)
    {
        // Logic to update user based on form submission
        $user = User::findOrFail($id);
        $user->update($request->all());
        
        // Redirect back or to another route after update
        return redirect()->route('users')->with('success', 'User updated successfully.');
    }

    public function deleteUser($id)
    {
        // Logic to delete user by ID
        $user = User::findOrFail($id);
        $user->delete();

        // Redirect back or to another route after delete
        return redirect()->route('users')->with('success', 'User deleted successfully.');
    }
}
