<main>
    <div id="carousel-home">
        <div class="owl-carousel owl-theme">
            @foreach ($products as $product)
                <div class="owl-slide cover" style="background-image: url(img/slides/slide_home_2.jpg);">
                    
                    <img src="{{ $product['img_thumbnail'] }}" width="100px" alt="">

                    <div class="opacity-mask d-flex align-items-center" data-opacity-mask="rgba(0, 0, 0, 0.5)">
                        <div class="container">
                            <div class="row justify-content-center justify-content-md-end">
                                <div class="col-lg-6 static">
                                    <div class="slide-text text-end white">
                                        <h2 class="owl-slide-animated owl-slide-title">{{ $product['name'] }}<br>
                                        </h2>
                                        <p class="owl-slide-animated owl-slide-subtitle">
                                            {{ $product['overview'] }}
                                        </p>
                                        <div class="owl-slide-animated owl-slide-cta"><a class="btn_1"
                                                href="{{ url('products') }}" role="button">Shop Now</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/owl-slide-->
            @endforeach

        </div>
        <div id="icon_drag_mobile"></div>
    </div>
    <!--/carousel-->





    <div class="container margin_60_35">
        <div class="main_title">
            <h2>Sản Phẩm</h2>

        </div>
        <div class="owl-carousel owl-theme products_carousel">
            @foreach ($products as $product)
                <div class="item">
                    <div class="grid_item">
                        <span class="ribbon new">New</span>
                        <figure>
                            <a href="product-detail-1.html">
                                <img src="{{ $product['img_thumbnail'] }}" width="100px" alt="">
                            </a>
                        </figure>
                        <div class="rating"><i class="icon-star voted"></i><i class="icon-star voted"></i><i
                                class="icon-star voted"></i><i class="icon-star voted"></i><i class="icon-star"></i>
                        </div>
                        <a href="product-detail-1.html">
                            <h3>{{ $product['name'] }}</h3>
                        </a>
                        <div class="price_box">
                            <span class="new_price">{{ $product['price_sale'] }}</span>
                        </div>
                        <ul>

                            <li><a href="{{ url('cart/add') }}?quantity=1&productID={{ $product['id'] }}"
                                    class="tooltip-1" data-bs-toggle="tooltip" data-bs-placement="left"
                                    title="Add to cart"><i class="{{ url('products') }}"></i><span>Add to
                                        cart</span></a></li>
                           
                        </ul>
                    </div>
                    <!-- /grid_item -->
                </div>
            @endforeach

            <!-- /item -->

        </div>
        <!-- /products_carousel -->
    </div>
    <!-- /container -->


    <!-- /bg_gray -->


    <!-- /container -->
</main>
