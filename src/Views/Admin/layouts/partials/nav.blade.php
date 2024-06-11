<nav class="sidebar vertical-scroll  ps-container ps-theme-default ps-active-y">
    <div class="logo d-flex justify-content-between">
        <a href="{{asset('admin')}}"><img src="{{ asset('assets/admin/img/logo.png') }}" alt></a>
        <div class="sidebar_close_icon d-lg-none">
            <i class="ti-close"></i>
        </div>
    </div>
    <ul id="sidebar_menu">
        <li class="mm-active">
            <a class="has-arrow" href="#" aria-expanded="false">
                <div class="icon_menu">
                    <img src="{{ asset('assets/admin/img/menu-icon/dashboard.svg') }}" alt>
                </div>
                <span>Chức Năng</span>
            </a>
            <ul>
                <li><a class="active" href="{{asset('admin/users')}}">Quản Lý User</a></li>
                <li><a href="{{asset('admin/categories')}}">Quản Lý Danh Mục</a></li>
                <li><a href="{{asset('admin/products')}}">Quản Lý Sản Phẩm</a></li>
            </ul>
        </li>
 
        <li class>
            <a href="{{ asset('admin/') }}" aria-expanded="false">
                <div class="icon_menu">
                    <img src="{{ asset('assets/admin/img/menu-icon/5.svg') }}" alt>
                </div>
                <span href="{{ asset('admin/') }}">Trang chủ</span>
            </a>
        </li>
    
    </ul>
</nav>