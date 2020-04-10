<?php
	$settings = array(


        ###### ADMIN ######
        'admin' => array(
            'max_upload_size' => '5242880',
            'upload_blacklist' => '/\\.(?:php[34567s]?|phtml)$/i',
        ),
        ########


        ###### SYMPHONY ######
        'symphony' => array(
            'pagination_maximum_rows' => '20',
            'lang' => 'en',
            'version' => '2.7.10',
            'cookie_prefix' => 'sym-',
            'session_gc_divisor' => '10',
            'association_maximum_rows' => '5',
            'cell_truncation_length' => '75',
            'admin-path' => 'symphony',
            'enable_xsrf' => 'no',
        ),
        ########


        ###### LOG ######
        'log' => array(
            'archive' => '1',
            'maxsize' => '102400',
            'filter' => 24575,
        ),
        ########


        ###### IMAGE ######
        'image' => array(
            'cache' => '1',
            'quality' => '90',
        ),
        ########


        ###### DATABASE ######
        'database' => array(
            'host' => 'localhost',
            'port' => '3306',
            'user' => null,
            'password' => null,
            'db' => null,
            'tbl_prefix' => 'sym_',
            'query_caching' => 'on',
        ),
        ########


        ###### PUBLIC ######
        'public' => array(
            'display_event_xml_in_source' => 'yes',
        ),
        ########


        ###### GENERAL ######
        'general' => array(
            'sitename' => 'DesignProjectX',
            'useragent' => 'Symphony/2.7.10',
        ),
        ########


        ###### REGION ######
        'region' => array(
            'time_format' => 'g:i:s a',
            'date_format' => 'd F Y',
            'timezone' => 'America/Vancouver',
            'datetime_separator' => ' ',
        ),
        ########


        ###### FILE ######
        'file' => array(
            'write_mode' => '0775',
        ),
        ########


        ###### DIRECTORY ######
        'directory' => array(
            'write_mode' => '0775',
        ),
        ########


        ###### CONTENT-TYPE-MAPPINGS ######
        'content-type-mappings' => array(
            'xml' => 'text/plain; charset=utf-8',
            'text' => 'text/plain; charset=utf-8',
        ),
        ########


        ###### SORTING ######
        'sorting' => array(
            'section_types_sortby' => null,
            'section_types_order' => 'asc',
            'section_sections_sortby' => null,
            'section_sections_order' => 'asc',
            'section_categories_sortby' => null,
            'section_categories_order' => 'asc',
            'section_entries_sortby' => '24',
            'section_entries_order' => 'desc',
            'section_items_sortby' => null,
            'section_items_order' => 'asc',
        ),
        ########
    );
