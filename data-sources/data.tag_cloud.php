<?php

    require_once(TOOLKIT . '/class.datasource.php');

    Class datasourceTag_Cloud extends Datasource{

        function about(){
            return array(
                    'name' => 'Tag Cloud',
                    'author' => array(
                        'name' => 'Nick Dunn',
                        'website' => 'http://nick-dunn.co.uk',
                        'email' => 'nick@nick-dunn.co.uk'),
                    'version' => '1.0',
                    'release-date' => '2008-12-09T12:00:00+00:00');
        }

        function grab(&$param_pool){

            $tag_list_id = "38";
            $result = new XMLElement("tag-cloud");

            $tags = $this->_Parent->Database->fetch("SELECT DISTINCT(handle), COUNT(handle) AS count, value FROM sym_entries_data_$tag_list_id GROUP BY handle ORDER BY handle ASC");

            foreach($tags as $tag){
                $tag_node = new XMLElement("tag", $tag["value"]);
                $tag_node->setAttributeArray(array("handle" => $tag["handle"], "count" => $tag["count"]));
                $result->appendChild($tag_node);
            }

            return $result;
        }
    }

?>