# DesignProjectX

- Author: Stephen Bau
- Version: 0.4
- Date: 29 September 2012
- Github Repository: <http://github.com/bauhouse/designprojectx>
- Requirements: Symphony 2.3

## Overview

### A site about learning by doing

This is my playground, my sandbox for projects that I am toying with. I learn by doing. So this is where I do some of my stuff.

I love to experiment with new things. Design is my passion. I desire to create, inspire, transform, revolutionize. The tools of my experimentation are an Apple Mac G5, Compaq Presario, Adobe InDesign, Photoshop and Illustrator, Dreamweaver and Flash, XHTML, CSS, Apache, PHP, MySQL, Symphony CMS, Joyent. My design is influenced by the Modernist roots of art and design at the Bauhaus, a school founded by Walter Gropius in 1919 in Weimar, Germany. The influence tends to show up less in design style, but more in my idealism and my hope to encourage social unity in diversity through the synthesis of art and technology. Stephen Bau, MGDC

Visit the site at <http://designprojectx.com/>

## Installation

It is best to install this ensemble with Git, but you can also install this ensemble by downloading a copy of Symphony 2.3 and each of the required extensions and this workspace. Be sure to rename the directory to `workspace`.

### Installing with Git

With a recent version of Git, you can do the first three steps with a single command: `git clone --recursive git://github.com/symphonycms/symphony-2.git designprojectx`. The `--recursive` option will recursively initialize submodules and update them. The last, optional argument is the name of the directory in which the parent repository is cloned into.

1. Clone a copy of Symphony 2.3 and rename the directory:

		git clone git://github.com/symphonycms/symphony-2.git

2. Rename the `symphony-2` directory (if necessary):

		mv symphony-2 designprojectx
		cd designprojectx
		
3. Initialize the submodules for the default extensions:

		git submodule update --init

4. Clone the required extensions:

		cd /path/to/designprojectx/extensions
		git clone git://github.com/nickdunn/order_entries.git
		

5. Clone the Symphony workspace for DesignProjectX and rename it to workspace

		cd ..
		git clone git://github.com/bauhouse/sym-designprojectx.git workspace


6. Set permissions to allow Symphony to write files to the server:

		chmod 777 .
		chmod -R 777 workspace

7. Be sure to have an empty database ready for Symphony (or use a different table prefix). Navigate to the root of the install and provide your preferences, server configuration details and primary user information and click the "Install" button to install Symphony 2 and DesignProjectX.

8. Secure the site by changing permissions for the root and symphony directories.

		chmod 755 .

10. Clap your hands with glee!

### Viewing XSL Source

One of the features of this ensemble, because it is intended as a learning resource for people who are starting to learn about Symphony and XSLT, is the ability to view the XSL, XML and text used to build this site. You'll see this in the Journal section, where each entry display meta data under the entry title with links to XSL, XML and Text. However, as a security precaution, the latest versions of Symphony have forbidden the viewing of XSL files by adding a couple lines to the `.htaccess` file.

		RewriteRule ^workspace/utilities/(.*).xsl$ - [F]
		RewriteRule ^workspace/pages/(.*).xsl$ - [F]

If you want to allow the display of the XSL source code, remove these two lines from the `.htaccess` file.