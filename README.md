pdf2xml
=======

Converts PDF to XML.

#### Overview

This is pdf2xml written by Hervé Déjean (Xerox Research Centre Europe) originally available from [http://sourceforge.net/projects/pdf2xml/](http://sourceforge.net/projects/pdf2xml/). This fork builds on Mac OS X.


#### Building

Building pdf2xml is an awful experience. The project doesn't use the GNU autotools and there is no Makefile for Mac OS X. The code depends on [xpdf](http://www.foolabs.com/xpdf/) and [libpng](http://www.libpng.org/pub/png/libpng.html). Unfortunately the existing Unix-style makefiles don't include a core part of xpdf, and the code requires direct access to libpng datastructures, something which has been deprecated in recent versions of libpng. Hence the code won't compile with the version of libpng installed on recent versions of Mac OS X (I'm using 10.6.8).

To compile the software I added libpng-1.2.50 and xpdf-3.02 to the repository, and made a few minor changes to the code (the constant VERSION declared in ConstantsXML.h has been renamed XML_VERSION).

To compile for Mac OS X first build libpng

* cd libpng-1.2.50
* ./configure
* make

(note that the library we need is in the hidden directory ".libs" in libpng-1.2.50)

Then build xpdf. 

* cd xpdf-3.02
* ./configure
* make

Then build pdftoxml itself

* make -f Makefile.macosx


#### Example

The Open Access PDF (2354-G-3-layout.pdf) for the article [doi:10.3897/zookeys.160.2354](http://dx.doi.org/10.3897/zookeys.160.2354) is included in the folder "examples". If you run

./pdftoxml 2354-G-3-layout.pdf you will get an XML file containing the text of the PDF, and the images extracted from the PDF are in the folder 2354-G-3-layout.xml_data. 

<img src="https://raw.github.com/rdmpage/pdf2xml/master/example/2354-G-3-layout.xml_data/image-1.png" alt="image-1.png" style="width: 100px;"/>

