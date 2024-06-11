<!DOCTYPE html>
<html lang="en">

@include('layouts.partials.head')

<body>

    <div id="page">

        <header class="version_1">

            @include('layouts.partials.header')
            {{-- <nav>
                @if (!isset($_SESSION['user']))
                    <a class="btn btn-primary" href="{{ url('login') }}">LogIn</a>
                @endif

                @if (isset($_SESSION['user']))
                    <a class="btn btn-primary" href="{{ url('logout') }}">LogOut</a>
                @endif
            </nav> --}}


        </header>
        <!-- /header -->

        <main>
            <div class="container margin_30">
                <div class="row">

                    <div class="col-md-4">
                        <div class="all">
                            <div class="card">
                                <img class="card-img-top" style="max-height: 200px"
                                    src="{{ asset($product['img_thumbnail']) }}" alt="Card image">
                           
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="breadcrumbs">
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a href="#">Category</a></li>
                                <li>Page active</li>
                            </ul>
                        </div>
                        <!-- /page_header -->
                        <div class="prod_info">
                            <h1>{{ $product['name'] }}</h1>

                            <div class="row">
                                <div class="col-lg-5 col-md-6">
                                    <div class="price_main"><span
                                            class="new_price">{{ $product['price_sale'] }}</span><span
                                            class="percentage"></span> <span
                                            class="old_price">{{ $product['price_regular'] }}</span>
                                    </div>
                                    <div class="price_main"><span
                                        class="new_price">{{ $product['overview'] }}</span><span
                                        class="percentage"></span> 
                                </div>

                                
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="btn_add_to_cart">
                                        <form class="btn_add_to_cart" action="{{ url('cart/add') }}?{{ $product['id'] }}" method="GET">
                                            <input type="hidden" name="productID" value="1">
                                            <input type="number" min="1" name="quantity" value="1">
                                            <button type="submit">Thêm vào giỏ hàng</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /prod_info -->

                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->


            <div class="feat">
                <div class="container">
                    <ul>
                        <li>
                            <div class="box">
                                <i class="ti-gift"></i>
                                <div class="justify-content-center">
                                    <h3>Free Shipping</h3>
                                    <p>For all oders over $99</p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="box">
                                <i class="ti-wallet"></i>
                                <div class="justify-content-center">
                                    <h3>Secure Payment</h3>
                                    <p>100% secure payment</p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="box">
                                <i class="ti-headphone-alt"></i>
                                <div class="justify-content-center">
                                    <h3>24/7 Support</h3>
                                    <p>Online top support</p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!--/feat-->

        </main>
        <!-- /main -->

        @include('layouts.partials.footer')


        @include('layouts.partials.script')


    </div>

</body>

</html>





{{-- 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <!-- Latest compiled and minified CSS -->
    <link href="{{ asset('assets/client2/https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css')}}" rel="stylesheet">

    <!-- Latest compiled JavaScript -->
    <script src="{{ asset('assets/client2/https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
    <div class="container">
        <div class="row">
            <h1 class="mt-5">Welcom {{ $name }} to my website!</h1>

            <nav>
                @if (!isset($_SESSION['user']))
                    <a class="btn btn-primary" href="{{ url('login') }}">LogIn</a>
                @endif

                @if (isset($_SESSION['user']))
                    <a class="btn btn-primary" href="{{ url('logout') }}">LogOut</a>
                @endif
            </nav>
        </div>

        <div class="row">


            <div class="col-md-4 mb-2 mt-2">
                <div class="card">
                    <img class="card-img-top" style="max-height: 200px" src="{{ asset($product['img_thumbnail']) }}"
                        alt="Card image">
                    <div class="card-body">
                        <h4 class="card-title">{{ $product['name'] }}</h4>
                        <form action="{{ url('cart/add') }}?{{ $product['id'] }}" method="GET">
                            <input type="hidden" name="productID" value="1">
                            <input type="number" min="1" name="quantity" value="1">
                            <button type="submit">Thêm vào giỏ hàng</button>
                        </form>
                    </div>
                </div>
            </div>


        </div>

    </div>
</body>

</html> --}}
