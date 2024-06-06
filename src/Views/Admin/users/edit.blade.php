@extends('layouts.master')

@section('title')
    <h1>Cập Nhập người dùng: {{ $user['name'] }}</h1>
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
                    <h3 class="m-0">Cập Nhập User</h3>
                  </div>
                </div>
              </div>
              <div class="white_card_body">
                
                <div class="table-responsive">
                  <table class="table table-dark">
                    <tbody>
                        <form action="{{ url("admin/users/{$user['id']}/update") }}" enctype="multipart/form-data" method="POST">
                            <div class="mb-3 mt-3">
                                <label for="name" class="form-label">Name:</label>
                                <input type="text" class="form-control" id="name" placeholder="Enter name" value="{{ $user['name'] }}"
                                    name="name">
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email:</label>
                                <input type="email" class="form-control" id="email" placeholder="Enter email"
                                    value="{{ $user['email'] }}" name="email">
                            </div>
                            <div class="mb-3">
                                <label for="avatar" class="form-label">Avatar:</label>
                                <input type="file" class="form-control" id="avatar" placeholder="Enter avatar" name="avatar">
                                <img src="{{ asset($user['avatar']) }}" alt="" width="100px">
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password:</label>
                                <input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
                            </div>
                
                
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
    @endsection

    </html>
