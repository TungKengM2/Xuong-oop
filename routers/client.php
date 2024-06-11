<?php

// Website có các trang chủ là:
//     Trang chủ
//     Giới thiệu
//     Sản phẩm
//     Chi tiết sản phẩm
//     Liên hệ

// Để định nghĩa được, điều đầu tiên làm là phải tạo Controller trước
// Tiếp theo, khai báo function tương ứng để xử lý
// Bước cuối, định nghĩa đường dẫn

//HTTP Mehthod: get, post, put (path) , delete, option, head 

use Mx2\XuongOop\Controllers\Client\AboutController;
use Mx2\XuongOop\Controllers\Client\CartController;
use Mx2\XuongOop\Controllers\Client\ContactController;
use Mx2\XuongOop\Controllers\Client\HomeController;
use Mx2\XuongOop\Controllers\Client\LoginController;
use Mx2\XuongOop\Controllers\Client\OrderController;
use Mx2\XuongOop\Controllers\Client\ProductController;

$router->get('/',                      HomeController::class       . '@index');

$router->get('/about',                 AboutController::class      . '@index');

$router->get('/contact',               ContactController::class    . '@index');
$router->post('/contact/store',        ContactController::class    . '@store');

$router->get('/products',              ProductController::class    . '@index');
$router->get('/products/{id}',         ProductController::class    . '@detail');

$router->get('/login',                 LoginController::class     . '@showFormLogin');
$router->post('/handle-login',         LoginController::class     . '@login');
$router->get('/logout',                LoginController::class     . '@logout');

$router->get('/cart/add',              CartController::class      . '@add');
$router->get('/cart/quantityInc',      CartController::class      . '@quantityInc');
$router->get('/cart/quantityDec',      CartController::class      . '@quantityDec');
$router->get('/cart/remove',           CartController::class      . '@remove');
$router->get('/cart/detail',           CartController::class      . '@detail');

$router->post('/order/checkout',        OrderController::class     . '@checkout');
