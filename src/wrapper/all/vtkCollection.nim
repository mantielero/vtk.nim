## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCollection.h
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
##  @class   vtkCollection
##  @brief   create and manipulate ordered lists of objects
##
##  vtkCollection is a general object for creating and manipulating lists
##  of objects. The lists are ordered and allow duplicate entries.
##  vtkCollection also serves as a base class for lists of specific types
##  of objects.
##
##  @sa
##  vtkActorCollection vtkAssemblyPaths vtkDataSetCollection
##  vtkImplicitFunctionCollection vtkLightCollection vtkPolyDataCollection
##  vtkRenderWindowCollection vtkRendererCollection
##  vtkStructuredPointsCollection vtkTransformCollection vtkVolumeCollection
##

## !!!Ignored construct:  # vtkCollection_h [NewLine] # vtkCollection_h [NewLine] # vtkCommonCoreModule.h  For export macro # vtkObject.h [NewLine] class vtkCollectionElement ;prevents pick-up by man page generator { public : vtkCollectionElement ( ) : Item ( nullptr ) , Next ( nullptr ) { } vtkObject * Item ; vtkCollectionElement * Next ; } ;
## Error: token expected: ; but got: [identifier]!!!

type
  VTKCOMMONCORE_EXPORTvtkCollectionSimpleIterator* = pointer

discard "forward decl of vtkCollectionIterator"
## !!!Ignored construct:  class VTKCOMMONCORE_EXPORT vtkCollection : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCollection :: IsTypeOf ( type ) ; } static vtkCollection * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCollection * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCollection * NewInstance ( ) const { return vtkCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCollection :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct with empty list.
##  static vtkCollection * New ( ) ; *
##  Add an object to the bottom of the list. Does not prevent duplicate entries.
##  void AddItem ( vtkObject * ) ; *
##  Insert item into the list after the i'th item. Does not prevent duplicate entries.
##  If i < 0 the item is placed at the top of the list.
##  void InsertItem ( int i , vtkObject * ) ; *
##  Replace the i'th item in the collection with another item.
##  void ReplaceItem ( int i , vtkObject * ) ; *
##  Remove the i'th item in the list.
##  Be careful if using this function during traversal of the list using
##  GetNextItemAsObject (or GetNextItem in derived class).  The list WILL
##  be shortened if a valid index is given!  If this->Current is equal to the
##  element being removed, have it point to then next element in the list.
##  void RemoveItem ( int i ) ; *
##  Remove an object from the list. Removes the first object found, not
##  all occurrences. If no object found, list is unaffected.  See warning
##  in description of RemoveItem(int).
##  void RemoveItem ( vtkObject * ) ; *
##  Remove all objects from the list.
##  void RemoveAllItems ( ) ; *
##  Search for an object and return location in list. If the return value is
##  0, the object was not found. If the object was found, the location is
##  the return value-1.
##  int IsItemPresent ( vtkObject * a ) ; *
##  Return the number of objects in the list.
##  int GetNumberOfItems ( ) { return this -> NumberOfItems ; } *
##  Initialize the traversal of the collection. This means the data pointer
##  is set at the beginning of the list.
##  void InitTraversal ( ) { this -> Current = this -> Top ; } *
##  A reentrant safe way to iterate through a collection.
##  Just pass the same cookie value around each time
##  void InitTraversal ( vtkCollectionSimpleIterator & cookie ) { cookie = static_cast < vtkCollectionSimpleIterator > ( this -> Top ) ; } *
##  Get the next item in the collection. nullptr is returned if the collection
##  is exhausted.
##  vtkObject * GetNextItemAsObject ( ) ; *
##  Get the i'th item in the collection. nullptr is returned if i is out
##  of range
##  vtkObject * GetItemAsObject ( int i ) ; *
##  A reentrant safe way to get the next object as a collection. Just pass the
##  same cookie back and forth.
##  vtkObject * GetNextItemAsObject ( vtkCollectionSimpleIterator & cookie ) ; *
##  Get an iterator to traverse the objects in this collection.
##  VTK_NEWINSTANCE vtkCollectionIterator * NewIterator ( ) ; /@{ *
##  Participate in garbage collection.
##  bool UsesGarbageCollector ( ) const override { return true ; } /@} protected : vtkCollection ( ) ; ~ vtkCollection ( ) override ; virtual void RemoveElement ( vtkCollectionElement * element , vtkCollectionElement * previous ) ; virtual void DeleteElement ( vtkCollectionElement * ) ; int NumberOfItems ; vtkCollectionElement * Top ; vtkCollectionElement * Bottom ; vtkCollectionElement * Current ; friend class vtkCollectionIterator ;  See vtkGarbageCollector.h: void ReportReferences ( vtkGarbageCollector * collector ) override ; private : vtkCollection ( const vtkCollection & ) = delete ; void operator = ( const vtkCollection & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

proc GetNextItemAsObject*(): ptr vtkObject {.
    importcpp: "VTKCOMMONCORE_EXPORT::GetNextItemAsObject(@)",
    header: "vtkCollection.h".}
proc GetNextItemAsObject*(cookie: pointer): ptr vtkObject {.
    importcpp: "VTKCOMMONCORE_EXPORT::GetNextItemAsObject(@)",
    header: "vtkCollection.h".}