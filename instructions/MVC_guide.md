# Laravel — Guida Rapida da Checkpoint

Guida sintetica per ripassare il flusso base dei progetti Laravel: setup, routes, controller, view Blade, componenti, model, migration e seeder.

---

# 1. Flusso mentale Laravel

```text
Utente visita una URL
        ↓
routes/web.php intercetta la richiesta
        ↓
Controller gestisce la logica
        ↓
Model recupera/salva dati nel database
        ↓
View Blade mostra l’output all’utente
```

Laravel segue l’architettura MVC:

- **Model:** rappresenta i dati e comunica con il database.
- **View:** mostra ciò che vede l’utente.
- **Controller:** è il cervello, collega richiesta, dati e view.

---

# 2. Creazione progetto

```bash
composer create-project --prefer-dist laravel/laravel nome-progetto
cd nome-progetto
composer install
npm install
php artisan serve
```

Server disponibile normalmente su:

```text
http://localhost:8000
```

In alternativa:

```bash
php -S localhost:8000 -t public
```

---

# 3. Configurazione iniziale

## File `.env`

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=nome_database
DB_USERNAME=root
DB_PASSWORD=root
```

Se `.env` non esiste:

```bash
cp .env.example .env
php artisan key:generate
```

---

# 4. Composer

Composer gestisce le dipendenze PHP.

```bash
composer install
composer require nome/libreria
composer update
```

La cartella:

```text
vendor/
```

è simile a `node_modules` e non va pushata su GitHub.

---

# 5. NPM / Vite / Bootstrap

Installare dipendenze frontend:

```bash
npm install
```

Avviare Vite:

```bash
npm run dev
```

Installare Bootstrap:

```bash
composer require laravel/ui
php artisan ui bootstrap
npm install
npm run dev
```

Nel layout Blade:

```blade
@vite(['resources/sass/app.scss', 'resources/js/app.js'])
```

Per caricare asset:

```blade
<img src="{{ Vite::asset('resources/img/logo.png') }}">
```

---

# 6. Routes

Le rotte principali stanno in:

```text
routes/web.php
```

## Rotta base

```php
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});
```

## Rotta verso una view

```php
Route::get('/about', function () {
    return view('about');
});
```

Laravel cerca:

```text
resources/views/about.blade.php
```

---

# 7. Passare dati alla view

## Con array associativo

```php
Route::get('/', function () {

    $data = [
        'name' => 'Laravel'
    ];

    return view('home', $data);

});
```

Nella view:

```blade
{{ $name }}
```

---

## Con `compact()`

```php
Route::get('/', function () {

    $name = 'Laravel';

    return view('home', compact('name'));

});
```

---

# 8. Blade

Blade è il template engine di Laravel.

## Stampare variabili

```blade
{{ $name }}
```

## Condizioni

```blade
@if ($count > 0)
    Ci sono elementi
@else
    Non ci sono elementi
@endif
```

## Foreach

```blade
@foreach ($movies as $movie)
    {{ $movie->title }}
@endforeach
```

## Variabile `$loop`

```blade
@if ($loop->first)
    Primo elemento
@endif

@if ($loop->last)
    Ultimo elemento
@endif
```

## PHP dentro Blade

```blade
@php
    $name = 'Laravel';
@endphp
```

---

# 9. Dot notation per le view

Se il file è:

```text
resources/views/home/index.blade.php
```

si richiama così:

```php
return view('home.index');
```

---

# 10. Include

```blade
@include('partials.header')
```

Laravel cerca:

```text
resources/views/partials/header.blade.php
```

---

# 11. Layout Blade

## Layout principale

```text
resources/views/layouts/app.blade.php
```

Esempio:

```blade
<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">

    <title>@yield('title')</title>

    @vite(['resources/sass/app.scss', 'resources/js/app.js'])
</head>

<body>

    @yield('content')

</body>

</html>
```

## Pagina che estende il layout

```blade
@extends('layouts.app')

@section('title', 'Homepage')

@section('content')

    <h1>Homepage</h1>

@endsection
```

---

# 12. Controller

Il controller gestisce la logica dell’applicazione.

Creazione:

```bash
php artisan make:controller PageController
```

File creato:

```text
app/Http/Controllers/PageController.php
```

Esempio:

```php
namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PageController extends Controller
{
    public function index()
    {
        return view('home');
    }
}
```

Rotta collegata:

```php
use App\Http\Controllers\PageController;

Route::get('/', [PageController::class, 'index']);
```

---

# 13. Controller con dati

```php
namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PageController extends Controller
{
    public function index()
    {
        $movies = [

            [
                'title' => 'Film 1',
                'year' => 2000,
            ],

            [
                'title' => 'Film 2',
                'year' => 2005,
            ],

        ];

        return view('home', compact('movies'));
    }
}
```

Nella view:

```blade
@foreach ($movies as $movie)

    <h2>{{ $movie['title'] }}</h2>

    <p>{{ $movie['year'] }}</p>

