<?php

namespace App\Http\Controllers;

use App\Models\Train;
use Illuminate\Http\Request;

class TrainController extends Controller
{
    public function index() {
        $trains = Train::where('departure_date', '>=', today())
                ->orderBy('departure_date')
                ->orderBy('departure_time')
                ->get();
        return view('pages.home', compact('trains'));
    }
}
