#------------------------------------------------------
# Makefile
# Charishma Thota
# cthota
#------------------------------------------------------
JAVASRC	 = DeadBeef.java 
SOURCES	= README.txt Makefile $(JAVASRC)
MAINCLASS	= DeadBeef
CLASSES	= DeadBeef.class
JARFILE	= DeadBeef.jar

all: $(JARFILE)

$(JARFILE): $(CLASSES)
	echo Main-class: $(MAINCLASS) > Manifest
	jar cvfm $(JARFILE) Manifest $(CLASSES)
	rm Manifest

$(CLASSES): $(JAVASRC)
	javac -Xlint $(JAVASRC)

clean:
	rm $(CLASSES) $(JARFILE)
