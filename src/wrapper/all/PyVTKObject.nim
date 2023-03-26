## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    PyVTKObject.h
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
##   The PyVTKObject was created in Oct 2000 by David Gobbi for VTK 3.2.
##   It was rewritten in Jul 2015 to wrap VTK classes as python type objects.
## -----------------------------------------------------------------------

## !!!Ignored construct:  # PyVTKObject_h [NewLine] # PyVTKObject_h [NewLine] # vtkPython.h [NewLine] # vtkSystemIncludes.h [NewLine] # vtkWrappingPythonCoreModule.h  For export macro [NewLine] class vtkObjectBase ;
## Error: token expected: ; but got: [identifier]!!!

type
  VTKWRAPPINGPYTHONCORE_EXPORTvtknewfunc* = proc (): ptr vtkObjectBase

##  Flags for special properties or features

const
  VTK_PYTHON_IGNORE_UNREGISTER* = 1

##  This class is used for defining new VTK wrapped classes.
##  It contains information such as the methods and docstring, as well
##  as extra info that can't easily be stored in the PyTypeObject.

## !!!Ignored construct:  class VTKWRAPPINGPYTHONCORE_EXPORT PyVTKClass { public : PyVTKClass ( ) : py_type ( nullptr ) , py_methods ( nullptr ) , vtk_name ( nullptr ) , vtk_new ( nullptr ) { } PyVTKClass ( PyTypeObject * typeobj , PyMethodDef * methods , const char * classname , vtknewfunc constructor ) ; PyTypeObject * py_type ; PyMethodDef * py_methods ; const char * vtk_name ;  the name returned by GetClassName() vtknewfunc vtk_new ;  creates a C++ instance of classtype } ;
## Error: token expected: ; but got: [identifier]!!!

##  This is the VTK/Python 'object,' it contains the python object header
##  plus a pointer to the associated vtkObjectBase and PyVTKClass.

type
  VTKWRAPPINGPYTHONCORE_EXPORTVTKWRAPPINGPYTHONCORE_EXPORTPyVTKObject* {.importcpp: "VTKWRAPPINGPYTHONCORE_EXPORT::VTKWRAPPINGPYTHONCORE_EXPORT::PyVTKObject",
      header: "PyVTKObject.h", bycopy.} = object
    PyObject* {.importc: "PyObject".}: PyObject_HEAD
    vtk_weakreflist* {.importc: "vtk_weakreflist".}: ptr PyObject ##  list of weak references via python
    vtk_class* {.importc: "vtk_class".}: ptr PyVTKClass ##  information about the class
    vtk_ptr* {.importc: "vtk_ptr".}: ptr vtkObjectBase ##  pointer to the C++ object
    vtk_buffer* {.importc: "vtk_buffer".}: ptr Py_ssize_t ##  ndims, shape, strides for Py_buffer
    vtk_observers* {.importc: "vtk_observers".}: ptr culong ##  used to find our observers
    vtk_flags* {.importc: "vtk_flags".}: cuint ##  flags (see list above)


## !!!Ignored construct:  * vtk_dict ;
## Error: identifier expected, but got: *!!!

## !!!Ignored construct:  extern VTKWRAPPINGPYTHONCORE_EXPORT PyGetSetDef PyVTKObject_GetSet [ ] ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  extern VTKWRAPPINGPYTHONCORE_EXPORT PyBufferProcs PyVTKObject_AsBuffer ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  extern C { VTKWRAPPINGPYTHONCORE_EXPORT PyTypeObject * PyVTKClass_Add ( PyTypeObject * pytype , PyMethodDef * methods , const char * classname , vtknewfunc constructor ) ; VTKWRAPPINGPYTHONCORE_EXPORT int PyVTKObject_Check ( PyObject * obj ) ; VTKWRAPPINGPYTHONCORE_EXPORT PyObject * PyVTKObject_FromPointer ( PyTypeObject * vtkclass , PyObject * pydict , vtkObjectBase * ptr ) ; VTKWRAPPINGPYTHONCORE_EXPORT vtkObjectBase * PyVTKObject_GetObject ( PyObject * obj ) ; VTKWRAPPINGPYTHONCORE_EXPORT void PyVTKObject_AddObserver ( PyObject * obj , unsigned long id ) ; VTKWRAPPINGPYTHONCORE_EXPORT void PyVTKObject_SetFlag ( PyObject * obj , unsigned int flag , int val ) ; VTKWRAPPINGPYTHONCORE_EXPORT unsigned int PyVTKObject_GetFlags ( PyObject * obj ) ; VTKWRAPPINGPYTHONCORE_EXPORT PyObject * PyVTKObject_Repr ( PyObject * op ) ; VTKWRAPPINGPYTHONCORE_EXPORT PyObject * PyVTKObject_String ( PyObject * op ) ; VTKWRAPPINGPYTHONCORE_EXPORT int PyVTKObject_Traverse ( PyObject * o , visitproc visit , void * arg ) ; VTKWRAPPINGPYTHONCORE_EXPORT PyObject * PyVTKObject_New ( PyTypeObject * , PyObject * args , PyObject * kwds ) ; VTKWRAPPINGPYTHONCORE_EXPORT void PyVTKObject_Delete ( PyObject * op ) ; } # [NewLine]
## Error: identifier expected, but got: {!!!
