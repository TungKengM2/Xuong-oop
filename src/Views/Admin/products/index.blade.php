@extends('layouts.master')

@section('title')
    Danh sách Sản Phẩm
@endsection

@section('content')
    <div class="main_content_iner">
        <div class="container-fluid p-0">
            <div class="row justify-content-center">

                <div class="col-lg-12>
                    <div class="white_card card_height_100 mb_30">
                    <div class="white_card_header">
                        <div class="box_header m-0">
                            <div class="main-title">
                                <h1 class="m-0">Danh sách Sản Phẩm</h1>
                            </div>
                        </div>
                    </div>
                    <div class="white_card_body">

                        <a class="btn btn-primary" href="{{ url('admin/products/create') }}">Thêm mới</a>

                        @if (isset($_SESSION['status']) && $_SESSION['status'])
                            <div class="alert alert-success">
                                {{ $_SESSION['msg'] }}
                            </div>
                            @php
                                unset($_SESSION['status']);
                                unset($_SESSION['msg']);
                            @endphp
                        @endif

                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>CATEGORY_NAME</th>
                                    <th>NAME</th>
                                    <th>IMG_THUMBNAIL</th>
                                    <th>PRICE_SALE</th>
                                    <th>PRICE_REGULAR</th>
                                    <th>OVERVIEW</th>
                                    {{-- <th>CONTENT</th> --}}
                                    <th>CREATED AT</th>
                                    <th>UPDATED AT</th>
                                    <th>ACTION</th>
                                </tr>
                            </thead>
                            <tbody>

                                @foreach ($data as $item)
                                    <tr>
                                        <td><?= $item['id'] ?></td>
                                        <td><?= $item['c_name'] ?></td>
                                        <td><?= $item['name'] ?></td>
                                        <td>
                                            <img src="{{ asset($item['img_thumbnail']) }}" alt="" width="100px">
                                        </td>
                                        <td><?= $item['price_sale'] ?></td>
                                        <td><?= $item['price_regular'] ?></td>
                                        <td><?= $item['overview'] ?></td>
                                        
                                        <td><?= $item['created_at'] ?></td>
                                        <td><?= $item['updated_at'] ?></td>
                                        <td>

                                            <a class="btn btn-info"
                                                href="{{ url('admin/products/' . $item['id'] . '/show') }}">Xem</a>
                                            <a class="btn btn-warning"
                                                href="{{ url('admin/products/' . $item['id'] . '/edit') }}">Sửa</a>
                                            <a class="btn btn-danger"
                                                href="{{ url('admin/products/' . $item['id'] . '/delete') }}"
                                                onclick="return confirm('Chắc chắn xoá không?')">Xoá</a>

                                        </td>
                                    </tr>
                                @endforeach

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
@endsection
