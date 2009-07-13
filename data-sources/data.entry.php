<?php	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourceentry extends Datasource{
		
		public $dsParamROOTELEMENT = 'entry';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '20';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$entry';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'19' => '{$entry}',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'title',
				'description',
				'body',
				'section',
				'category',
				'tags',
				'date',
				'publish'
		);		
		
		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Entry',
					 'author' => array(
							'name' => 'Stephen Bau',
							'website' => 'http://www.designprojectx.com',
							'email' => 'bauhouse@gmail.com'),
					 'version' => '1.0',
					 'release-date' => '2009-05-21T01:25:55+00:00');	
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