@endforeach
```

---

# 14. Model

Il model rappresenta una tabella del database.

Creazione:

```bash
php artisan make:model Movie
```

File creato:

```text
app/Models/Movie.php
```

Esempio:

```php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Movie extends Model
{
    //
}
```

---

# 15. Usare il Model nel Controller

```php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Movie;

class PageController extends Controller
{
    public function index()
    {
        $movies = Movie::all();

        return view('home', compact('movies'));
    }
}
```

---

# 16. Query base con Eloquent

## Tutti i record

```php
Movie::all();
```

## Record filtrati

```php
Movie::where('genre', 'horror')->get();
```

## Primo risultato

```php
Movie::where('genre', 'horror')->first();
```

## Cercare per ID

```php
Movie::find($id);
```

## Ordinare

```php
Movie::orderBy('title', 'asc')->get();
```

```php
Movie::orderBy('title', 'desc')->get();
```

## Limitare risultati

```php
Movie::limit(10)->get();
```

## Query combinata

```php
Movie::where('genre', 'horror')
    ->orderBy('title', 'asc')
    ->limit(10)
    ->get();
```

---

# 17. Collection vs singolo Model

Questi restituiscono una collection:

```php
Movie::all();
Movie::get();
```

Questi restituiscono un singolo model:

```php
Movie::first();
Movie::find($id);
```

---

# 18. Migration

Le migration servono a creare o modificare tabelle.

Creazione:

```bash
php artisan make:migration create_movies_table
```

File creato in:

```text
database/migrations/
```

Esempio:

```php
public function up(): void
{
    Schema::create('movies', function (Blueprint $table) {

        $table->id();

        $table->string('title');

        $table->integer('year');

        $table->string('genre')->nullable();

        $table->timestamps();

    });
}

public function down(): void
{
    Schema::dropIfExists('movies');
}
```

---

# 19. Comandi migration

Eseguire migration:

```bash
php artisan migrate
```

Rollback:

```bash
php artisan migrate:rollback
```

Reset totale:

```bash
php artisan migrate:reset
```

Ricreare tutto:

```bash
php artisan migrate:fresh
```

Ricreare tutto + seeder:

```bash
php artisan migrate:fresh --seed
```

---

# 20. Seeder

I seeder servono a popolare il database.

Creazione:

```bash
php artisan make:seeder MovieTableSeeder
```

File:

```text
database/seeders/MovieTableSeeder.php
```

Esempio:

```php
namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Movie;

class MovieTableSeeder extends Seeder
{
    public function run(): void
    {
        $movie = new Movie();

        $movie->title = 'Il Signore degli Anelli';

        $movie->year = 2001;

        $movie->genre = 'Fantasy';

        $movie->save();
    }
}
```

---

# 21. Seeder con array

```php
public function run(): void
{
    $movies = [

        [
            'title' => 'Film 1',
            'year' => 2000,
            'genre' => 'Action',
        ],

        [
            'title' => 'Film 2',
            'year' => 2005,
            'genre' => 'Drama',
        ],

    ];

    foreach ($movies as $movieData) {

        $movie = new Movie();

        $movie->title = $movieData['title'];

        $movie->year = $movieData['year'];

        $movie->genre = $movieData['genre'];

        $movie->save();

    }
}
```

---

# 22. DatabaseSeeder

File principale:

```text
database/seeders/DatabaseSeeder.php
```

Dentro `run()` posso richiamare altri seeder:

```php
namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        $this->call(MovieTableSeeder::class);
    }
}
```

Con più seeder:

```php
public function run(): void
{
    $this->call([

        MovieTableSeeder::class,
        BookTableSeeder::class,
        UserTableSeeder::class,

    ]);
}
```

Lanciare seeder:

```bash
php artisan db:seed
```

Oppure:

```bash
php artisan migrate:fresh --seed
```

---

# 23. Faker

Faker genera dati casuali.

```php
use Faker\Generator as Faker;
use App\Models\Movie;

public function run(Faker $faker): void
{
    for ($i = 0; $i < 10; $i++) {

        $movie = new Movie();

        $movie->title = $faker->sentence(3);

        $movie->year = $faker->numberBetween(1980, 2024);

        $movie->genre = $faker->word();

        $movie->save();

    }
}
```

---

# 24. Componenti Blade

I componenti servono a riutilizzare markup.

File componente:

```text
resources/views/components/card.blade.php
```

Uso:

```blade
<x-card>

    Contenuto della card

</x-card>
```

Nel componente:

```blade
<div class="card">

    <div class="card-body">

        {{ $slot }}

    </div>

</div>
```

---

# 25. Props nei componenti

Uso:

```blade
<x-card title="Titolo card" />
```

Nel componente:

```blade
@props(['title'])

