<?php

namespace Mx2\XuongOop\Models;

use Mx2\XuongOop\Commons\Model;

class User extends Model
{
    protected string $tableName = 'users';

    public function findByEmail($email)
    {
        return $this->queryBuilder
            ->select('*')
            ->from($this->tableName)
            ->where('email = ?')
            ->setParameter('0', $email)
            ->fetchAssociative();
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
