## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkGenericPointIterator.h
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
##  @class   vtkGenericPointIterator
##  @brief   iterator used to traverse points
##
##  This class (and subclasses) are used to iterate over points. Use it
##  only in conjunction with vtkGenericDataSet (i.e., the adaptor framework).
##
##  Typical use is:
##  <pre>
##  vtkGenericDataSet *dataset;
##  vtkGenericPointIterator *it = dataset->NewPointIterator();
##  for (it->Begin(); !it->IsAtEnd(); it->Next());
##    {
##    x=it->GetPosition();
##    }
##  </pre>
##

## !!!Ignored construct:  # vtkGenericPointIterator_h [NewLine] # vtkGenericPointIterator_h [NewLine] # vtkCommonDataModelModule.h  For export macro # vtkObject.h [NewLine] class VTKCOMMONDATAMODEL_EXPORT vtkGenericPointIterator : public vtkObject { public : /@{ *
##  Standard VTK construction and type macros.
##  protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkGenericPointIterator :: IsTypeOf ( type ) ; } static vtkGenericPointIterator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkGenericPointIterator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkGenericPointIterator * NewInstance ( ) const { return vtkGenericPointIterator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkGenericPointIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkGenericPointIterator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} *
##  Move iterator to first position if any (loop initialization).
##  virtual void Begin ( ) = 0 ; *
##  Is the iterator at the end of traversal?
##  virtual vtkTypeBool IsAtEnd ( ) = 0 ; *
##  Move the iterator to the next position in the list.
##  \pre not_off: !IsAtEnd()
##  virtual void Next ( ) = 0 ; *
##  Get the coordinates of the point at the current iterator position.
##  \pre not_off: !IsAtEnd()
##  \post result_exists: result!=0
##  virtual double * GetPosition ( ) = 0 ; *
##  Get the coordinates of the point at the current iterator position.
##  \pre not_off: !IsAtEnd()
##  \pre x_exists: x!=0
##  virtual void GetPosition ( double x [ 3 ] ) = 0 ; *
##  Return the unique identifier for the point, could be non-contiguous.
##  \pre not_off: !IsAtEnd()
##  virtual vtkIdType GetId ( ) = 0 ; protected : /@{ *
##  Destructor.
##  vtkGenericPointIterator ( ) ; ~ vtkGenericPointIterator ( ) override ; /@} private : vtkGenericPointIterator ( const vtkGenericPointIterator & ) = delete ; void operator = ( const vtkGenericPointIterator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
