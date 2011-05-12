<?php
// Connection Component Binding
Doctrine_Manager::getInstance()->bindComponent('Profile', 'doctrine');

/**
 * BaseProfile
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $user_id
 * @property string $nickname
 * @property date $birthday
 * @property char $sexe
 * @property string $mobile
 * @property integer $home_place
 * @property integer $family_place
 * @property Place $HomePlace
 * @property Place $FamilyPlace
 * 
 * @method integer getUserId()       Returns the current record's "user_id" value
 * @method string  getNickname()     Returns the current record's "nickname" value
 * @method date    getBirthday()     Returns the current record's "birthday" value
 * @method char    getSexe()         Returns the current record's "sexe" value
 * @method string  getMobile()       Returns the current record's "mobile" value
 * @method integer getHomePlace()    Returns the current record's "home_place" value
 * @method integer getFamilyPlace()  Returns the current record's "family_place" value
 * @method Place   getHomePlace()    Returns the current record's "HomePlace" value
 * @method Place   getFamilyPlace()  Returns the current record's "FamilyPlace" value
 * @method Profile setUserId()       Sets the current record's "user_id" value
 * @method Profile setNickname()     Sets the current record's "nickname" value
 * @method Profile setBirthday()     Sets the current record's "birthday" value
 * @method Profile setSexe()         Sets the current record's "sexe" value
 * @method Profile setMobile()       Sets the current record's "mobile" value
 * @method Profile setHomePlace()    Sets the current record's "home_place" value
 * @method Profile setFamilyPlace()  Sets the current record's "family_place" value
 * @method Profile setHomePlace()    Sets the current record's "HomePlace" value
 * @method Profile setFamilyPlace()  Sets the current record's "FamilyPlace" value
 * 
 * @package    simde
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
abstract class BaseProfile extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('profile');
        $this->hasColumn('user_id', 'integer', null, array(
             'type' => 'integer',
             ));
        $this->hasColumn('nickname', 'string', 50, array(
             'type' => 'string',
             'length' => 50,
             ));
        $this->hasColumn('birthday', 'date', null, array(
             'type' => 'date',
             ));
        $this->hasColumn('sexe', 'char', 1, array(
             'type' => 'char',
             'length' => 1,
             ));
        $this->hasColumn('mobile', 'string', 15, array(
             'type' => 'string',
             'length' => 15,
             ));
        $this->hasColumn('home_place', 'integer', null, array(
             'type' => 'integer',
             ));
        $this->hasColumn('family_place', 'integer', null, array(
             'type' => 'integer',
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasOne('Place as HomePlace', array(
             'local' => 'home_place',
             'foreign' => 'id'));

        $this->hasOne('Place as FamilyPlace', array(
             'local' => 'family_place',
             'foreign' => 'id'));

        $timestampable0 = new Doctrine_Template_Timestampable();
        $this->actAs($timestampable0);
    }
}