## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkArchiver.h
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
##  @class   vtkPythonArchiver
##  @brief   A version of vtkArchiver that can be implemented in Python
##
##  vtkPythonArchiver is an implementation of vtkArchiver that calls a Python
##  object to do the actual work.
##  It defers the following methods to Python:
##  - OpenArchive()
##  - CloseArchive()
##  - InsertIntoArchive()
##  - Contains()
##
##  Python signature of these methods is as follows:
##  - OpenArchive(self, vtkself) : vtkself is the vtk object
##  - CloseArchive(self, vtkself)
##  - InsertIntoArchive(self, vtkself, relativePath, data, size)
##  - Contains()
##
##  @sa
##  vtkPythonArchiver
##

## !!!Ignored construct:  # vtkPythonArchiver_h [NewLine] # vtkPythonArchiver_h [NewLine] # ! defined ( __VTK_WRAP__ ) || defined ( __VTK_WRAP_HIERARCHY__ ) || defined ( __VTK_WRAP_PYTHON__ ) [NewLine] # vtkPython.h  Must be first [NewLine] # vtkArchiver.h [NewLine] # vtkCommonPythonModule.h  For export macro [NewLine] class vtkSmartPyObject ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKCOMMONPYTHON_EXPORT vtkPythonArchiver : public vtkArchiver { public : static vtkPythonArchiver * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkArchiver Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkArchiver :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPythonArchiver :: IsTypeOf ( type ) ; } static vtkPythonArchiver * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPythonArchiver * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPythonArchiver * NewInstance ( ) const { return vtkPythonArchiver :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkArchiver :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPythonArchiver :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPythonArchiver :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Specify the Python object to use to perform the archiving. A reference will
##  be taken on the object.
##  void SetPythonObject ( PyObject * obj ) ; /@{ *
##  Open the archive for writing.
##  void OpenArchive ( ) override ; /@} /@{ *
##  Close the archive.
##  void CloseArchive ( ) override ; /@} /@{ *
##  Insert \p data of size \p size into the archive at \p relativePath.
##  void InsertIntoArchive ( const std :: string & relativePath , const char * data , std :: size_t size ) override ; /@} /@{ *
##  Checks if \p relativePath represents an entry in the archive.
##  bool Contains ( const std :: string & relativePath ) override ; /@} protected : vtkPythonArchiver ( ) ; ~ vtkPythonArchiver ( ) override ; private : vtkPythonArchiver ( const vtkPythonArchiver & ) = delete ; void operator = ( const vtkPythonArchiver & ) = delete ; int CheckResult ( const char * method , const vtkSmartPyObject & res ) ; PyObject * Object ; } ;
## Error: token expected: ; but got: [identifier]!!!
