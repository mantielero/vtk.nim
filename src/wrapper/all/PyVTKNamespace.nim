## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    PyVTKNamespace.h
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
##   The PyVTKNamespace was created in Nov 2014 by David Gobbi.
##
##   This is a PyModule subclass for wrapping C++ namespaces.
## -----------------------------------------------------------------------

## !!!Ignored construct:  # PyVTKNamespace_h [NewLine] # PyVTKNamespace_h [NewLine] # vtkPython.h [NewLine] # vtkSystemIncludes.h [NewLine] # vtkWrappingPythonCoreModule.h  For export macro [NewLine] extern VTKWRAPPINGPYTHONCORE_EXPORT PyTypeObject PyVTKNamespace_Type ;
## Error: token expected: ; but got: [identifier]!!!

template PyVTKNamespace_Check*(obj: untyped): untyped =
  (Py_TYPE(obj) == addr(PyVTKNamespace_Type))

## !!!Ignored construct:  extern C { VTKWRAPPINGPYTHONCORE_EXPORT PyObject * PyVTKNamespace_New ( const char * name ) ; VTKWRAPPINGPYTHONCORE_EXPORT PyObject * PyVTKNamespace_GetDict ( PyObject * self ) ; VTKWRAPPINGPYTHONCORE_EXPORT const char * PyVTKNamespace_GetName ( PyObject * self ) ; } # [NewLine]
## Error: identifier expected, but got: {!!!
