<?php

namespace Mx2\XuongOop\Controllers\Admin;


use Mx2\XuongOop\Commons\Controller;
use Mx2\XuongOop\Commons\Helper;
use Mx2\XuongOop\Models\Category;
use Mx2\XuongOop\Models\User;
use Rakit\Validation\Validator;


class CategoryController extends Controller
{
    private Category $category;

    public function __construct()
    {
        $this->category = new Category();
    }

    public function index()
    {
        [$categories, $totalPage] = $this->category->paginate($_GET['page'] ?? 1);

        $this->renderViewAdmin('categories.index', [
            'categories' => $categories,
            'totalPage' => $totalPage
        ]);
    }

    public function create()
    {
        $this->renderViewAdmin('categories.create');
    }

    public function store()
    {
        $validator = new Validator;
        $validation = $validator->make($_POST + $_FILES, [
            'name'             => 'required|max:50',

        ]);
        $validation->validate();

        if ($validation->fails()) {

            $_SESSION['errors'] = $validation->errors()->firstOfAll();

            header('Location: ' . url('admin/categories/create'));
            exit;
        } else {
            $data = [
                'name' => $_POST['name'],
            ];
        }
        $this->category->insert($data);
        $_SESSION['status'] = true;
        $_SESSION['msg'] = 'Thao tac thanh cong';
        header('Location: ' . url('admin/categories'));
        exit;
    }

    public function edit($id)
    {
        $category = $this->category->findById($id);

        $this->renderViewAdmin('categories.edit', [
            'category' => $category
        ]);
    }
    public function update($id)
    {
        $category = $this->category->findById($id);

        $validator = new Validator;
        $validation = $validator->make($_POST, [
            'name'      => 'required|max:50',

        ]);
        $validation->validate();

        if ($validation->fails()) {

            $_SESSION['errors'] = $validation->errors()->firstOfAll();

            header('Location: ' . url("admin/categories/{$category['id']}/edit"));
            exit;
        } else {
            $data = [
                'name' => $_POST['name'],
            ];
            $this->category->update($id, $data);
            $_SESSION['status'] = true;
            $_SESSION['msg'] = 'Thao tac thanh cong';
            header('Location: ' . url("admin/categories"));
            exit;
        }
    }

    public function delete($id)
    {
        $category = $this->category->findById($id);

        $this->category->delete($id);



        header('Location: ' . url('admin/categories'));
        exit();
    }
}
