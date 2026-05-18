@extends('layouts.app')

@section('title', 'EX - Tabellone Treni - Home')

@section('content')
    <div class="container py-4">
        <h2>Treni in partenza dal {{today()->format('d/m/Y')}}</h2>
        <div class="table-responsive train-table">

            <table class="table table-striped table-hover align-middle">

                <thead class="table-dark sticky-top">
                    <tr>
                        <th class="text-warning fw-normal">Azienda</th>
                        <th class="text-warning fw-normal">Partenza</th>
                        <th class="text-warning fw-normal">Arrivo</th>
                        <th class="text-warning fw-normal">Data</th>
                        <th class="text-warning fw-normal">Ora Partenza</th>
                        <th class="text-warning fw-normal">Ora Arrivo</th>
                        <th class="text-warning fw-normal">Codice</th>
                        <th class="text-warning fw-normal">Carrozze</th>
                        <th class="text-warning fw-normal">Info Orario</th>
                        <th class="text-warning fw-normal">Stato</th>
                    </tr>
                </thead>

                <tbody>
                    @foreach ($trains as $train)
                        <tr>
                            <td>{{ $train->company }}</td>

                            <td>{{ $train->departure_station }}</td>

                            <td>{{ $train->arrival_station }}</td>

                            <td>
                                {{ $train->departure_date->format('d/m/Y') }}
                            </td>

                            <td>{{ $train->departure_time->format('H:i')  }}</td>

                            <td>{{ $train->arrival_time->format('H:i')  }}</td>

                            <td>{{ $train->train_code }}</td>

                            <td>{{ $train->carriages_number }}</td>

                            <td>
                                @if (!$train->is_cancelled)
                                    @if ($train->is_on_time)
                                        <span class="badge bg-success">In orario</span>
                                    @else
                                        <span class="badge bg-warning text-dark">Ritardo</span>
                                    @endif
                                @endif
                            </td>

                            <td>
                                @if ($train->is_cancelled)
                                    <span class="badge bg-danger">Cancellato</span>
                                @else
                                    <span class="badge bg-primary">Attivo</span>
                                @endif
                            </td>

                        </tr>
                    @endforeach
                </tbody>

            </table>

        </div>
    </div>
@endsection