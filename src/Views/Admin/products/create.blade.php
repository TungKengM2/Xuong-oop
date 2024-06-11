@extends('layouts.master')

@section('title')
    <h1>Thêm Mới Sản Phẩm:</h1>
@endsection

@section('content')

    @if (!empty($_SESSION['errors']))
        <div class="alert alert-warning">

            <ul>
                @foreach ($_SESSION['errors'] as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>

            @php
                unset($_SESSION['errors']);
            @endphp

        </div>
    @endif



    <div class="col-lg-12">
        <div class="white_card card_height_100 mb_30">
            <div class="white_card_header">
                <div class="box_header m-0">
                    <div class="main-title">
                        <h3 class="m-0">
                            Thêm Mới Sản Phẩm:
                        </h3>
                    </div>
                </div>
            </div>
            <div class="white_card_body">

                <div class="table-responsive">
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <form action="{{ url('admin/products/store') }}" enctype="multipart/form-data"
                                    method="POST" enctype="multipart/form-data">
                                    <div class="mb-3 mt-3">
                                        <label for="category_id" class="form-label">Category:</label>
                                        <select class="form-select" id="category_id" name="category_id">
                                            @foreach ($categories as $id => $name)
                                                <option value="{{ $id }}">{{ $name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="mb-3 mt-3">
                                        <label for="name" class="form-label">Name:</label>
                                        <input type="text" class="form-control" id="name" placeholder="Enter name"
                                            name="name">
                                    </div>
                                    <div class="mb-3">
                                        <label for="img_thumbnail" class="form-label">img_thumbnail:</label>
                                        <input type="file" class="form-control" id="img_thumbnail"
                                            placeholder="Enter img_thumbnail" name="img_thumbnail">
                                    </div>
                                    <div class="mb-3">
                                        <label for="price_regular" class="form-label">price_regular:</label>
                                        <input type="price_regular" class="form-control" id="price_regular"
                                            placeholder="Enter price_regular" name="price_regular">
                                    </div>
                                    <div class="mb-3">
                                        <label for="price_sale" class="form-label">price_sale:</label>
                                        <input type="price_sale" class="form-control" id="price_sale"
                                            placeholder="Enter price_sale" name="price_sale">
                                    </div>
                                    <div class="mb-3">
                                        <label for="overview" class="form-label">OverView:</label>
                                        <input type="overview" class="form-control" id="overview"
                                            placeholder="Enter overview" name="overview">
                                    </div>
                                    <div class="mb-3">
                                        <label for="content" class="form-label">Content:</label>
                                        <input type="content" class="form-control" id="content"
                                            placeholder="Enter content" name="content">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </form>
                            </tr>
                        </thead>

                    </table>
                </div>
            </div>
        </div>
    </div>

@endsection

</html>
