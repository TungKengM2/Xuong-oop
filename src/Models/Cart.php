<?php

namespace Mx2\XuongOop\Models;

use Mx2\XuongOop\Commons\Model;

class Cart extends Model
{
    protected string $tableName = 'carts';

    public function findByUserID($userID) {
        return $this->queryBuilder
        ->select('*')
        ->from($this->tableName)
        ->where('user_id = ?')
        ->setParameter('0', $userID)
        ->fetchAssociative();
    }

}
