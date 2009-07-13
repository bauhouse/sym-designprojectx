<?php

	require_once(TOOLKIT . '/class.event.php');
	
	Class eventsave_entries extends Event{
		
		const ROOTELEMENT = 'save-entries';
		
		public $eParamFILTERS = array(
			'admin-only',
				'expect-multiple'
		);
			
		public static function about(){
			return array(
					 'name' => 'Save Entries',
					 'author' => array(
							'name' => 'Stephen Bau',
							'website' => 'http://www.designprojectx.com',
							'email' => 'bauhouse@gmail.com'),
					 'version' => '1.0',
					 'release-date' => '2009-05-25T19:56:42+00:00',
					 'trigger-condition' => 'action[save-entries]');	
		}

		public static function getSource(){
			return '4';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;save-entries>
  &lt;entry index="0" result="success" type="create | edit">
    &lt;message>Entry [created | edited] successfully.&lt;/message>
  &lt;/entry>
&lt;/save-entries></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned (<b>Notice that it is possible to get mixtures of success and failure messages when using the "Allow Multiple" option</b>):</p>
        <pre class="XML"><code>&lt;save-entries>
  &lt;entry index="0" result="error">
    &lt;message>Entry encountered errors when saving.&lt;/message>
    &lt;field-name type="invalid | missing" />
  &lt;/entry>
  &lt;entry index="1" result="success" type="create | edit">
    &lt;message>Entry [created | edited] successfully.&lt;/message>
  &lt;/entry>
  ...
&lt;/save-entries></code></pre>
        <p>The following is an example of what is returned if any filters fail:</p>
        <pre class="XML"><code>&lt;save-entries result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;filter name="admin-only" status="failed" />
  &lt;filter name="send-email" status="failed">Recipient username was invalid&lt;/filter>
  ...
&lt;/save-entries></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;label>Title
    &lt;input name="fields[0][title]" type="text" />
  &lt;/label>
  &lt;label>Description
    &lt;textarea name="fields[0][description]" rows="6" cols="50">&lt;/textarea>
  &lt;/label>
  &lt;label>Body
    &lt;textarea name="fields[0][body]" rows="15" cols="50">&lt;/textarea>
  &lt;/label>
  &lt;input name="fields[0][section]" type="hidden" value="..." />
  &lt;input name="fields[0][category]" type="hidden" value="..." />
  &lt;label>Tags
    &lt;input name="fields[0][tags]" type="text" />
  &lt;/label>
  &lt;label>Date
    &lt;input name="fields[0][date]" type="text" />
  &lt;/label>
  &lt;label>Publish
    &lt;input name="fields[0][publish]" type="checkbox" />
  &lt;/label>
  &lt;input name="action[save-entries]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id[0]" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://www.designprojectx.com/success/" /></code></pre>';
		}
		
		public function load(){			
			if(isset($_POST['action']['save-entries'])) return $this->__trigger();
		}
		
		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}		

	}

