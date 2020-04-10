<?php

class datasourceentries_archive extends SectionDatasource
{
    public $dsParamROOTELEMENT = 'entries-archive';
    public $dsParamORDER = 'desc';
    public $dsParamGROUP = '24';
    public $dsParamPAGINATERESULTS = 'yes';
    public $dsParamLIMIT = '100';
    public $dsParamSTARTPAGE = '1';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamSORT = 'date';
    public $dsParamHTMLENCODE = 'no';
    public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

    public $dsParamFILTERS = array(
        '25' => 'yes',
    );

    public $dsParamINCLUDEDELEMENTS = array(
        'title',
        'section',
        'category',
        'tags',
        'date'
    );

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Entries Archive',
            'author' => array(
                'name' => 'Stephen Bau',
                'website' => 'http://001.designprojectx.test',
                'email' => 'bauhouse@gmail.com'),
            'version' => 'Symphony 2.7.10',
            'release-date' => '2020-04-10T21:08:26+00:00'
        );
    }

    public function getSource()
    {
        return '4';
    }

    public function allowEditorToParse()
    {
        return true;
    }

    public function execute(array &$param_pool = null)
    {
        $result = new XMLElement($this->dsParamROOTELEMENT);

        try {
            $result = parent::execute($param_pool);
        } catch (FrontendPageNotFoundException $e) {
            // Work around. This ensures the 404 page is displayed and
            // is not picked up by the default catch() statement below
            FrontendPageNotFoundExceptionHandler::render($e);
        } catch (Exception $e) {
            $result->appendChild(new XMLElement('error',
                General::wrapInCDATA($e->getMessage() . ' on ' . $e->getLine() . ' of file ' . $e->getFile())
            ));
            return $result;
        }

        if ($this->_force_empty_result) {
            $result = $this->emptyXMLSet();
        }

        if ($this->_negate_result) {
            $result = $this->negateXMLSet();
        }

        return $result;
    }
}