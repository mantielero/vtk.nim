## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPythonCompatibility.h
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
##   This header contains macros to make Python 2 and Python 3 play nice.
##   It must be included after vtkPython.h.
## -----------------------------------------------------------------------

## !!!Ignored construct:  # vtkPythonCompatibility_h [NewLine] # vtkPythonCompatibility_h [NewLine]  define our main check macro VTK_PY3K # PY_MAJOR_VERSION >= 3 [NewLine] # [NewLine] # [NewLine]  ===== Macros needed for Python 3 ==== # [NewLine]  Int/Long compatibility # PyIntObject PyLongObject [NewLine] # PyInt_Type PyLong_Type [NewLine] # PyInt_Check PyLong_Check [NewLine] # PyInt_FromLong PyLong_FromLong [NewLine] # PyInt_AsLong PyLong_AsLong [NewLine]  Unicode/String compatibility # PyString_AsString PyUnicode_AsUTF8 [NewLine] # PyString_InternFromString PyUnicode_InternFromString [NewLine] # PyString_FromFormat PyUnicode_FromFormat [NewLine] # PyString_Check PyUnicode_Check [NewLine] # PyString_FromString PyUnicode_FromString [NewLine] # PyString_FromStringAndSize PyUnicode_FromStringAndSize [NewLine]  Use this for PyUnicode_EncodeLocale, see PEP 383 # VTK_PYUNICODE_ENC surrogateescape [NewLine]  Buffer initialization # VTK_PYBUFFER_INITIALIZER { 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 } [NewLine]  PyTypeObject compatibility # PY_VERSION_HEX >= 0x03090000 [NewLine] # VTK_WRAP_PYTHON_SUPPRESS_UNINITIALIZED 0 , 0 , 0 , 0 , [NewLine] # PY_VERSION_HEX >= 0x03080000 [NewLine] # VTK_WRAP_PYTHON_SUPPRESS_UNINITIALIZED 0 , 0 , 0 , 0 , 0 , [NewLine] # [NewLine] # VTK_WRAP_PYTHON_SUPPRESS_UNINITIALIZED 0 , 0 , 0 , [NewLine] # [NewLine]  Python 3.8 contains a deprecation marker on the `tp_print` field. Since some
##  compilers are very touchy about this situation, just suppress the warning. # PY_VERSION_HEX < 0x03090000 [NewLine]  GCC-alike (but not Intel) need this. # defined ( __GNUC__ ) && ! defined ( __INTEL_COMPILER ) [NewLine] # VTK_PYTHON_NEEDS_DEPRECATION_WARNING_SUPPRESSION [NewLine] # [NewLine] # [NewLine] # [NewLine]  ===== Macros needed for Python 2 ==== # [NewLine]  Py3k introduced a new type "Py_hash_t" typedef long Py_hash_t ;
## Error: did not expect [NewLine]!!!

type
  Py_uhash_t* = culong

##  Buffer struct initialization

const
  VTK_PYBUFFER_INITIALIZER* = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, [0, 0], 0)

##  PyTypeObject initialization

## !!!Ignored construct:  # VTK_WRAP_PYTHON_SUPPRESS_UNINITIALIZED 0 , 0 , [NewLine] # [NewLine] # [NewLine]  VTK-HeaderTest-Exclude: vtkPythonCompatibility.h
## Error: did not expect [NewLine]!!!
