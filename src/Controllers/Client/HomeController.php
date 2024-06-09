<?php

namespace Mx2\XuongOop\Controllers\Client;


use Mx2\XuongOop\Commons\Controller;
use Mx2\XuongOop\Commons\Helper;
use Mx2\XuongOop\Models\Product;
use Mx2\XuongOop\Models\User;

class HomeController extends Controller
{
    private Product $product;

    public function __construct()
    {
        $this->product = new Product();
    }

    public function index()
    {

        // $this->renderViewClient(__FUNCTION__);
        $name = 'TungKengM2';
        $products = $this->product->all();

        $this->renderViewClient('home', [
            'name' => $name,
            'products' => $products
        ]);
    }
}
