## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExtractHierarchicalBins.h
##
##   Copyright (c) Kitware, Inc.
##   All rights reserved.
##   See LICENSE file for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkExtractHierarchicalBins
##  @brief   manipulate the output of
##  vtkHierarchicalBinningFilter
##
##
##  vtkExtractHierarchicalBins enables users to extract data from the output
##  of vtkHierarchicalBinningFilter. Points at a particular level, or at a
##  level and bin number, can be filtered to the output. To perform these
##  operations, the output must contain points sorted into bins (the
##  vtkPoints), with offsets pointing to the beginning of each bin (a
##  vtkFieldData array named "BinOffsets").
##
##
##  @warning
##  This class has been threaded with vtkSMPTools. Using TBB or other
##  non-sequential type (set in the CMake variable
##  VTK_SMP_IMPLEMENTATION_TYPE) may improve performance significantly.
##
##  @sa
##  vtkFiltersPointsFilter vtkRadiusOutlierRemoval vtkStatisticalOutlierRemoval
##  vtkThresholdPoints vtkImplicitFunction vtkExtractGeometry
##  vtkFitImplicitFunction
##

## !!!Ignored construct:  # vtkExtractHierarchicalBins_h [NewLine] # vtkExtractHierarchicalBins_h [NewLine] # vtkFiltersPointsModule.h  For export macro # vtkPointCloudFilter.h [NewLine] class vtkHierarchicalBinningFilter ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkPointSet"
## !!!Ignored construct:  class VTKFILTERSPOINTS_EXPORT vtkExtractHierarchicalBins : public vtkPointCloudFilter { public : /@{ *
##  Standard methods for instantiating, obtaining type information, and
##  printing information.
##  static vtkExtractHierarchicalBins * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPointCloudFilter Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPointCloudFilter :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExtractHierarchicalBins :: IsTypeOf ( type ) ; } static vtkExtractHierarchicalBins * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExtractHierarchicalBins * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExtractHierarchicalBins * NewInstance ( ) const { return vtkExtractHierarchicalBins :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPointCloudFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExtractHierarchicalBins :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExtractHierarchicalBins :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Specify the level to extract. If non-negative, with a negative bin
##  number, then all points at this level are extracted and sent to the
##  output. If negative, then the points from the specified bin are sent to
##  the output. If both the level and bin number are negative values, then
##  the input is sent to the output. By default the 0th level is
##  extracted. Note that requesting a level greater than the associated
##  vtkHierarchicalBinningFilter will clamp the level to the maximum
##  possible level of the binning filter.
##  virtual void SetLevel ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Level  to  << _arg ) ; if ( this -> Level != _arg ) { this -> Level = _arg ; this -> Modified ( ) ; } } ; virtual int GetLevel ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Level  of  << this -> Level ) ; return this -> Level ; } ; /@} /@{ *
##  Specify the bin number to extract. If a non-negative value, then the
##  points from the bin number specified are extracted. If negative, then
##  entire levels of points are extacted (assuming the Level is
##  non-negative). Note that the bin tree is flattened, a particular bin
##  number may refer to a bin on any level. Note that requesting a bin
##  greater than the associated vtkHierarchicalBinningFilter will clamp the
##  bin to the maximum possible bin of the binning filter.
##  virtual void SetLevelBin ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Bin  to  << _arg ) ; if ( this -> Bin != _arg ) { this -> Bin = _arg ; this -> Modified ( ) ; } } ; virtual int GetLevelBin ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Bin  of  << this -> Bin ) ; return this -> Bin ; } ; /@} /@{ *
##  Specify the vtkHierarchicalBinningFilter to query for relevant
##  information. Make sure that this filter has executed prior to the execution of
##  this filter. (This is generally a safe bet if connected in a pipeline.)
##  virtual void SetBinningFilter ( vtkHierarchicalBinningFilter * ) ; virtual vtkHierarchicalBinningFilter * GetnameBinningFilter ( ) { vtkDebugWithObjectMacro ( this , <<  returning  BinningFilter  address  << static_cast < vtkHierarchicalBinningFilter * > ( this -> BinningFilter ) ) ; return this -> BinningFilter ; } ; /@} protected : vtkExtractHierarchicalBins ( ) ; ~ vtkExtractHierarchicalBins ( ) override ;  Users can extract points from a particular level or bin. int Level ; int Bin ; vtkHierarchicalBinningFilter * BinningFilter ;  for the binning filter void ReportReferences ( vtkGarbageCollector * ) override ;  All derived classes must implement this method. Note that a side effect of
##  the class is to populate the PointMap. Zero is returned if there is a failure. int FilterPoints ( vtkPointSet * input ) override ; private : vtkExtractHierarchicalBins ( const vtkExtractHierarchicalBins & ) = delete ; void operator = ( const vtkExtractHierarchicalBins & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
