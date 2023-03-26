## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    PyVTKExtras.h
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
## -----------------------------------------------------------------------
##   The PyVTKExtras was created in Aug 2015 by David Gobbi.
##
##   This file provides extra classes and functions for the vtk module.
##   Unlike the contents of vtk.util, the classes and functions provided
##   here are ones that must be written in C++ instead of pure python.
## -----------------------------------------------------------------------

## !!!Ignored construct:  # PyVTKExtras_h [NewLine] # PyVTKExtras_h [NewLine] # vtkPython.h [NewLine] # vtkWrappingPythonCoreModule.h  For export macro [NewLine] --------------------------------------------------------------------
##  This will add extras to the provided dict.  It is called during the
##  initialization of the vtkCommonCore python module. extern C { VTKWRAPPINGPYTHONCORE_EXPORT void PyVTKAddFile_PyVTKExtras ( PyObject * dict ) ; } # [NewLine]
## Error: identifier expected, but got: {!!!
