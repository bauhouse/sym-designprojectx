<?php	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourceentries extends Datasource{
		
		public $dsParamROOTELEMENT = 'entries';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '50';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'date';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'25' => 'yes',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
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
					 'name' => 'Entries',
					 'author' => array(
							'name' => 'Stephen Bau',
							'website' => 'http://www.designprojectx.com',
							'email' => 'bauhouse@gmail.com'),
					 'version' => '1.0',
					 'release-date' => '2009-05-21T01:27:51+00:00');	
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