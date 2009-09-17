# DesignProjectX

- Author: Stephen Bau
- Version: 0.2
- Date: 17 September 2009
- Github Repository: <http://github.com/bauhouse/designprojectx>

## Overview

### A site about learning by doing

This is my playground, my sandbox for projects that I am toying with. I learn by doing. So this is where I do some of my stuff.

I love to experiment with new things. Design is my passion. I desire to create, inspire, transform, revolutionize. The tools of my experimentation are an Apple Mac G5, Compaq Presario, Adobe InDesign, Photoshop and Illustrator, Dreamweaver and Flash, XHTML, CSS, Apache, PHP, MySQL, Symphony CMS, Joyent. My design is influenced by the Modernist roots of art and design at the Bauhaus, a school founded by Walter Gropius in 1919 in Weimar, Germany. The influence tends to show up less in design style, but more in my idealism and my hope to encourage social unity in diversity through the synthesis of art and technology. Stephen Bau, MGDC

Visit the site at <http://designprojectx.com/>

## Installation

It is best to install this ensemble with Git, but you can also install this ensemble by downloading a copy of Symphony 2.0.6 and each of the required extensions and this workspace. Be sure to rename the directory to `workspace`.

### Installing with Git

1. Clone a copy of Symphony 2.0.6 and rename the directory:

		git clone git://github.com/symphony/symphony-2.git

2. Rename the `symphony-2` directory (if necessary):

		mv symphony-2 designprojectx
		cd designprojectx
		
3. Initialize the submodules for the default extensions:

		git submodule init
		git submodule update

   Or you can clone the default extensions:

		cd /path/to/designprojectx/extensions
		git clone git://github.com/pointybeard/export_ensemble.git
		git clone git://github.com/pointybeard/jit_image_manipulation.git
		git clone git://github.com/pointybeard/maintenance_mode.git
		git clone git://github.com/pointybeard/markdown.git
		git clone git://github.com/pointybeard/selectbox_link_field.git
		git clone git://github.com/symphony/debugdevkit.git
		git clone git://github.com/symphony/profiledevkit.git

4. Clone the required extensions:

		cd /path/to/designprojectx/extensions
		git clone git://github.com/ahwayakchih/markitup.git
		git clone git://github.com/bauhouse/export_install_file.git
		git clone git://github.com/nickdunn/entity_diagram.git
		git clone git://github.com/nickdunn/order_entries.git
		git clone git://github.com/nickdunn/publishfiltering.git
		git clone git://github.com/nickdunn/section_schemas.git
		git clone git://github.com/pointybeard/content_type_mappings.git
		git clone git://github.com/rowan-lewis/browsedevkit.git
		git clone git://github.com/rowan-lewis/logsdevkit.git

5. Clone the Symphony workspace for DesignProjectX:

		cd ..
		git clone git@github.com:bauhouse/sym-designprojectx.git

6. Rename the `sym-designprojectx` directory as `workspace`:

		mv sym-designprojectx workspace

7. Set permissions to allow Symphony to write files to the server:

		chmod 777 .
		chmod -R 777 workspace

8. Be sure to have an empty database ready for Symphony (or use a different table prefix). Navigate to the root of the install and provide your preferences, server configuration details and primary user information and click the "Install" button to install Symphony 2 and DesignProjectX.

9. Secure the site by changing permissions for the root and symphony directories.

		chmod 755 .

10. Clap your hands with glee!