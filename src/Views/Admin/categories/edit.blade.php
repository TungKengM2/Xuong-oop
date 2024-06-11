@extends('layouts.master')

@section('title')
    <h1>Cập Nhập danh mục</h1>
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
                    <h3 class="m-0">Cập Nhập Danh Mục</h3>
                  </div>
                </div>
              </div>
              <div class="white_card_body">
                
                <div class="table-responsive">
                  <table class="table table-dark">
                    <tbody>
                        <form action="{{ url("admin/categories/{$category['id']}/update") }}" enctype="multipart/form-data" method="POST">
                            <div class="mb-3 mt-3">
                                <label for="name" class="form-label">Name:</label>
                                <input type="text" class="form-control" id="name" placeholder="Enter name" value="{{ $category['name'] }}"
                                    name="name">
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
