## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkPolyDataCollection.h
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
##  @class   vtkPolyDataCollection
##  @brief   maintain a list of polygonal data objects
##
##  vtkPolyDataCollection is an object that creates and manipulates ordered
##  lists of datasets of type vtkPolyData.
##
##  @sa
##  vtkDataSetCollection vtkCollection
##

## !!!Ignored construct:  # vtkPolyDataCollection_h [NewLine] # vtkPolyDataCollection_h [NewLine] # vtkCollection.h [NewLine] # vtkCommonDataModelModule.h  For export macro [NewLine] # vtkPolyData.h  Needed for static cast [NewLine] class VTKCOMMONDATAMODEL_EXPORT vtkPolyDataCollection : public vtkCollection { public : static vtkPolyDataCollection * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCollection Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCollection :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkPolyDataCollection :: IsTypeOf ( type ) ; } static vtkPolyDataCollection * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkPolyDataCollection * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkPolyDataCollection * NewInstance ( ) const { return vtkPolyDataCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkPolyDataCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkPolyDataCollection :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Add a poly data to the bottom of the list.
##  void AddItem ( vtkPolyData * pd ) { this -> vtkCollection :: AddItem ( pd ) ; } *
##  Get the next poly data in the list.
##  vtkPolyData * GetNextItem ( ) { return static_cast < vtkPolyData * > ( this -> GetNextItemAsObject ( ) ) ; } *
##  Reentrant safe way to get an object in a collection. Just pass the
##  same cookie back and forth.
##  vtkPolyData * GetNextPolyData ( vtkCollectionSimpleIterator & cookie ) { return static_cast < vtkPolyData * > ( this -> GetNextItemAsObject ( cookie ) ) ; } protected : vtkPolyDataCollection ( ) = default ; ~ vtkPolyDataCollection ( ) override = default ; private :  hide the standard AddItem from the user and the compiler. void AddItem ( vtkObject * o ) { this -> vtkCollection :: AddItem ( o ) ; } private : vtkPolyDataCollection ( const vtkPolyDataCollection & ) = delete ; void operator = ( const vtkPolyDataCollection & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
