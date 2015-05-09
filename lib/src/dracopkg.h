/*
#
# Copyright (c) 2014,2015 Ole-André Rodlie <olear@dracolinux.org>. All rights reserved.
#
# DracoPKG is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License version 2.1.
#
*/

#ifndef DRACOPKG_H
#define DRACOPKG_H

#include "DracoPKG_global.h"
#include "pkgsrc.h"
#include "pkgyum.h"
#include "pkgin.h"

class DRACOPKGSHARED_EXPORT DracoPKG
{
public:
    DracoPKG();
    PkgSrc pkgsrc;
    PkgYum pkgyum;
    PkgIn pkgin;
};

#endif // DRACOPKG_H
