<?php

namespace Mx2\XuongOop\Controllers\Client;


use Mx2\XuongOop\Commons\Controller;
use Mx2\XuongOop\Commons\Helper;
use Mx2\XuongOop\Models\User;

class HomeController extends Controller
{
    public function index()
    {   
        $user = new User();

        

        $name = 'TùngKengM2';

        $this->renderViewClient('home', [
            'name' => $name
        ]);
    }
}
