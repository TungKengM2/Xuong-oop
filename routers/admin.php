<?php

// CRUD bao gồm: Danh sách, thêm , sửa, xoá, xem, xoá
// User:
//          GET         -> USER/INDEX     ->  INDEX             -> Danh sách
//          GET         -> USER/CREATE    ->  CREATE            -> HIỆN THỊ FORM THÊM MỚI
//          POST        -> USER/STORE     ->  STORE             -> LƯU DỮ LIỆU TỪ FORM THÊM MỚI VÀO DB
//          GET         -> USER/ID/SHOW   ->  SHOW   ($id)      -> XEM CHI TIẾT
//          GET         -> USER/ID/EDIT   ->  EDIT   ($id)      -> HIỆN THỊ FORM CẬP NHẬP
//          POST        -> USER/ID        ->  UPDATE ($id)      -> LƯU DỮ LIỆU TỪ FORM CẬP NHẬP VÀO DB
//          GET         -> USER/ID        ->  DELETE ($id)      -> XOÁ BẢN GHI TRONG DB

use Mx2\XuongOop\Controllers\Admin\CategoryController;
use Mx2\XuongOop\Controllers\Admin\DashboardController;
use Mx2\XuongOop\Controllers\Admin\ProductController;
use Mx2\XuongOop\Controllers\Admin\UserController;

$router->before('GET|POST', '/admin/*.*', function () {
    if (! isset($_SESSION['user'])) {
        header('location: ' . url('login'));
        exit();
    }
});


$router->mount('/admin', function () use ($router) {

    $router->get('/',               DashboardController::class . '@dashboard');


    $router->mount('/users', function () use ($router) {

        // CRUD User
        $router->get('/',               UserController::class . '@index');
        $router->get('/create',         UserController::class . '@create');
        $router->post('/store',         UserController::class . '@store');
        $router->get('/{id}/show',      UserController::class . '@show');
        $router->get('/{id}/edit',      UserController::class . '@edit');
        $router->post('/{id}/update',   UserController::class . '@update');
        $router->get('/{id}/delete',    UserController::class . '@delete');
    });

    $router->mount('/products', function () use ($router) {

        // CRUD Product
        $router->get('/',               ProductController::class . '@index');
        $router->get('/create',         ProductController::class . '@create');
        $router->post('/store',         ProductController::class . '@store');
        $router->get('/{id}/show',      ProductController::class . '@show');
        $router->get('/{id}/edit',      ProductController::class . '@edit');
        $router->post('/{id}/update',   ProductController::class . '@update');
        $router->get('/{id}/delete',    ProductController::class . '@delete');
    });

    $router->mount('/categories', function () use ($router) {

        // CRUD Category
        $router->get('/',               CategoryController::class . '@index');
        $router->get('/create',         CategoryController::class . '@create');
        $router->post('/store',         CategoryController::class . '@store');
        $router->get('/{id}/show',      CategoryController::class . '@show');
        $router->get('/{id}/edit',      CategoryController::class . '@edit');
        $router->post('/{id}/update',   CategoryController::class . '@update');
        $router->get('/{id}/delete',    CategoryController::class . '@delete');
    });
});
