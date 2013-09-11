<?php

/**
 * AbonnementTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class AbonnementTable extends Doctrine_Table
{
    /**
     * Returns an instance of this class.
     *
     * @return object AbonnementTable
     */
    public static function getInstance()
    {
        return Doctrine_Core::getTable('Abonnement');
    }

    public function getMyAsso($user_id){
      $q = $this->createQuery('q')
            ->select ('q.id, a.name, ar.*')
            ->where('q.user_id = ?', $user_id)
            ->leftJoin('q.Asso a')
            ->leftJoin('a.Article ar')
            ->orderBy('ar.updated_at desc');
      return $q;
    }

    public function getCurrentAssoFollower($asso, $user) {
      $q = $this->createQuery('q')
            ->where('q.asso_id = ?', $asso)
            ->andWhere('q.user_id = ?', $user);
      return $q;
    }
}