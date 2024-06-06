@extends('layouts.master')

@section('title')
    Chi Tiết Người Dùng: {{ $user['name'] }}
@endsection

@section('content')
    <div class="col-lg-12">
        <div class="white_card card_height_100 mb_30">
            <div class="white_card_header">
                <div class="box_header m-0">
                    <div class="main-title">
                        <h3 class="m-0"> Chi Tiết Người Dùng: {{ $user['name'] }}
                        </h3>
                    </div>
                </div>
            </div>
            <div class="white_card_body">
                <div class="table-responsive">
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col">Trường</th>
                                <th scope="col">Giá trị</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($user as $field => $value)
                                <tr>
                                    <td>{{ $field }}</td>
                                    <td>{{ $value }}</td>

                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

</html>
