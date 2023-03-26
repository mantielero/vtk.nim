## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkSplineFilter.h
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
##  @class   vtkSplineFilter
##  @brief   generate uniformly subdivided polylines from a set of input polyline using a vtkSpline
##
##  vtkSplineFilter is a filter that generates an output polylines from an
##  input set of polylines. The polylines are uniformly subdivided and produced
##  with the help of a vtkSpline class that the user can specify (by default a
##  vtkCardinalSpline is used). The number of subdivisions of the line can be
##  controlled in several ways. The user can either specify the number of
##  subdivisions or a length of each subdivision can be provided (and the
##  class will figure out how many subdivisions is required over the whole
##  polyline). The maximum number of subdivisions can also be set.
##
##  The output of this filter is a polyline per input polyline (or line). New
##  points and texture coordinates are created. Point data is interpolated and
##  cell data passed on. Any polylines with less than two points, or who have
##  coincident points, are ignored.
##
##  @sa
##  vtkRibbonFilter vtkTubeFilter
##

## !!!Ignored construct:  # vtkSplineFilter_h [NewLine] # vtkSplineFilter_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # VTK_SUBDIVIDE_SPECIFIED 0 [NewLine] # VTK_SUBDIVIDE_LENGTH 1 [NewLine] # VTK_TCOORDS_OFF 0 [NewLine] # VTK_TCOORDS_FROM_NORMALIZED_LENGTH 1 [NewLine] # VTK_TCOORDS_FROM_LENGTH 2 [NewLine] # VTK_TCOORDS_FROM_SCALARS 3 [NewLine] class vtkCellArray ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkCellData"
discard "forward decl of vtkFloatArray"
discard "forward decl of vtkPointData"
discard "forward decl of vtkPoints"
discard "forward decl of vtkSpline"
## !!!Ignored construct:  class VTKFILTERSGENERAL_EXPORT vtkSplineFilter : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkSplineFilter :: IsTypeOf ( type ) ; } static vtkSplineFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkSplineFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkSplineFilter * NewInstance ( ) const { return vtkSplineFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkSplineFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkSplineFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Construct the class with no limit on the number of subdivisions
##  and using an instance of vtkCardinalSpline to perform interpolation.
##  static vtkSplineFilter * New ( ) ; /@{ *
##  Set the maximum number of subdivisions that are created for each
##  polyline.
##  virtual void SetMaximumNumberOfSubdivisions ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MaximumNumberOfSubdivisions  to  << _arg ) ; if ( this -> MaximumNumberOfSubdivisions != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> MaximumNumberOfSubdivisions = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMaximumNumberOfSubdivisionsMinValue ( ) { return 1 ; } virtual int GetMaximumNumberOfSubdivisionsMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetMaximumNumberOfSubdivisions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaximumNumberOfSubdivisions  of  << this -> MaximumNumberOfSubdivisions ) ; return this -> MaximumNumberOfSubdivisions ; } ; /@} /@{ *
##  Specify how the number of subdivisions is determined.
##  virtual void SetMaximumNumberOfSubdivisionsSubdivide ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Subdivide  to  << _arg ) ; if ( this -> Subdivide != ( _arg < VTK_SUBDIVIDE_SPECIFIED ? VTK_SUBDIVIDE_SPECIFIED : ( _arg > VTK_SUBDIVIDE_LENGTH ? VTK_SUBDIVIDE_LENGTH : _arg ) ) ) { this -> Subdivide = ( _arg < VTK_SUBDIVIDE_SPECIFIED ? VTK_SUBDIVIDE_SPECIFIED : ( _arg > VTK_SUBDIVIDE_LENGTH ? VTK_SUBDIVIDE_LENGTH : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMaximumNumberOfSubdivisionsMinValueSubdivideMinValue ( ) { return VTK_SUBDIVIDE_SPECIFIED ; } virtual int GetMaximumNumberOfSubdivisionsMaxValueSubdivideMaxValue ( ) { return VTK_SUBDIVIDE_LENGTH ; } ; virtual int GetMaximumNumberOfSubdivisionsSubdivide ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Subdivide  of  << this -> Subdivide ) ; return this -> Subdivide ; } ; void SetSubdivideToSpecified ( ) { this -> SetSubdivide ( VTK_SUBDIVIDE_SPECIFIED ) ; } void SetSubdivideToLength ( ) { this -> SetSubdivide ( VTK_SUBDIVIDE_LENGTH ) ; } const char * GetSubdivideAsString ( ) ; /@} /@{ *
##  Set the number of subdivisions that are created for the
##  polyline. This method only has effect if Subdivisions is set
##  to SetSubdivisionsToSpecify().
##  virtual void SetMaximumNumberOfSubdivisionsSubdivideNumberOfSubdivisions ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << NumberOfSubdivisions  to  << _arg ) ; if ( this -> NumberOfSubdivisions != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> NumberOfSubdivisions = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMaximumNumberOfSubdivisionsMinValueSubdivideMinValueNumberOfSubdivisionsMinValue ( ) { return 1 ; } virtual int GetMaximumNumberOfSubdivisionsMaxValueSubdivideMaxValueNumberOfSubdivisionsMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetMaximumNumberOfSubdivisionsSubdivideNumberOfSubdivisions ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << NumberOfSubdivisions  of  << this -> NumberOfSubdivisions ) ; return this -> NumberOfSubdivisions ; } ; /@} /@{ *
##  Control the number of subdivisions that are created for the
##  polyline based on an absolute length. The length of the spline
##  is divided by this length to determine the number of subdivisions.
##  virtual void SetMaximumNumberOfSubdivisionsSubdivideNumberOfSubdivisionsLength ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << Length  to  << _arg ) ; if ( this -> Length != ( _arg < 0.0000001 ? 0.0000001 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> Length = ( _arg < 0.0000001 ? 0.0000001 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMaximumNumberOfSubdivisionsMinValueSubdivideMinValueNumberOfSubdivisionsMinValueLengthMinValue ( ) { return 0.0000001 ; } virtual double GetMaximumNumberOfSubdivisionsMaxValueSubdivideMaxValueNumberOfSubdivisionsMaxValueLengthMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetMaximumNumberOfSubdivisionsSubdivideNumberOfSubdivisionsLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Length  of  << this -> Length ) ; return this -> Length ; } ; /@} /@{ *
##  Specify an instance of vtkSpline to use to perform the interpolation.
##  virtual void SetSpline ( vtkSpline * ) ; virtual vtkSpline * GetnameSpline ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Spline  address  << static_cast < vtkSpline * > ( this -> Spline ) ) ; return this -> Spline ; } ; /@} /@{ *
##  Control whether and how texture coordinates are produced. This is
##  useful for striping the output polyline. The texture coordinates
##  can be generated in three ways: a normalized (0,1) generation;
##  based on the length (divided by the texture length); and by using
##  the input scalar values.
##  virtual void SetMaximumNumberOfSubdivisionsSubdivideNumberOfSubdivisionsLengthGenerateTCoords ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << GenerateTCoords  to  << _arg ) ; if ( this -> GenerateTCoords != ( _arg < VTK_TCOORDS_OFF ? VTK_TCOORDS_OFF : ( _arg > VTK_TCOORDS_FROM_SCALARS ? VTK_TCOORDS_FROM_SCALARS : _arg ) ) ) { this -> GenerateTCoords = ( _arg < VTK_TCOORDS_OFF ? VTK_TCOORDS_OFF : ( _arg > VTK_TCOORDS_FROM_SCALARS ? VTK_TCOORDS_FROM_SCALARS : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMaximumNumberOfSubdivisionsMinValueSubdivideMinValueNumberOfSubdivisionsMinValueLengthMinValueGenerateTCoordsMinValue ( ) { return VTK_TCOORDS_OFF ; } virtual int GetMaximumNumberOfSubdivisionsMaxValueSubdivideMaxValueNumberOfSubdivisionsMaxValueLengthMaxValueGenerateTCoordsMaxValue ( ) { return VTK_TCOORDS_FROM_SCALARS ; } ; virtual int GetMaximumNumberOfSubdivisionsSubdivideNumberOfSubdivisionsLengthGenerateTCoords ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateTCoords  of  << this -> GenerateTCoords ) ; return this -> GenerateTCoords ; } ; void SetGenerateTCoordsToOff ( ) { this -> SetGenerateTCoords ( VTK_TCOORDS_OFF ) ; } void SetGenerateTCoordsToNormalizedLength ( ) { this -> SetGenerateTCoords ( VTK_TCOORDS_FROM_NORMALIZED_LENGTH ) ; } void SetGenerateTCoordsToUseLength ( ) { this -> SetGenerateTCoords ( VTK_TCOORDS_FROM_LENGTH ) ; } void SetGenerateTCoordsToUseScalars ( ) { this -> SetGenerateTCoords ( VTK_TCOORDS_FROM_SCALARS ) ; } const char * GetGenerateTCoordsAsString ( ) ; /@} /@{ *
##  Control the conversion of units during the texture coordinates
##  calculation. The TextureLength indicates what length (whether
##  calculated from scalars or length) is mapped to the [0,1)
##  texture space.
##  virtual void SetMaximumNumberOfSubdivisionsSubdivideNumberOfSubdivisionsLengthGenerateTCoordsTextureLength ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << TextureLength  to  << _arg ) ; if ( this -> TextureLength != ( _arg < 0.000001 ? 0.000001 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> TextureLength = ( _arg < 0.000001 ? 0.000001 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetMaximumNumberOfSubdivisionsMinValueSubdivideMinValueNumberOfSubdivisionsMinValueLengthMinValueGenerateTCoordsMinValueTextureLengthMinValue ( ) { return 0.000001 ; } virtual double GetMaximumNumberOfSubdivisionsMaxValueSubdivideMaxValueNumberOfSubdivisionsMaxValueLengthMaxValueGenerateTCoordsMaxValueTextureLengthMaxValue ( ) { return VTK_INT_MAX ; } ; virtual double GetMaximumNumberOfSubdivisionsSubdivideNumberOfSubdivisionsLengthGenerateTCoordsTextureLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << TextureLength  of  << this -> TextureLength ) ; return this -> TextureLength ; } ; /@} protected : vtkSplineFilter ( ) ; ~ vtkSplineFilter ( ) override ;  Usual data generation method int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int MaximumNumberOfSubdivisions ; int Subdivide ; int NumberOfSubdivisions ; double Length ; vtkSpline * Spline ; vtkSpline * XSpline ; vtkSpline * YSpline ; vtkSpline * ZSpline ; int GenerateTCoords ; double TextureLength ;  this length is mapped to [0,1) texture space  helper methods int GeneratePoints ( vtkIdType offset , vtkIdType npts , const vtkIdType * pts , vtkPoints * inPts , vtkPoints * newPts , vtkPointData * pd , vtkPointData * outPD , int genTCoords , vtkFloatArray * newTCoords ) ; void GenerateLine ( vtkIdType offset , vtkIdType numGenPts , vtkIdType inCellId , vtkCellData * cd , vtkCellData * outCD , vtkCellArray * newLines ) ;  helper members vtkFloatArray * TCoordMap ; private : vtkSplineFilter ( const vtkSplineFilter & ) = delete ; void operator = ( const vtkSplineFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
