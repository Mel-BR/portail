<?php

/**
 * PoleTable
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class PoleTable extends Doctrine_Table
{

  /**
   * Returns an instance of this class.
   *
   * @return object PoleTable
   */
  public static function getInstance()
  {
    return Doctrine_Core::getTable('Pole');
  }
  
  public function getAllWithInfos()
  {
    $q = $this->createQuery('q')
      ->leftJoin('q.Infos i');
    
    return $q;
  }

  public function getOneByAsso($asso)
  {
    $q = $this->createQuery('p')
      ->where('p.asso_id = ?', $asso->getPrimaryKey());
    return $q->fetchOne();
  }

}
