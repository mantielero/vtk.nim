## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkImageSliceCollection.h
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
##  @class   vtkImageSliceCollection
##  @brief   a sorted list of image slice objects
##
##  vtkImageSliceCollection is a vtkPropCollection that maintains
##  a list of vtkImageSlice objects that are sorted by LayerNumber.
##  This allows the images to be rendered in the correct order.
##  @sa
##  vtkImageSlice vtkImageAssembly
##

## !!!Ignored construct:  # vtkImageSliceCollection_h [NewLine] # vtkImageSliceCollection_h [NewLine] # vtkImageSlice.h  to allow inline static-cast # vtkPropCollection.h [NewLine] # vtkRenderingImageModule.h  For export macro [NewLine] class VTKRENDERINGIMAGE_EXPORT vtkImageSliceCollection : public vtkPropCollection { public : static vtkImageSliceCollection * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPropCollection Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPropCollection :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkImageSliceCollection :: IsTypeOf ( type ) ; } static vtkImageSliceCollection * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkImageSliceCollection * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkImageSliceCollection * NewInstance ( ) const { return vtkImageSliceCollection :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPropCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkImageSliceCollection :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkImageSliceCollection :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Sorts the vtkImageSliceCollection by layer number.  Smaller layer
##  numbers are first. Layer numbers can be any integer value. Items
##  with the same layer number will be kept in the same relative order
##  as before the sort.
##  void Sort ( ) ; *
##  Add an image to the list.  The new image is inserted in the list
##  according to its layer number.
##  void AddItem ( vtkImageSlice * a ) ; *
##  Standard Collection methods.  You must call InitTraversal
##  before calling GetNextImage.  If possible, you should use the
##  GetNextImage method that takes a collection iterator instead.
##  vtkImageSlice * GetNextImage ( ) ; *
##  Reentrant safe way to get an object in a collection.
##  vtkImageSlice * GetNextImage ( vtkCollectionSimpleIterator & cookie ) ; *
##  Access routine provided for compatibility with previous
##  versions of VTK.  Please use the GetNextImage() variant
##  where possible.
##  vtkImageSlice * GetNextItem ( ) { return this -> GetNextImage ( ) ; } protected : vtkImageSliceCollection ( ) = default ; ~ vtkImageSliceCollection ( ) override ; void DeleteElement ( vtkCollectionElement * ) override ; private :  hide the standard AddItem from the user and the compiler. void AddItem ( vtkObject * o ) { this -> vtkCollection :: AddItem ( o ) ; } void AddItem ( vtkProp * o ) { this -> vtkPropCollection :: AddItem ( o ) ; } private : vtkImageSliceCollection ( const vtkImageSliceCollection & ) = delete ; void operator = ( const vtkImageSliceCollection & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

proc GetNextImage*(): ptr vtkImageSlice {.importcpp: "VTKRENDERINGIMAGE_EXPORT::GetNextImage(@)",
                                      header: "vtkImageSliceCollection.h".}
proc GetNextImage*(cookie: var vtkCollectionSimpleIterator): ptr vtkImageSlice {.
    importcpp: "VTKRENDERINGIMAGE_EXPORT::GetNextImage(@)",
    header: "vtkImageSliceCollection.h".}