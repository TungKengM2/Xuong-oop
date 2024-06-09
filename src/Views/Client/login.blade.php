<!DOCTYPE html>
<html lang="en">

<head>
    @include('layouts.partials.head')

</head>

<body>
    @include('layouts.partials.headerLogin')
    <div class="container">
        <h1 class=""mt-5 mb-3 text-center>Login</h1>
        @if (!empty($_SESSION['error']))
            <div class="alert alert-warning mt-3 mb-3">
                {{ $_SESSION['error'] }}
            </div>

            @php
                unset($_SESSION['error']);
            @endphp
        @endif

        <div class="col-xl-12 col-lg-6 col-md-8">
            <div class="box_account">
                <h3 class="client">Already Client</h3>
                <div class="form_container">
                    <div class="row no-gutters">
                        <div class="col-lg-6 pr-lg-1">
                            <a href="#0" class="social_bt facebook">Login with Facebook</a>
                        </div>
                        <div class="col-lg-6 pl-lg-1">
                            <a href="#0" class="social_bt google">Login with Google</a>
                        </div>
                    </div>
                    <div class="row">
                        <form action="{{ url('handle-login') }}" method="POST">
                            <div class="mb-3 mt-3">
                                <label for="email" class="form-label">Email:</label>
                                <input type="email" class="form-control" id="email" placeholder="Enter email"
                                    name="email">
                            </div>
                            <div class="mb-3">
                                <label for="pwd" class="form-label">Password:</label>
                                <input type="password" class="form-control" id="pwd" placeholder="Enter password"
                                    name="password">
                            </div>

                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>

                <!-- /form_container -->
            </div>
            <!-- /box_account -->
            <!-- /row -->
        </div>

    </div>
    @include('layouts.partials.footer')
    @include('layouts.partials.script')
</body>

</html>
