<?php

namespace Database\Seeders;

use App\Models\Train;
use Faker\Generator as Faker;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TrainsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(Faker $faker): void
    {
        $companies = [
            'Trenitalia',
            'Italo',
            'Frecciarossa',
            'Intercity',
            'Regionale',
        ];

        $stations = [
            'Roma Termini',
            'Milano Centrale',
            'Napoli Centrale',
            'Torino Porta Nuova',
            'Bologna Centrale',
            'Firenze Santa Maria Novella',
            'Venezia Santa Lucia',
            'Bari Centrale',
            'Genova Piazza Principe',
            'Palermo Centrale',
            'Verona Porta Nuova',
            'Salerno',
            'Lecce',
            'Pescara Centrale',
        ];

        for($i=0; $i<500; $i++){
            $newTrain = new Train();

            $newTrain->company = $faker->randomElement($companies);

            $newTrain->departure_station = $faker->randomElement($stations);

            do {
                $arrivalStation = $faker->randomElement($stations);
            } while ($arrivalStation === $newTrain->departure_station);

            $newTrain->arrival_station = $arrivalStation;
            
            $newTrain->departure_date = $faker->dateTimeBetween('-1 month', '+2 months')->format('Y-m-d');

            $departureTime = $faker->dateTimeBetween('06:00', '21:00');

            $newTrain->departure_time = (clone $departureTime)->format('H:i:s'); 

            $newTrain->arrival_time = (clone $departureTime)->modify('+' . $faker->numberBetween(30, 360) . ' minutes')->format('H:i:s');

            $newTrain->train_code = strtoupper($faker->bothify('??####'));

            $newTrain->carriages_number = $faker->numberBetween(4, 14);

            $newTrain->is_on_time = $faker->boolean(80);

            $newTrain->is_cancelled = $faker->boolean(10);

            $newTrain->save();
        }
    }
}