<div class="card">

    <div class="card-body">

        <h3>{{ $title }}</h3>

    </div>

</div>
```

---

# 26. Props con variabili

Se passo una variabile PHP uso `:`.

```blade
<x-card :movie="$movie" />
```

Nel componente:

```blade
@props(['movie'])

<div class="card">

    <div class="card-body">

        <h3>{{ $movie->title }}</h3>

        <p>{{ $movie->year }}</p>

    </div>

</div>
```

---

# 27. Props con default

```blade
@props([
    'title' => 'Titolo di default'
])

<div class="card">

    <h3>{{ $title }}</h3>

</div>
```

---

# 28. Slot principale

Uso:

```blade
<x-card>

    <p>Questo è il contenuto principale.</p>

</x-card>
```

Nel componente:

```blade
<div class="card">

    <div class="card-body">

        {{ $slot }}

    </div>

</div>
```

---

# 29. Slot titolati

Uso:

```blade
<x-card>

    <x-slot:titolo>
        Titolo della card
    </x-slot:titolo>

    <x-slot:sottotitolo>
        Sottotitolo della card
    </x-slot:sottotitolo>

    Contenuto principale della card

</x-card>
```

Nel componente:

```blade
<div class="card">

    <div class="card-body">

        <h3>{{ $titolo }}</h3>

        <h5>{{ $sottotitolo }}</h5>

        <div>
            {{ $slot }}
        </div>

    </div>

</div>
```

---

# 30. Component completo

Uso nella view:

```blade
@foreach ($movies as $movie)

    <x-card :movie="$movie">

        <x-slot:titolo>
            {{ $movie->title }}
        </x-slot:titolo>

        <x-slot:sottotitolo>
            {{ $movie->genre }}
        </x-slot:sottotitolo>

        <p>Anno: {{ $movie->year }}</p>

    </x-card>

@endforeach
```

Componente:

```blade
@props(['movie'])

<div class="card">

    <div class="card-body">

        <h3>{{ $titolo }}</h3>

        <h5>{{ $sottotitolo }}</h5>

        {{ $slot }}

    </div>

</div>
```

---

# 31. Flusso completo progetto Laravel

## 1. Creo progetto

```bash
composer create-project --prefer-dist laravel/laravel nome-progetto

cd nome-progetto

npm install

php artisan serve
```

---

## 2. Configuro `.env`

```env
DB_DATABASE=nome_database
DB_USERNAME=root
DB_PASSWORD=root
```

---

## 3. Creo controller

```bash
php artisan make:controller PageController
```

---

## 4. Creo model

```bash
php artisan make:model Movie
```

---

## 5. Creo migration

```bash
php artisan make:migration create_movies_table
```

---

## 6. Scrivo colonne

```php
$table->id();

$table->string('title');

$table->integer('year');

$table->string('genre')->nullable();

$table->timestamps();
```

---

## 7. Lancio migration

```bash
php artisan migrate
```

---

## 8. Creo seeder

```bash
php artisan make:seeder MovieTableSeeder
```

---

## 9. Richiamo seeder in DatabaseSeeder

```php
public function run(): void
{
    $this->call(MovieTableSeeder::class);
}
```

---

## 10. Lancio seed

```bash
php artisan db:seed
```

Oppure:

```bash
php artisan migrate:fresh --seed
```

---

## 11. Recupero dati nel controller

```php
use App\Models\Movie;

public function index()
{
    $movies = Movie::all();

    return view('home', compact('movies'));
}
```

---

## 12. Creo rotta

```php
use App\Http\Controllers\PageController;

Route::get('/', [PageController::class, 'index']);
```

---

## 13. Stampo nella view

```blade
@foreach ($movies as $movie)

    <x-card :movie="$movie" />

@endforeach
```

---

# 32. Comandi rapidi terminale

## Server

```bash
php artisan serve
```

## Controller

```bash
php artisan make:controller PageController
```

## Model

```bash
php artisan make:model Movie
```

## Migration

```bash
php artisan make:migration create_movies_table
```

## Seeder

```bash
php artisan make:seeder MovieTableSeeder
```

## Migrare

```bash
php artisan migrate
```

## Rollback

```bash
php artisan migrate:rollback
```

## Seed

```bash
php artisan db:seed
```

## Seed specifico

```bash
php artisan db:seed --class=MovieTableSeeder
```

## Fresh + seed

```bash
php artisan migrate:fresh --seed
```

## Vite

```bash
npm run dev
```

---

# 33. Promemoria finale

```text
Route = indirizzo URL
Controller = logica
Model = dati / database
Migration = struttura tabella
Seeder = dati iniziali
View = pagina mostrata
Blade = sintassi intelligente per HTML + PHP
Component = blocco riutilizzabile
Slot = contenuto passato al componente
Props = dati passati al componente
```
