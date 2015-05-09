/*
#
# Copyright (c) 2014,2015 Ole-André Rodlie <olear@dracolinux.org>. All rights reserved.
#
# DracoPKG is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License version 2.1.
#
*/

#ifndef PKGIN_H
#define PKGIN_H

#include <QObject>
#include <QFile>
#include <QProcess>

class PkgIn : public QObject
{
    Q_OBJECT
public:
    explicit PkgIn(QObject *parent = 0);
    
signals:
    
public slots:
    
};

#endif // PKGIN_H
