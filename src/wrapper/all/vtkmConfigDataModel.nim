## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    ObjectFactory.cxx
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

## !!!Ignored construct:  # vtkConfigDataModel_h [NewLine] # vtkConfigDataModel_h [NewLine] --------------------------------------------------------------------------  Other Configuration Options # < vtkm / internal / Configure . h > [NewLine] # vtkAcceleratorsVTKmDataModelModule.h required for correct implementation [NewLine] --------------------------------------------------------------------------  Make sure we use the same id's in VTK and VTK-m # vtkType.h [NewLine] # VTK_USE_64BIT_IDS [NewLine] # VTKM_USE_64BIT_IDS [NewLine] # VTK was defined with 64 - bit ids but VTK - m with 32 - bit ids . [NewLine] # [NewLine] #  !VTK_USE_64BIT_IDS # VTKM_USE_64BIT_IDS [NewLine] # VTK was defined with 32 - bit ids but VTK - m with 64 - bit ids . [NewLine] # [NewLine] # [NewLine] # [NewLine] # ! defined ( VTKACCELERATORSVTKMDATAMODEL_STATIC_DEFINE ) && defined ( _MSC_VER ) [NewLine]  Warning C4910 on windows state that extern explicit template can't be
##      labeled with __declspec(dllexport). So that is why we use a new custom
##      define. But when other modules ( e.g. rendering ) include this header
##      we need them to see that the extern template is actually being imported.
##   We are building this library with MSVC # [NewLine] # [NewLine]  Defer to the config module # [NewLine] # [NewLine] # [NewLine] #  vtkConfigDataModel_h
## Error: identifier expected, but got: [NewLine]!!!
