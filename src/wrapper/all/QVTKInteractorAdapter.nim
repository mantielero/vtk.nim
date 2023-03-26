## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    QVTKInteractorAdapter.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## =========================================================================
##
##   Copyright 2004 Sandia Corporation.
##   Under the terms of Contract DE-AC04-94AL85000, there is a non-exclusive
##   license for use of this work by or on behalf of the
##   U.S. Government. Redistribution and use in source and binary forms, with
##   or without modification, are permitted provided that this Notice and any
##   statement of authorship are reproduced on all copies.
##
## =========================================================================
## ========================================================================
##  For general information about using VTK and Qt, see:
##  http://www.trolltech.com/products/3rdparty/vtksupport.html
## =========================================================================
##  .NAME QVTKInteractorAdapter - Handle Qt events.
##  .SECTION Description
##  QVTKInteractor handles relaying Qt events to VTK.

import
  QVTKWin32Header, vtkGUISupportQtModule

discard "forward decl of vtkRenderWindowInteractor"
discard "forward decl of QEvent"
type
  QVTKInteractorAdapter* {.importcpp: "QVTKInteractorAdapter",
                          header: "QVTKInteractorAdapter.h", bycopy.} = object of QObject


## !!!Ignored construct:  Q_OBJECT public :  Description:
##  Constructor: takes QObject parent QVTKInteractorAdapter ( QObject * parent = nullptr ) ;
## Error: token expected: [integer literal] but got: [comment]!!!
