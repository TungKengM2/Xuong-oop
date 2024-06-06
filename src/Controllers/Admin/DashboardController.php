<?php

namespace Mx2\XuongOop\Controllers\Admin;


use Mx2\XuongOop\Commons\Controller;
use Mx2\XuongOop\Commons\Helper;
use Mx2\XuongOop\Models\User;
use Rakit\Validation\Validator;

class DashboardController extends Controller
{
    public function dashboard()
    {
        $this->renderViewAdmin(__FUNCTION__);
    }
}
