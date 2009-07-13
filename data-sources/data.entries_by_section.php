<?php	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourceentries_by_section extends Datasource{
		
		public $dsParamROOTELEMENT = 'entries-by-section';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '20';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$ds-section';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'22' => '{$ds-section}',
				'25' => 'yes',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'title',
				'description',
				'body',
				'section',
				'category',
				'tags',
				'date'
		);		
		
		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-section');
		}
		
		public function about(){
			return array(
					 'name' => 'Entries by Section',
					 'author' => array(
							'name' => 'Stephen Bau',
							'website' => 'http://designprojectx.com',
							'email' => 'bauhouse@gmail.com'),
					 'version' => '1.0',
					 'release-date' => '2009-05-30T14:15:29+00:00');	
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