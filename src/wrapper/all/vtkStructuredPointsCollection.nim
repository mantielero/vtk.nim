## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkStructuredPointsCollection.h
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
##  @class   vtkStructuredPointsCollection
##  @brief   maintain a list of structured points data objects
##
##  vtkStructuredPointsCollection is an object that creates and manipulates
##  ordered lists of structured points datasets. See also vtkCollection and
##  subclasses.
##

## !!!Ignored construct:  # vtkStructuredPointsCollection_h [NewLine] # vtkStructuredPointsCollection_h [NewLine] # vtkCollection.h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkStructuredPoints.h  Needed for static cast [NewLine] class VTKCOMMONDATAMODEL_EXPORT vtkStructuredPointsCollection : public vtkCollection { public : static vtkStructuredPointsCollection * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCollection Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCollection :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkStructuredPointsCollection :: IsTypeOf ( type ) ; } static vtkStructuredPointsCollection * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkStructuredPointsCollection * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkStructuredPointsCollection * NewInstance ( ) const { return vtkStructuredPointsCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkStructuredPointsCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkStructuredPointsCollection :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Add a pointer to a vtkStructuredPoints to the bottom of the list.
##  void AddItem ( vtkStructuredPoints * ds ) { this -> vtkCollection :: AddItem ( ds ) ; } *
##  Get the next item in the collection. nullptr is returned if the collection
##  is exhausted.
##  vtkStructuredPoints * GetNextItem ( ) { return static_cast < vtkStructuredPoints * > ( this -> GetNextItemAsObject ( ) ) ; } *
##  Reentrant safe way to get an object in a collection. Just pass the
##  same cookie back and forth.
##  vtkStructuredPoints * GetNextStructuredPoints ( vtkCollectionSimpleIterator & cookie ) { return static_cast < vtkStructuredPoints * > ( this -> GetNextItemAsObject ( cookie ) ) ; } protected : vtkStructuredPointsCollection ( ) = default ; ~ vtkStructuredPointsCollection ( ) override = default ; private :  hide the standard AddItem from the user and the compiler. void AddItem ( vtkObject * o ) { this -> vtkCollection :: AddItem ( o ) ; } private : vtkStructuredPointsCollection ( const vtkStructuredPointsCollection & ) = delete ; void operator = ( const vtkStructuredPointsCollection & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
