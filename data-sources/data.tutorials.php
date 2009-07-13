<?php	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcetutorials extends Datasource{
		
		public $dsParamROOTELEMENT = 'tutorials';
		public $dsParamORDER = 'asc';
		public $dsParamLIMIT = '20';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'date';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'22' => '37',
				'25' => 'yes',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'description',
				'section',
				'category',
				'tags',
				'date'
		);		
		
		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Tutorials',
					 'author' => array(
							'name' => 'Stephen Bau',
							'website' => 'http://www.designprojectx.com',
							'email' => 'bauhouse@gmail.com'),
					 'version' => '1.0',
					 'release-date' => '2009-06-10T21:01:04+00:00');	
		}
		
		public function getSource(){
			return '4';
		}
		
		public function allowEditorToParse(){
			return true;
		}
		
		public function grab(&$param_pool){
			$result = new XMLElement($this->dsParamROOTELEMENT);
				
			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}				if($this->_force_empty_result) $result = $this->emptyXMLSet();
			
			
			
			return $result;
		}
	}