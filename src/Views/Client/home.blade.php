<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>


    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
    <div class="container">
        <div class="row">
            <h1 class="mt-3">Home</h1>
            <p class="mt-2">Welcom {{ $name }} to my website </p>
            <nav>
                @if (!isset($_SESSION['user']))
                    <a class="btn btn-primary" href="{{ url('login') }}">LogIn</a>
                @endif

                @if (isset($_SESSION['user']))
                    <a class="btn btn-primary" href="{{ url('logout') }}">LogOut</a>
                @endif

            </nav>
        </div>

        {{-- <div class="row">
            @foreach ($products as $product)
                <div class="col-md-4 mb-2 mt-2">
                    <div class="card">
                        <img class="card-img-top" style="max-height: 200px" src="{{ asset($produt['img_thumbnali'])}}">
                        <div class="card-body">
                            <h4 class="card-title">{{ $product['name'] }}</h4>
                            
                            <a href="#" class="btn btn-primary">Thêm vào giỏ hàng</a>
                        </div>
                    </div>
                </div>
            @endforeach
        </div> --}}

    </div>
</body>

</html>
