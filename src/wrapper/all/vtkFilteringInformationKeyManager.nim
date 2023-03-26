## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFilteringInformationKeyManager.h
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
##  @class   vtkFilteringInformationKeyManager
##  @brief   Manages key types in vtkFiltering.
##
##  vtkFilteringInformationKeyManager is included in the header of any
##  subclass of vtkInformationKey defined in the vtkFiltering library.
##  It makes sure that the table of keys is created before and
##  destroyed after it is used.
##

## !!!Ignored construct:  # vtkFilteringInformationKeyManager_h [NewLine] # vtkFilteringInformationKeyManager_h [NewLine] # vtkCommonExecutionModelModule.h  For export macro # vtkSystemIncludes.h [NewLine] # vtkDebugLeaksManager.h  DebugLeaks exists longer than info keys. [NewLine] class vtkInformationKey ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONEXECUTIONMODEL_EXPORT vtkFilteringInformationKeyManager { public : vtkFilteringInformationKeyManager ( ) ; ~ vtkFilteringInformationKeyManager ( ) ; *
##  Called by constructors of vtkInformationKey subclasses defined in
##  vtkFiltering to register themselves with the manager.  The
##  instances will be deleted when vtkFiltering is unloaded on
##  program exit.
##  static void Register ( vtkInformationKey * key ) ; private :  Unimplemented vtkFilteringInformationKeyManager ( const vtkFilteringInformationKeyManager & ) = delete ; vtkFilteringInformationKeyManager & operator = ( const vtkFilteringInformationKeyManager & ) = delete ; static void ClassInitialize ( ) ; static void ClassFinalize ( ) ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  This instance will show up in any translation unit that uses key
##  types defined in vtkFiltering or that has a singleton.  It will
##  make sure vtkFilteringInformationKeyManager's vector of keys is
##  initialized before and destroyed after it is used.

var vtkFilteringInformationKeyManagerInstance* {.
    importcpp: "vtkFilteringInformationKeyManagerInstance",
    header: "vtkFilteringInformationKeyManager.h".}: vtkFilteringInformationKeyManager

##  VTK-HeaderTest-Exclude: vtkFilteringInformationKeyManager.h
