//<?php
/**
 * settingTabMove
 * 
 * Movement of the tabs at the resource
 *
 * @category    plugin
 * @version     0.2
 * @author	RuSS_lan (russandrussky@gmail.com)
 * @internal    @properties &tabs_no=Номер закладки, которую нужно переместить;text;3,2
 * @internal    @events OnDocFormRender
 * @internal    @installset base
 */

/*
 * setting tab move
 *
 * Written By RuSS_lan - 05.10.2013
 *
 *
 * Configuration:
 * check the OnDocFormRender event
 * Version 0.2
 * Contact E-mail: russandrussky@gmail.com
 *          skype: g_r_u_v
 *
 */
$e = & $modx->Event;
$tab_ID=explode(',',$tabs_no);
if ($e->name == "OnDocFormRender") 
{
	foreach($tab_ID as $key=>$value){
        $tabs_move.="j('.tab-row').append(j('h2.tab:nth-child(".$value.")').get(0));";
    }
    $html = "
          <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js'  type='text/javascript'></script>
          <script type='text/javascript'>
              var j = jQuery.noConflict();
              j(document).ready(function() {
				  ".$tabs_move."
              });
          </script>
    ";
    $e->output($html);
}
