<?php

namespace Mx2\XuongOop\Models;

use Mx2\XuongOop\Commons\Model;

class Product extends Model
{
    protected string $tableName = 'products';

    public function all()
    {
        $queryBuilder = $this->conn->createQueryBuilder();

        return $queryBuilder
            ->select(
                'p.id',
                'p.name',
                'p.img_thumbnail',
                'p.price_regular',
                'p.price_sale',
                'p.overview',
                'p.content',
                'p.created_at',
                'p.updated_at',
                'c.name as c_name',
            )
            ->from($this->tableName, 'p')
            ->join('p', 'categories', 'c', 'p.category_id = c.id')
            ->fetchAllAssociative();
    }

    public function findById($id)
    {
        $queryBuilder = $this->conn->createQueryBuilder();

        return $queryBuilder
            ->select('*')
            ->from($this->tableName)
            ->where('id= ?')
            ->setParameter(0, $id)
            ->fetchAssociative();
    }

    public function insert($data)
    {
        $queryBuilder = $this->conn->createQueryBuilder();

        $query = $queryBuilder->insert($this->tableName);

        $index = 0;
        foreach($data as $filed => $value)
        {
            $query->setValue($filed, '?')->setParameter($index, $value);

            ++$index;
        }

        $query->executeQuery();
    }
}
