<?php
/**
 * This class has been auto-generated by the Doctrine ORM Framework
 */
class Addfiliere extends Doctrine_Migration_Base
{
    public function up()
    {
        $this->createTable('filiere', array(
             'id' => 
             array(
              'type' => 'integer',
              'length' => 8,
              'autoincrement' => true,
              'primary' => true,
             ),
             'name' => 
             array(
              'type' => 'string',
              'length' => 10,
             ),
             ), array(
             'indexes' => 
             array(
             ),
             'primary' => 
             array(
              0 => 'id',
             ),
             'collate' => 'utf8_unicode_ci',
             'charset' => 'utf8',
             ));
    }

    public function down()
    {
        $this->dropTable('filiere');
    }
}