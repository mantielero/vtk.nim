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
## ========================================================================
##  !!! WARNING for those who want to contribute code to this file.
##  !!! If you use a commercial edition of Qt, you can modify this code.
##  !!! If you use an open source version of Qt, you are free to modify
##  !!! and use this code within the guidelines of the GPL license.
##  !!! Unfortunately, you cannot contribute the changes back into this
##  !!! file.  Doing so creates a conflict between the GPL and BSD-like VTK
##  !!! license.
## =========================================================================
##  .SECTION Description
##  vtkQtConnection is an internal class.

import
  vtkCommand

discard "forward decl of vtkObject"
discard "forward decl of vtkCallbackCommand"
discard "forward decl of vtkEventQtSlotConnect"
type
  vtkQtConnection* {.importcpp: "vtkQtConnection", header: "vtkQtConnection.h",
                    bycopy.} = object of QObject ##  the connection information


## !!!Ignored construct:  Q_OBJECT public :  constructor vtkQtConnection ( vtkEventQtSlotConnect * owner ) ;
## Error: token expected: [integer literal] but got: [comment]!!!

## !!!Ignored construct:  Q_SIGNALS :  the qt signal for moc to take care of void EmitExecute ( vtkObject * , unsigned long , void * client_data , void * call_data , vtkCommand * ) ;
## Error: identifier expected, but got: :!!!

## !!!Ignored construct:  protected Q_SLOTS : void deleteConnection ( ) ;
## Error: token expected: : but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkQtConnection.h
