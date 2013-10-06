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
 * @internal    @modx_category 
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
        $tabs_move.="jQuery('.tab-row').append(jQuery('h2.tab:nth-child(".$value.")').get(0));\n";
    }
    $html = "
          <script type='text/javascript'>
              jQuery.noConflict();
              jQuery(document).ready(function() {
			 ".$tabs_move."
              });
          </script>
    ";
    $e->output($html);
}
