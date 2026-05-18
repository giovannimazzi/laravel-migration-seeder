<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Train extends Model
{
    protected $casts=[
        "departure_date" => 'date',
        "departure_time" => 'datetime',
        "arrival_time" => 'datetime',
    ];
}
