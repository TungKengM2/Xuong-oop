<?php

namespace Mx2\XuongOop\Controllers\Client;

use Mx2\XuongOop\Commons\Controller;

class ProductController extends Controller
{
    public function index()
    {
        echo __CLASS__ . '@'  . __FUNCTION__;
    }

    public function detail($id)
    {
        echo __CLASS__ . '@'  . __FUNCTION__. '@'  . $id;
    }
}
