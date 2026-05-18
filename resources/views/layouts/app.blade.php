<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta
      name="description"
      content="Master Boolean in Web Development [152] - Specializzazione PHP/Laravel - Assegnazione L09
"
    />
    <meta name="author" content="Giovanni Mazzi" />
    <title>@yield('title', 'EX - Tabellone Treni')</title>

    <!-- Icona Progetto -->
    <!-- <link rel="icon" href="./assets/img/..." /> -->
    <link
      rel="icon"
      href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>@yield('favicon', '🚂')</text></svg>"
    />

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Share+Tech+Mono&display=swap"
      rel="stylesheet"
    /> 

    @vite(['resources/sass/app.scss', 'resources/js/app.js'])
</head>
<body class="min-vh-100 d-flex flex-column">

    @include('partials.header')

    <main class="flex-grow-1">
        @yield('content')
    </main>

</body>
</html>