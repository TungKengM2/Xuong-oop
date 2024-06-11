<?php

namespace Mx2\XuongOop\Controllers\Admin;


use Mx2\XuongOop\Commons\Controller;
use Mx2\XuongOop\Commons\Helper;
use Mx2\XuongOop\Models\Category;
use Mx2\XuongOop\Models\Product;
use Mx2\XuongOop\Models\User;
use Rakit\Validation\Validator;

class ProductController extends Controller
{
    private Product $product;
    private Category $category;

    private User     $user;

    public function __construct()
    {
        $this->product  = new Product();
        $this->category = new Category();
    }

    public function index()
    {
        $data = $this->product->all();
        $totalRecords = $this->product->countAll();
        $this->renderViewAdmin('products.' . __FUNCTION__, [
            'data' => $data,
            'totalRecords' => $totalRecords
        ]);
    }

    public function create()
    {
        $categories = $this->category->all();

        $categories = array_column($categories, 'name', 'id');
        $this->renderViewAdmin('products.' . __FUNCTION__, [
            'categories' => $categories
        ]);
    }

    public function store()
    {
        $validator = new Validator;
        $validation = $validator->make($_POST + $_FILES, [
            'name'             => 'required|max:50',
            'category_id'      => 'required',
            'price_regular'    => 'required',
            'price_sale'       => 'required',
            'overview'         => 'required',
            'content'          => 'required',
            'img_thumbnail'    => 'required|uploaded_file:0,2M,png,jpg,jpeg',

        ]);
        $validation->validate();

        if ($validation->fails()) {

            $_SESSION['errors'] = $validation->errors()->firstOfAll();

            header('Location: ' . url('admin/products/create'));
            exit;
        } else {
            $data = [
                'category_id'       => $_POST['category_id'],
                'name'              => $_POST['name'],
                'price_regular'     => $_POST['price_regular'],
                'price_sale'        => $_POST['price_sale'],
                'overview'          => $_POST['overview'],
                'content'           => $_POST['content'],
            ];

            if (isset($_FILES['img_thumbnail']) && $_FILES['img_thumbnail']['size'] > 0) {

                $from = $_FILES['img_thumbnail']['tmp_name'];
                $to   = 'assets/uploads/' . time() . $_FILES['img_thumbnail']['name'];

                if (move_uploaded_file($from, PATH_ROOT . $to)) {
                    $data['img_thumbnail'] = $to;
                } else {
                    $_SESSION['errors']['img_thumbnail'] = 'Upload khong thanh cong';

                    header('Location: ' . url('admin/products/create'));
                    exit;
                }
            }
            $this->product->insert($data);
            $_SESSION['status'] = true;
            $_SESSION['msg'] = 'Thao tac thanh cong';
            header('Location: ' . url('admin/products'));
            exit;
        }
    }



    public function show($id)
    {
        $product = $this->product->findById($id);

        $this->renderViewAdmin('products.show',  [
            'product' => $product
        ]);
    }

    public function edit($id)
    {
        $categories = $this->category->all();

        $categories = array_column($categories, 'name', 'id');

        $product = $this->product->findById($id);

        $this->renderViewAdmin('products.' . __FUNCTION__, [
            'categories' => $categories,
            'product'    => $product
        ]);
    }

    public function update($id)
    {
        $product = $this->product->findById($id);

        $validator = new Validator;
        $validation = $validator->make($_POST + $_FILES, [
            'name'             => 'required|max:50',
            'category_id'      => 'required',
            'price_regular'    => 'required',
            'price_sale'       => 'required',
            'overview'         => 'required',
            'content'          => 'required',
            'img_thumbnail'    => 'required|uploaded_file:0,2M,png,jpg,jpeg',
        ]);
        $validation->validate();

        if ($validation->fails()) {

            $_SESSION['errors'] = $validation->errors()->firstOfAll();

            header('Location: ' . url("admin/products/{$product['id']}/edit"));
            exit;
        } else {
            $data = [
                'category_id'       => $_POST['category_id'],
                'name'              => $_POST['name'],
                'price_regular'     => $_POST['price_regular'],
                'price_sale'        => $_POST['price_sale'],
                'overview'          => $_POST['overview'],
                'content'           => $_POST['content'],
            ];
            $flagUpload = false;
            if (isset($_FILES['img_thumbnail']) && $_FILES['img_thumbnail']['size'] > 0) {

                $flagUpload = true;

                $from = $_FILES['img_thumbnail']['tmp_name'];
                $to   = 'assets/uploads/' . time() . $_FILES['img_thumbnail']['name'];

                if (move_uploaded_file($from, PATH_ROOT . $to)) {
                    $data['img_thumbnail'] = $to;
                } else {
                    $_SESSION['errors']['img_thumbnail'] = 'Upload khong thanh cong';

                    header('Location: ' . url("admin/products/{$product['id']}/edit"));
                    exit;
                }
            }
            $this->product->update($id, $data);
            if (
                $flagUpload
                && $product['img_thumbnail']
                && file_exists(PATH_ROOT . $product['img_thumbnail'])
            ) {
                unlink(PATH_ROOT . $product['img_thumbnail']);
            }



            $_SESSION['status'] = true;
            $_SESSION['msg'] = 'Thao tac thanh cong';
            header('Location: ' . url("admin/products/{$product['id']}/edit"));
            exit;
        }
    }

    public function delete($id)
    {
        $product = $this->product->findById($id);
        $this->product->delete($id);

        if (
            $product['img_thumbnail']
            && file_exists(PATH_ROOT . $product['img_thumbnail'])
        ) {
            unlink(PATH_ROOT . $product['img_thumbnail']);
        }

        header('Location: ' . url('admin/products'));
        exit();
    }
}
