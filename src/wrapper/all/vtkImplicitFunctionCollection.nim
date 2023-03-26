## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImplicitFunctionCollection.h
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
##  @class   vtkImplicitFunctionCollection
##  @brief   maintain a list of implicit functions
##
##  vtkImplicitFunctionCollection is an object that creates and manipulates
##  lists of objects of type vtkImplicitFunction.
##  @sa
##  vtkCollection vtkPlaneCollection
##

## !!!Ignored construct:  # vtkImplicitFunctionCollection_h [NewLine] # vtkImplicitFunctionCollection_h [NewLine] # vtkCollection.h [NewLine] # vtkCommonDataModelModule.h  For export macro [NewLine] # vtkImplicitFunction.h  Needed for inline methods [NewLine] class VTKCOMMONDATAMODEL_EXPORT vtkImplicitFunctionCollection : public vtkCollection { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCollection Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCollection :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImplicitFunctionCollection :: IsTypeOf ( type ) ; } static vtkImplicitFunctionCollection * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImplicitFunctionCollection * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImplicitFunctionCollection * NewInstance ( ) const { return vtkImplicitFunctionCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImplicitFunctionCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImplicitFunctionCollection :: New ( ) ; } public : ; static vtkImplicitFunctionCollection * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Add an implicit function to the list.
##  void AddItem ( vtkImplicitFunction * ) ; *
##  Get the next implicit function in the list.
##  vtkImplicitFunction * GetNextItem ( ) ; /@{ *
##  Reentrant safe way to get an object in a collection. Just pass the
##  same cookie back and forth.
##  vtkImplicitFunction * GetNextImplicitFunction ( vtkCollectionSimpleIterator & cookie ) { return static_cast < vtkImplicitFunction * > ( this -> GetNextItemAsObject ( cookie ) ) ; } /@} protected : vtkImplicitFunctionCollection ( ) = default ; ~ vtkImplicitFunctionCollection ( ) override = default ; private :  hide the standard AddItem from the user and the compiler. void AddItem ( vtkObject * o ) { this -> vtkCollection :: AddItem ( o ) ; } private : vtkImplicitFunctionCollection ( const vtkImplicitFunctionCollection & ) = delete ; void operator = ( const vtkImplicitFunctionCollection & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

proc AddItem*(f: ptr vtkImplicitFunction) {.importcpp: "VTKCOMMONDATAMODEL_EXPORT::AddItem(@)", header: "vtkImplicitFunctionCollection.h".}
proc GetNextItem*(): ptr vtkImplicitFunction {.
    importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetNextItem(@)",
    header: "vtkImplicitFunctionCollection.h".}