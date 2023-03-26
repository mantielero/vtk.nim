## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGarbageCollectorManager.h
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
## *
##  @class   vtkGarbageCollectorManager
##  @brief   Manages the vtkGarbageCollector singleton.
##
##  vtkGarbageCollectorManager should be included in any translation unit
##  that will use vtkGarbageCollector or that implements the singleton
##  pattern.  It makes sure that the vtkGarbageCollector singleton is created
##  before and destroyed after it is used.
##

## !!!Ignored construct:  # vtkGarbageCollectorManager_h [NewLine] # vtkGarbageCollectorManager_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkSystemIncludes.h [NewLine] # vtkDebugLeaksManager.h  DebugLeaks is around longer than
##  the garbage collector. [NewLine] class VTKCOMMONCORE_EXPORT vtkGarbageCollectorManager { public : vtkGarbageCollectorManager ( ) ; ~ vtkGarbageCollectorManager ( ) ; private : vtkGarbageCollectorManager ( const vtkGarbageCollectorManager & ) = delete ; vtkGarbageCollectorManager & operator = ( const vtkGarbageCollectorManager & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  This instance will show up in any translation unit that uses
##  vtkGarbageCollector or that has a singleton.  It will make sure
##  vtkGarbageCollector is initialized before it is used finalized when
##  it is done being used.

var vtkGarbageCollectorManagerInstance* {.importcpp: "vtkGarbageCollectorManagerInstance",
                                        header: "vtkGarbageCollectorManager.h".}: vtkGarbageCollectorManager

##  VTK-HeaderTest-Exclude: vtkGarbageCollectorManager.h
