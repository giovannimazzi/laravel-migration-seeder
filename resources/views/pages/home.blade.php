@extends('layouts.app')

@section('title', 'EX - Tabellone Treni - Home')

@section('content')
    <div class="container py-4">
        ORARI
        <ul>
            @foreach ($trains as $train)
                <li>{{$train}}</li>
            @endforeach
        </ul>
    </div>
@endsection