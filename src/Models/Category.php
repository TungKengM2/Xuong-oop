<?php

namespace Mx2\XuongOop\Models;

use Mx2\XuongOop\Commons\Model;

class Category extends Model
{
    protected string $tableName = 'categories';
    public function findById($id)
    {
        return $this->queryBuilder
            ->select('*')
            ->from($this->tableName)
            ->where('id = ?')
            ->setParameter('0', $id)
            ->fetchAssociative();
    }

    public function all()
    {
        $queryBuilder = $this->conn->createQueryBuilder();

        return $queryBuilder
            ->select('*')
            ->from($this->tableName)
            ->fetchAllAssociative();
    }
    public function countAll()
    {
        $result = $this->queryBuilder
            ->select('COUNT(*) AS total')
            ->from($this->tableName)
            ->fetchAssociative();

        return $result['total'];
    }

}
