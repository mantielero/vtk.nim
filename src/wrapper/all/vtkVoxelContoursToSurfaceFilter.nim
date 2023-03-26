## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVoxelContoursToSurfaceFilter.h
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
##  @class   vtkVoxelContoursToSurfaceFilter
##  @brief   create surface from contours
##
##  vtkVoxelContoursToSurfaceFilter is a filter that takes contours and
##  produces surfaces. There are some restrictions for the contours:
##
##    - The contours are input as vtkPolyData, with the contours being
##      polys in the vtkPolyData.
##    - The contours lie on XY planes - each contour has a constant Z
##    - The contours are ordered in the polys of the vtkPolyData such
##      that all contours on the first (lowest) XY plane are first, then
##      continuing in order of increasing Z value.
##    - The X, Y and Z coordinates are all integer values.
##    - The desired sampling of the contour data is 1x1x1 - Aspect can
##      be used to control the aspect ratio in the output polygonal
##      dataset.
##
##  This filter takes the contours and produces a structured points
##  dataset of signed floating point number indicating distance from
##  a contour. A contouring filter is then applied to generate 3D
##  surfaces from a stack of 2D contour distance slices. This is
##  done in a streaming fashion so as not to use to much memory.
##
##  @sa
##  vtkPolyDataAlgorithm
##

## !!!Ignored construct:  # vtkVoxelContoursToSurfaceFilter_h [NewLine] # vtkVoxelContoursToSurfaceFilter_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class VTKFILTERSGENERAL_EXPORT vtkVoxelContoursToSurfaceFilter : public vtkPolyDataAlgorithm { public : static vtkVoxelContoursToSurfaceFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkVoxelContoursToSurfaceFilter :: IsTypeOf ( type ) ; } static vtkVoxelContoursToSurfaceFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkVoxelContoursToSurfaceFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkVoxelContoursToSurfaceFilter * NewInstance ( ) const { return vtkVoxelContoursToSurfaceFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVoxelContoursToSurfaceFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVoxelContoursToSurfaceFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set / Get the memory limit in bytes for this filter. This is the limit
##  of the size of the structured points data set that is created for
##  intermediate processing. The data will be streamed through this volume
##  in as many pieces as necessary.
##  virtual void SetMemoryLimitInBytes ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MemoryLimitInBytes  to  << _arg ) ; if ( this -> MemoryLimitInBytes != _arg ) { this -> MemoryLimitInBytes = _arg ; this -> Modified ( ) ; } } ; virtual int GetMemoryLimitInBytes ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MemoryLimitInBytes  of  << this -> MemoryLimitInBytes ) ; return this -> MemoryLimitInBytes ; } ; /@} virtual void SetSpacing ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Spacing  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Spacing [ 0 ] != _arg1 ) || ( this -> Spacing [ 1 ] != _arg2 ) || ( this -> Spacing [ 2 ] != _arg3 ) ) { this -> Spacing [ 0 ] = _arg1 ; this -> Spacing [ 1 ] = _arg2 ; this -> Spacing [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetSpacing ( const double _arg [ 3 ] ) { this -> SetSpacing ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetSpacing ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Spacing  pointer  << this -> Spacing ) ; return this -> Spacing ; } VTK_WRAPEXCLUDE virtual void GetSpacing ( double data [ 3 ] ) { for ( int i = 0 ; i < 3 ; i ++ ) { data [ i ] = this -> Spacing [ i ] ; } } ; protected : vtkVoxelContoursToSurfaceFilter ( ) ; ~ vtkVoxelContoursToSurfaceFilter ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int MemoryLimitInBytes ; double Spacing [ 3 ] ; double * LineList ; int LineListLength ; int LineListSize ; double * SortedXList ; double * SortedYList ; int SortedListSize ; int * WorkingList ; int WorkingListLength ; double * IntersectionList ; int IntersectionListLength ; void AddLineToLineList ( double x1 , double y1 , double x2 , double y2 ) ; void SortLineList ( ) ; void CastLines ( float * slice , double gridOrigin [ 3 ] , int gridSize [ 3 ] , int type ) ; void PushDistances ( float * ptr , int gridSize [ 3 ] , int chunkSize ) ; private : vtkVoxelContoursToSurfaceFilter ( const vtkVoxelContoursToSurfaceFilter & ) = delete ; void operator = ( const vtkVoxelContoursToSurfaceFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
