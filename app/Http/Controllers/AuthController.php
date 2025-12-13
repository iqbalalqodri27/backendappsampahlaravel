<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function register(Request $request)
{
    try {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6'
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' =>  Hash::make($request->password) 
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Register berhasil',
            'user' => $user
        ], 200); // ⬅️ PENTING: HARUS 200

    } catch (\Exception $e) {
        return response()->json([
            'success' => false,
            'message' => $e->getMessage()
        ], 500);
    }
}


    public function login(Request $request)
    {
    $request->validate([
        'email' => 'required|email',
        'password' => 'required'
    ]);

    $user = User::where('email', $request->email)->first();

    // ❌ Email tidak terdaftar
    if (!$user) {
        return response()->json([
            'success' => false,
            'message' => 'Email tidak terdaftar'
        ], 401);
    }

    // ❌ Password salah
    if (!Hash::check($request->password, $user->password)) {
        return response()->json([
            'success' => false,
            'message' => 'Password salah'
        ], 401);
    }

    // ✅ LOGIN BERHASIL
    return response()->json([
        'success' => true,
        'message' => 'Login berhasil',
        'user' => $user,
    ], 200);
}
}
