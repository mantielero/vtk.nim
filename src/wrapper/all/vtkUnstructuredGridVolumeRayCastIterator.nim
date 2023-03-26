##  -*- c++ -*-
## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnstructuredGridVolumeRayCastIterator.h
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
##  @class   vtkUnstructuredGridVolumeRayCastIterator
##
##
##
##  vtkUnstructuredGridVolumeRayCastIterator is a superclass for iterating
##  over the intersections of a viewing ray with a group of unstructured
##  cells.  These iterators are created with a
##  vtkUnstructuredGridVolumeRayCastFunction.
##
##  @sa
##  vtkUnstructuredGridVolumeRayCastFunction
##
##

## !!!Ignored construct:  # vtkUnstructuredGridVolumeRayCastIterator_h [NewLine] # vtkUnstructuredGridVolumeRayCastIterator_h [NewLine] # vtkObject.h [NewLine] # vtkRenderingVolumeModule.h  For export macro [NewLine] class vtkIdList ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkDataArray"
## !!!Ignored construct:  class VTKRENDERINGVOLUME_EXPORT vtkUnstructuredGridVolumeRayCastIterator : public vtkObject { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkUnstructuredGridVolumeRayCastIterator :: IsTypeOf ( type ) ; } static vtkUnstructuredGridVolumeRayCastIterator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkUnstructuredGridVolumeRayCastIterator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkUnstructuredGridVolumeRayCastIterator * NewInstance ( ) const { return vtkUnstructuredGridVolumeRayCastIterator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnstructuredGridVolumeRayCastIterator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnstructuredGridVolumeRayCastIterator :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Initializes the iteration to the start of the ray at the given screen
##  coordinates.
##  virtual void Initialize ( int x , int y ) = 0 ; *
##  Get the intersections of the next several cells.  The cell ids are
##  stored in \c intersectedCells and the length of each ray segment
##  within the cell is stored in \c intersectionLengths.  The point
##  scalars \c scalars are interpolated and stored in \c nearIntersections
##  and \c farIntersections.  \c intersectedCells, \c intersectionLengths,
##  or \c scalars may be \c NULL to suppress passing the associated
##  information.  The number of intersections actually encountered is
##  returned.  0 is returned if and only if no more intersections are to
##  be found.
##  virtual vtkIdType GetNextIntersections ( vtkIdList * intersectedCells , vtkDoubleArray * intersectionLengths , vtkDataArray * scalars , vtkDataArray * nearIntersections , vtkDataArray * farIntersections ) = 0 ; /@{ *
##  Set/get the bounds of the cast ray (in viewing coordinates).  By
##  default the range is [0,1].
##  virtual void SetBounds ( double _arg1 , double _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Bounds  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> Bounds [ 0 ] != _arg1 ) || ( this -> Bounds [ 1 ] != _arg2 ) ) { this -> Bounds [ 0 ] = _arg1 ; this -> Bounds [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetBounds ( const double _arg [ 2 ] ) { this -> SetBounds ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual double * GetBounds ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Bounds  pointer  << this -> Bounds ) ; return this -> Bounds ; } VTK_WRAPEXCLUDE virtual void GetBounds ( double & _arg1 , double & _arg2 ) { _arg1 = this -> Bounds [ 0 ] ; _arg2 = this -> Bounds [ 1 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Bounds  = ( << _arg1 << , << _arg2 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetBounds ( double _arg [ 2 ] ) { this -> GetBounds ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; /@}  Description:
##  Set/get the maximum number of intersections returned with a call to
##  GetNextIntersections.  Set to 32 by default. virtual void SetMaxNumberOfIntersections ( vtkIdType _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaxNumberOfIntersections  to  << _arg ) ; if ( this -> MaxNumberOfIntersections != _arg ) { this -> MaxNumberOfIntersections = _arg ; this -> Modified ( ) ; } } ; virtual vtkIdType GetMaxNumberOfIntersections ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxNumberOfIntersections  of  << this -> MaxNumberOfIntersections ) ; return this -> MaxNumberOfIntersections ; } ; protected : vtkUnstructuredGridVolumeRayCastIterator ( ) ; ~ vtkUnstructuredGridVolumeRayCastIterator ( ) override ; double Bounds [ 2 ] ; vtkIdType MaxNumberOfIntersections ; private : vtkUnstructuredGridVolumeRayCastIterator ( const vtkUnstructuredGridVolumeRayCastIterator & ) = delete ; void operator = ( const vtkUnstructuredGridVolumeRayCastIterator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
