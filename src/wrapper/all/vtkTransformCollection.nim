## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkTransformCollection.h
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
##  @class   vtkTransformCollection
##  @brief   maintain a list of transforms
##
##
##  vtkTransformCollection is an object that creates and manipulates lists of
##  objects of type vtkTransform.
##
##  @sa
##  vtkCollection vtkTransform
##

## !!!Ignored construct:  # vtkTransformCollection_h [NewLine] # vtkTransformCollection_h [NewLine] # vtkCollection.h [NewLine] # vtkCommonTransformsModule.h  For export macro [NewLine] # vtkTransform.h  Needed for inline methods [NewLine] class VTKCOMMONTRANSFORMS_EXPORT vtkTransformCollection : public vtkCollection { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCollection Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCollection :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkTransformCollection :: IsTypeOf ( type ) ; } static vtkTransformCollection * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkTransformCollection * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkTransformCollection * NewInstance ( ) const { return vtkTransformCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkTransformCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkTransformCollection :: New ( ) ; } public : ; static vtkTransformCollection * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Add a Transform to the list.
##  void AddItem ( vtkTransform * ) ; *
##  Get the next Transform in the list. Return nullptr when the end of the
##  list is reached.
##  vtkTransform * GetNextItem ( ) ; *
##  Reentrant safe way to get an object in a collection. Just pass the
##  same cookie back and forth.
##  vtkTransform * GetNextTransform ( vtkCollectionSimpleIterator & cookie ) { return static_cast < vtkTransform * > ( this -> GetNextItemAsObject ( cookie ) ) ; } protected : vtkTransformCollection ( ) = default ; ~ vtkTransformCollection ( ) override = default ; private :  hide the standard AddItem from the user and the compiler. void AddItem ( vtkObject * o ) { this -> vtkCollection :: AddItem ( o ) ; } private : vtkTransformCollection ( const vtkTransformCollection & ) = delete ; void operator = ( const vtkTransformCollection & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## ----------------------------------------------------------------------------

proc AddItem*(t: ptr vtkTransform) {.importcpp: "VTKCOMMONTRANSFORMS_EXPORT::AddItem(@)",
                                 header: "vtkTransformCollection.h".}
## ----------------------------------------------------------------------------

proc GetNextItem*(): ptr vtkTransform {.importcpp: "VTKCOMMONTRANSFORMS_EXPORT::GetNextItem(@)",
                                    header: "vtkTransformCollection.h".}