<?php

/**
 * EventMember form.
 *
 * @package    simde
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormTemplate.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class EventMemberForm extends BaseEventMemberForm
{
  public function configure()
  {
    //$this->widgetSchema['event_id'] = new sfWidgetFormInputHidden();
    $this->useFields(array('event_id'));
  }
}
