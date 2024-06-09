<!DOCTYPE html>
<html lang="en">

<head>

    <title>@yield('title')</title>

    @include('layouts.partials.head')

<body>

    <div id="page">

        @include('layouts.partials.header')

        @include('layouts.partials.main')
        {{-- @yield('main') --}}

        @include('layouts.partials.footer')
    </div>
    <!-- page -->

    <div id="toTop"></div><!-- Back to top button -->


    @include('layouts.partials.script')
</body>

</head>
