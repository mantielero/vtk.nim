## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkOverrideInformationCollection.h
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
##  @class   vtkOverrideInformationCollection
##  @brief   maintain a list of override information objects
##
##  vtkOverrideInformationCollection is an object that creates and manipulates
##  lists of objects of type vtkOverrideInformation.
##  @sa
##  vtkCollection
##

## !!!Ignored construct:  # vtkOverrideInformationCollection_h [NewLine] # vtkOverrideInformationCollection_h [NewLine] # vtkCollection.h [NewLine] # vtkCommonCoreModule.h  For export macro [NewLine] # vtkOverrideInformation.h  Needed for inline methods [NewLine] class VTKCOMMONCORE_EXPORT vtkOverrideInformationCollection : public vtkCollection { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkCollection Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkCollection :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkOverrideInformationCollection :: IsTypeOf ( type ) ; } static vtkOverrideInformationCollection * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkOverrideInformationCollection * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkOverrideInformationCollection * NewInstance ( ) const { return vtkOverrideInformationCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkOverrideInformationCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkOverrideInformationCollection :: New ( ) ; } public : ; static vtkOverrideInformationCollection * New ( ) ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Add a OverrideInformation to the list.
##  void AddItem ( vtkOverrideInformation * ) ; *
##  Get the next OverrideInformation in the list.
##  vtkOverrideInformation * GetNextItem ( ) ; *
##  Reentrant safe way to get an object in a collection. Just pass the
##  same cookie back and forth.
##  vtkOverrideInformation * GetNextOverrideInformation ( vtkCollectionSimpleIterator & cookie ) { return static_cast < vtkOverrideInformation * > ( this -> GetNextItemAsObject ( cookie ) ) ; } protected : vtkOverrideInformationCollection ( ) = default ; ~ vtkOverrideInformationCollection ( ) override = default ; private :  hide the standard AddItem from the user and the compiler. void AddItem ( vtkObject * o ) { this -> vtkCollection :: AddItem ( o ) ; } private : vtkOverrideInformationCollection ( const vtkOverrideInformationCollection & ) = delete ; void operator = ( const vtkOverrideInformationCollection & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

proc AddItem*(f: ptr vtkOverrideInformation) {.
    importcpp: "VTKCOMMONCORE_EXPORT::AddItem(@)",
    header: "vtkOverrideInformationCollection.h".}
proc GetNextItem*(): ptr vtkOverrideInformation {.
    importcpp: "VTKCOMMONCORE_EXPORT::GetNextItem(@)",
    header: "vtkOverrideInformationCollection.h".}