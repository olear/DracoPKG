#
# Copyright (c) 2014,2015 Ole-André Rodlie <olear@dracolinux.org>. All rights reserved.
#
# DracoPKG is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License version 2.1.
#

TARGET                               = DracoPKG
QT                                  += core dbus network xml
QT                                  -= gui
CONFIG                              += console
CONFIG                              -= app_bundle
TEMPLATE                             = app
SOURCES                             += src/$${TARGET}.cpp
DESTDIR                              = build
OBJECTS_DIR                          = $${DESTDIR}/.obj

include(../DracoPKG.pri)

target.path                          = $${PREFIX}/sbin
target_dbus_conf.path                = $${DBUS_CONF}/dbus-1/system.d
target_dbus_service.path             = $${DBUS_SERVICE}/dbus-1/system-services
target_dbus_conf.commands            = $$quote(cat res/org.dracolinux.conf | sed "\"s/_SERVICE_/$${TARGET}/g;s/_GROUP_/$${ADMIN_GROUP}/"\" > ${INSTALL_ROOT}$${DBUS_CONF}/dbus-1/system.d/org.dracolinux.$${TARGET}.conf$$escape_expand(\\n\\t))
target_dbus_service.commands         = $$quote(echo "\"[D-BUS Service]"\" > ${INSTALL_ROOT}$${DBUS_SERVICE}/dbus-1/system-services/org.dracolinux.$${TARGET}.service$$escape_expand(\\n\\t))
target_dbus_service.commands        += $$quote(echo "\"Name=org.dracolinux.$${TARGET}"\" >> ${INSTALL_ROOT}$${DBUS_SERVICE}/dbus-1/system-services/org.dracolinux.$${TARGET}.service$$escape_expand(\\n\\t))
target_dbus_service.commands        += $$quote(echo "\"Exec=$${PREFIX}/sbin/$${TARGET}"\" >> ${INSTALL_ROOT}$${DBUS_SERVICE}/dbus-1/system-services/org.dracolinux.$${TARGET}.service$$escape_expand(\\n\\t))
target_dbus_service.commands        += $$quote(echo "\"User=root"\" >> ${INSTALL_ROOT}$${DBUS_SERVICE}/dbus-1/system-services/org.dracolinux.$${TARGET}.service$$escape_expand(\\n\\t))

target_docs.path                     = $$DOCDIR/$${TARGET}-$${VERSION}
target_docs.files                    = ../COPYING ../README.md

INSTALLS                            += target target_dbus_conf target_dbus_service target_docs
QMAKE_CLEAN                         += -r $${DESTDIR} Makefile
QMAKE_POST_LINK                     += $$quote(strip -s $${DESTDIR}/$${TARGET}$$escape_expand(\\n\\t))

INCLUDEPATH                         += "../lib/src"
LIBS                                += -L"$${LIBDIR}"
LIBS                                += -L"../lib/build"
LIBS                                += "-l$${TARGET}"
OTHER_FILES                         += res/org.dracolinux.conf
