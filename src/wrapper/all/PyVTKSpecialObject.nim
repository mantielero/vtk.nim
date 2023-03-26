## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    PyVTKSpecialObject.h
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
##   The PyVTKSpecialObject was created in Feb 2001 by David Gobbi.
##   The PyVTKSpecialType class was created in April 2010 by David Gobbi.
## -----------------------------------------------------------------------

## !!!Ignored construct:  # PyVTKSpecialObject_h [NewLine] # PyVTKSpecialObject_h [NewLine] # vtkPython.h [NewLine] # vtkSystemIncludes.h [NewLine] # vtkWrappingPythonCoreModule.h  For export macro [NewLine]  This for objects not derived from vtkObjectBase  Prototypes for per-type copy, delete, and print funcs  copy the object and return the copy typedef void * ( * vtkcopyfunc ) ( const void * ) ;
## Error: token expected: ; but got: [identifier]!!!

##  Because the PyTypeObject can't hold all the typing information that we
##  need, we use this PyVTKSpecialType class to hold a bit of extra info.

## !!!Ignored construct:  class VTKWRAPPINGPYTHONCORE_EXPORT PyVTKSpecialType { public : PyVTKSpecialType ( ) : py_type ( nullptr ) , vtk_methods ( nullptr ) , vtk_constructors ( nullptr ) , vtk_copy ( nullptr ) { } PyVTKSpecialType ( PyTypeObject * typeobj , PyMethodDef * cmethods , PyMethodDef * ccons , vtkcopyfunc copyfunc ) ;  general information PyTypeObject * py_type ; PyMethodDef * vtk_methods ; PyMethodDef * vtk_constructors ;  copy an object vtkcopyfunc vtk_copy ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  The PyVTKSpecialObject is very lightweight.  All special VTK types
##  that are wrapped in VTK use this struct, they do not define their
##  own structs.

type
  VTKWRAPPINGPYTHONCORE_EXPORTVTKWRAPPINGPYTHONCORE_EXPORTPyVTKSpecialObject* {.importcpp: "VTKWRAPPINGPYTHONCORE_EXPORT::VTKWRAPPINGPYTHONCORE_EXPORT::PyVTKSpecialObject",
      header: "PyVTKSpecialObject.h", bycopy.} = object
    PyVTKSpecialType* {.importc: "PyVTKSpecialType".}: PyObject_HEAD
    vtk_ptr* {.importc: "vtk_ptr".}: pointer
    vtk_hash* {.importc: "vtk_hash".}: clong


## !!!Ignored construct:  * vtk_info ;
## Error: identifier expected, but got: *!!!

## !!!Ignored construct:  extern C { VTKWRAPPINGPYTHONCORE_EXPORT PyTypeObject * PyVTKSpecialType_Add ( PyTypeObject * pytype , PyMethodDef * methods , PyMethodDef * constructors , vtkcopyfunc copyfunc ) ; VTKWRAPPINGPYTHONCORE_EXPORT PyObject * PyVTKSpecialObject_New ( const char * classname , void * ptr ) ; VTKWRAPPINGPYTHONCORE_EXPORT PyObject * PyVTKSpecialObject_CopyNew ( const char * classname , const void * ptr ) ; VTKWRAPPINGPYTHONCORE_EXPORT PyObject * PyVTKSpecialObject_Repr ( PyObject * self ) ; VTKWRAPPINGPYTHONCORE_EXPORT PyObject * PyVTKSpecialObject_SequenceString ( PyObject * self ) ; } # [NewLine]
## Error: identifier expected, but got: {!!!
