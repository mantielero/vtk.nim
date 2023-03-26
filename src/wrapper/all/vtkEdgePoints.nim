## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkEdgePoints.h
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
##  @class   vtkEdgePoints
##  @brief   generate points on isosurface
##
##  vtkEdgePoints is a filter that takes as input any dataset and
##  generates for output a set of points that lie on an isosurface. The
##  points are created by interpolation along cells edges whose end-points are
##  below and above the contour value.
##  @warning
##  vtkEdgePoints can be considered a "poor man's" dividing cubes algorithm
##  (see vtkDividingCubes). Points are generated only on the edges of cells,
##  not in the interior, and at lower density than dividing cubes. However, it
##  is more general than dividing cubes since it treats any type of dataset.
##

## !!!Ignored construct:  # vtkEdgePoints_h [NewLine] # vtkEdgePoints_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkMergePoints ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkEdgePoints : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkEdgePoints :: IsTypeOf ( type ) ; } static vtkEdgePoints * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkEdgePoints * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkEdgePoints * NewInstance ( ) const { return vtkEdgePoints :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkEdgePoints :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkEdgePoints :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct object with contour value of 0.0.
##  static vtkEdgePoints * New ( ) ; /@{ *
##  Set/get the contour value.
##  virtual void SetValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Value  to  << _arg ) ; if ( this -> Value != _arg ) { this -> Value = _arg ; this -> Modified ( ) ; } } ; virtual double GetValue ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Value  of  << this -> Value ) ; return this -> Value ; } ; /@} protected : vtkEdgePoints ( ) ; ~ vtkEdgePoints ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int port , vtkInformation * info ) override ; double Value ; vtkMergePoints * Locator ; private : vtkEdgePoints ( const vtkEdgePoints & ) = delete ; void operator = ( const vtkEdgePoints & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
