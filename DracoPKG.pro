TEMPLATE                             = subdirs
SUBDIRS                              = lib daemon
CONFIG                              += ordered
QMAKE_CLEAN                         += Makefile
include(DracoPKG.pri)
