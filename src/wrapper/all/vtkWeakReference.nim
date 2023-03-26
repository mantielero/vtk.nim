## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkWeakReference.h
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
##  @class   vtkWeakReference
##  @brief   Utility class to hold a weak reference to a vtkObject.
##
##  Simple Set(...)/Get(...) interface. Used in numpy support to provide a
##  reference to a vtkObject without preventing it from being collected.
##

## !!!Ignored construct:  # vtkWeakReference_h [NewLine] # vtkWeakReference_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkObject.h [NewLine] # vtkWeakPointer.h [NewLine] class VTKCOMMONCORE_EXPORT vtkWeakReference : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkWeakReference :: IsTypeOf ( type ) ; } static vtkWeakReference * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkWeakReference * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkWeakReference * NewInstance ( ) const { return vtkWeakReference :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkWeakReference :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkWeakReference :: New ( ) ; } public : ; static vtkWeakReference * New ( ) ; vtkWeakReference ( ) ; ~ vtkWeakReference ( ) override ; *
##  Set the vtkObject to maintain a weak reference to.
##  void Set ( vtkObject * object ) ; *
##  Get the vtkObject pointer or nullptr if the object has been collected.
##  vtkObject * Get ( ) ; private : vtkWeakPointer < vtkObject > Object ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkWeakReference.h
