## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPythonStdStreamCaptureHelper.h
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
##  @class   vtkPythonStdStreamCaptureHelper
##
##

## !!!Ignored construct:  # vtkPythonStdStreamCaptureHelper_h [NewLine] # vtkPythonStdStreamCaptureHelper_h [NewLine] # structmember.h [NewLine] # vtkPythonCompatibility.h [NewLine] # vtkPythonInterpreter.h [NewLine] struct vtkPythonStdStreamCaptureHelper { PyObject_HEAD int softspace ;  Used by print to keep track of its state. bool DumpToError ; void Write ( const char * string ) { if ( this -> DumpToError ) { vtkPythonInterpreter :: WriteStdErr ( string ) ; } else { vtkPythonInterpreter :: WriteStdOut ( string ) ; } } void Flush ( ) { if ( this -> DumpToError ) { vtkPythonInterpreter :: FlushStdErr ( ) ; } else { vtkPythonInterpreter :: FlushStdOut ( ) ; } } vtkStdString Read ( ) { return vtkPythonInterpreter :: ReadStdin ( ) ; } bool IsATTY ( ) { if ( vtkPythonInterpreter :: GetCaptureStdin ( ) ) { return false ; } return isatty ( fileno ( stdin ) ) ;  when not captured, uses cin } void Close ( ) { this -> Flush ( ) ; } } ;
## Error: did not expect #!!!

proc vtkWrite*(self: ptr PyObject; args: ptr PyObject): ptr PyObject {.
    importcpp: "vtkWrite(@)", header: "vtkPythonStdStreamCaptureHelper.h".}
proc vtkRead*(self: ptr PyObject; args: ptr PyObject): ptr PyObject {.
    importcpp: "vtkRead(@)", header: "vtkPythonStdStreamCaptureHelper.h".}
proc vtkFlush*(self: ptr PyObject; args: ptr PyObject): ptr PyObject {.
    importcpp: "vtkFlush(@)", header: "vtkPythonStdStreamCaptureHelper.h".}
proc vtkIsatty*(self: ptr PyObject; args: ptr PyObject): ptr PyObject {.
    importcpp: "vtkIsatty(@)", header: "vtkPythonStdStreamCaptureHelper.h".}
proc vtkClose*(self: ptr PyObject; args: ptr PyObject): ptr PyObject {.
    importcpp: "vtkClose(@)", header: "vtkPythonStdStreamCaptureHelper.h".}
##  const_cast since older versions of python are not const correct.

var vtkPythonStdStreamCaptureHelperMethods* {.
    importcpp: "vtkPythonStdStreamCaptureHelperMethods",
    header: "vtkPythonStdStreamCaptureHelper.h".}: UncheckedArray[PyMethodDef]

proc vtkPythonStdStreamCaptureHelperNew*(`type`: ptr PyTypeObject; a2: ptr PyObject; ## args
                                        a3: ptr PyObject): ptr PyObject =
  ## kwds
  discard

var vtkPythonStdStreamCaptureHelperMembers* {.
    importcpp: "vtkPythonStdStreamCaptureHelperMembers",
    header: "vtkPythonStdStreamCaptureHelper.h".}: UncheckedArray[PyMemberDef]

when defined(VTK_PYTHON_NEEDS_DEPRECATION_WARNING_SUPPRESSION):
  discard
##  clang-format off

## !!!Ignored construct:  static PyTypeObject vtkPythonStdStreamCaptureHelperType = { PyVarObject_HEAD_INIT ( & PyType_Type , 0 ) vtkPythonStdStreamCaptureHelper ,  tp_name sizeof ( vtkPythonStdStreamCaptureHelper ) ,  tp_basicsize 0 ,  tp_itemsize 0 ,  tp_dealloc # PY_VERSION_HEX >= 0x03080000 [NewLine] 0 ,  tp_vectorcall_offset # [NewLine] nullptr ,  tp_print # [NewLine] 0 ,  tp_getattr 0 ,  tp_setattr 0 ,  tp_compare 0 ,  tp_repr 0 ,  tp_as_number 0 ,  tp_as_sequence 0 ,  tp_as_mapping 0 ,  tp_hash 0 ,  tp_call 0 ,  tp_str PyObject_GenericGetAttr ,  tp_getattro PyObject_GenericSetAttr ,  tp_setattro 0 ,  tp_as_buffer Py_TPFLAGS_DEFAULT | Py_TPFLAGS_BASETYPE ,  tp_flags vtkPythonStdStreamCaptureHelper ,   tp_doc 0 ,   tp_traverse 0 ,   tp_clear 0 ,   tp_richcompare 0 ,   tp_weaklistoffset 0 ,   tp_iter 0 ,   tp_iternext vtkPythonStdStreamCaptureHelperMethods ,   tp_methods vtkPythonStdStreamCaptureHelperMembers ,   tp_members 0 ,   tp_getset 0 ,   tp_base 0 ,   tp_dict 0 ,   tp_descr_get 0 ,   tp_descr_set 0 ,   tp_dictoffset 0 ,   tp_init 0 ,   tp_alloc vtkPythonStdStreamCaptureHelperNew ,   tp_new 0 ,  freefunc tp_free; /* Low-level free-memory routine */ 0 ,  inquiry tp_is_gc; /* For PyObject_IS_GC */ 0 ,  PyObject *tp_bases; 0 ,  PyObject *tp_mro; /* method resolution order */ 0 ,  PyObject *tp_cache; 0 ,  PyObject *tp_subclasses; 0 ,  PyObject *tp_weaklist; VTK_WRAP_PYTHON_SUPPRESS_UNINITIALIZED } ;
## Error: did not expect #!!!

##  clang-format on

proc vtkWrite*(self: ptr PyObject; args: ptr PyObject): ptr PyObject =
  discard

proc vtkRead*(self: ptr PyObject; args: ptr PyObject): ptr PyObject =
  discard

proc vtkFlush*(self: ptr PyObject; args: ptr PyObject): ptr PyObject =
  discard

proc vtkIsatty*(self: ptr PyObject; args: ptr PyObject): ptr PyObject =
  discard

proc vtkClose*(self: ptr PyObject; args: ptr PyObject): ptr PyObject =
  discard

proc NewPythonStdStreamCaptureHelper*(for_stderr: bool = false): ptr vtkPythonStdStreamCaptureHelper =
  discard

##  VTK-HeaderTest-Exclude: vtkPythonStdStreamCaptureHelper.h
