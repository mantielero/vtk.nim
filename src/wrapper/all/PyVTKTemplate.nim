## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    PyVTKTemplate.h
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
##   The PyVTKTemplate was created in May 2011 by David Gobbi.
##
##   This object is a container for instantiations of templated types.
##   Essentially, it is a "dict" that accepts template args as keys,
##   and provides the corresponding python type.
## -----------------------------------------------------------------------

## !!!Ignored construct:  # PyVTKTemplate_h [NewLine] # PyVTKTemplate_h [NewLine] # vtkPython.h [NewLine] # vtkSystemIncludes.h [NewLine] # vtkWrappingPythonCoreModule.h  For export macro [NewLine] extern PyTypeObject PyVTKTemplate_Type ;
## Error: identifier expected, but got: {!!!

template PyVTKTemplate_Check*(obj: untyped): untyped =
  (Py_TYPE(obj) == addr(PyVTKTemplate_Type))

## !!!Ignored construct:  extern C { PyObject * PyVTKTemplate_New ( const char * name , const char * docstring ) ; int PyVTKTemplate_AddItem ( PyObject * self , PyObject * val ) ; } # [NewLine]
## Error: identifier expected, but got: {!!!
