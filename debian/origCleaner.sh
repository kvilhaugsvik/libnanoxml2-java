#!/bin/bash
# usage: origCleaner.sh ignord version deleteMe [tempfolder]

# libnanoxml2-java_${2}.orig is not dsfg cleaned
rm ${3} || echo No libnanoxml2-java_${2}.orig. Good...

# TMPDIR is defined if called from get-orig-source and undefined if called from
# uscan
if [ -n "${4+x}" ] ; \
	then TMPDIR=${4}; \
	else TMPDIR=debian/orig.tmp; \
fi
mkdir ${TMPDIR} || exit 1

# link uscan downloaded NanoXML, download it if not
if [ -f ../NanoXML-${2}.tar.gz ] ; \
	then ln ../NanoXML-${2}.tar.gz ${TMPDIR} || exit 1;
	else (cd ${TMPDIR} && \
	wget http://nanoxml.cyberelf.be/downloads/NanoXML-${2}.tar.gz)  || \
	exit 1; \
fi

(cd ${TMPDIR} &&
tar -xzf NanoXML-${2}.tar.gz && \
find NanoXML-${2} -iname *.jar -delete && \
find NanoXML-${2} -iname *.pdf -delete && \
rm -rf `find NanoXML-${2} -name HTML` && \
mv NanoXML-${2} libnanoxml2-java-${2}.dfsg && \
tar -czf libnanoxml2-java_${2}.dfsg.orig.tar.gz libnanoxml2-java-${2}.dfsg) || \
exit 1

if [ -n "${4+x}" ] ; \
	then mv ${TMPDIR}/libnanoxml2-java_${2}.dfsg.orig.tar.gz . || exit 1; \
	else mv ${TMPDIR}/libnanoxml2-java_${2}.dfsg.orig.tar.gz .. || exit 1; \
fi

rm -rf ${TMPDIR}
