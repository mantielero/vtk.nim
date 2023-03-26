## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPlaneCollection.h
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
##  @class   vtkPlaneCollection
##  @brief   maintain a list of planes
##
##  vtkPlaneCollection is an object that creates and manipulates
##  lists of objects of type vtkPlane.
##  @sa
##  vtkCollection
##

## !!!Ignored construct:  # vtkPlaneCollection_h [NewLine] # vtkPlaneCollection_h [NewLine] # vtkCollection.h [NewLine] # vtkCommonDataModelModule.h  For export macro [NewLine] # vtkPlane.h  Needed for inline methods [NewLine] class VTKCOMMONDATAMODEL_EXPORT vtkPlaneCollection : public vtkCollection { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCollection Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCollection :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPlaneCollection :: IsTypeOf ( type ) ; } static vtkPlaneCollection * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPlaneCollection * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPlaneCollection * NewInstance ( ) const { return vtkPlaneCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPlaneCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPlaneCollection :: New ( ) ; } public : ; static vtkPlaneCollection * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Add a plane to the list.
##  void AddItem ( vtkPlane * ) ; *
##  Get the next plane in the list.
##  vtkPlane * GetNextItem ( ) ; *
##  Get the ith plane in the list.
##  vtkPlane * GetItem ( int i ) { return static_cast < vtkPlane * > ( this -> GetItemAsObject ( i ) ) ; } *
##  Reentrant safe way to get an object in a collection. Just pass the
##  same cookie back and forth.
##  vtkPlane * GetNextPlane ( vtkCollectionSimpleIterator & cookie ) ; protected : vtkPlaneCollection ( ) = default ; ~ vtkPlaneCollection ( ) override = default ; private :  hide the standard AddItem from the user and the compiler. void AddItem ( vtkObject * o ) { this -> vtkCollection :: AddItem ( o ) ; } private : vtkPlaneCollection ( const vtkPlaneCollection & ) = delete ; void operator = ( const vtkPlaneCollection & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

proc AddItem*(f: ptr vtkPlane) {.importcpp: "VTKCOMMONDATAMODEL_EXPORT::AddItem(@)",
                             header: "vtkPlaneCollection.h".}
proc GetNextItem*(): ptr vtkPlane {.importcpp: "VTKCOMMONDATAMODEL_EXPORT::GetNextItem(@)",
                                header: "vtkPlaneCollection.h".}