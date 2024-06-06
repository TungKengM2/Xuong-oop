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

use Mx2\XuongOop\Controllers\Admin\DashboardController;
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
});
