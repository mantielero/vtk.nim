## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCellSizeFilter.h
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
##  @class   vtkCellSizeFilter
##  @brief   Computes cell sizes.
##
##  Computes the cell sizes for all types of cells in VTK. For triangles,
##  quads, tets and hexes the static methods in vtkMeshQuality are used.
##  This is done through Verdict for higher accuracy.
##  Other cell types are individually done analytically where possible
##  and breaking into triangles or tets when not possible. When cells are
##  broken into triangles or tets the accuracy may be diminished. By default
##  all sizes are computed but vertex count, length, area and volumetric cells
##  can each be optionally ignored. Individual arrays are used for each
##  requested size (e.g. if length and volume are requested there will be
##  two arrays outputted from this filter). The 4 arrays can be individually
##  named with defaults of VertexCount, Length, Area and Volme. For dimensions
##  of cells that do not have their size computed, a value of 0 will be given.
##  For cells that should have their size computed but can't, the filter will return -1.
##  The ComputeSum option will sum the cell sizes (excluding ghost cells)
##  and put the value into vtkFieldData arrays named with the corresponding cell
##  data array name. For composite datasets the total sum over all blocks will
##  also be added to the top-level block's field data for the summation.
##

## !!!Ignored construct:  # vtkCellSizeFilter_h [NewLine] # vtkCellSizeFilter_h [NewLine] # vtkFiltersVerdictModule.h  For export macro # vtkPassInputTypeAlgorithm.h [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkDoubleArray"
discard "forward decl of vtkIdList"
discard "forward decl of vtkImageData"
discard "forward decl of vtkPointSet"
## !!!Ignored construct:  class VTKFILTERSVERDICT_EXPORT vtkCellSizeFilter : public vtkPassInputTypeAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPassInputTypeAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPassInputTypeAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkCellSizeFilter :: IsTypeOf ( type ) ; } static vtkCellSizeFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkCellSizeFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkCellSizeFilter * NewInstance ( ) const { return vtkCellSizeFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPassInputTypeAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkCellSizeFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkCellSizeFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkCellSizeFilter * New ( ) ; /@{ *
##  Specify whether or not to compute sizes for vertex and polyvertex
##  cells. The computed value is the number of points in the cell.
##  This option is enabled by default.
##  virtual void SetComputeVertexCount ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeVertexCount  to  << _arg ) ; if ( this -> ComputeVertexCount != _arg ) { this -> ComputeVertexCount = _arg ; this -> Modified ( ) ; } } ; virtual bool GetComputeVertexCount ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeVertexCount  of  << this -> ComputeVertexCount ) ; return this -> ComputeVertexCount ; } ; virtual void ComputeVertexCountOn ( ) { this -> SetComputeVertexCount ( static_cast < bool > ( 1 ) ) ; } virtual void ComputeVertexCountOff ( ) { this -> SetComputeVertexCount ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify whether or not to compute sizes for 1D cells
##  cells. The computed value is the length of the cell.
##  This option is enabled by default.
##  virtual void SetComputeVertexCountComputeLength ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeLength  to  << _arg ) ; if ( this -> ComputeLength != _arg ) { this -> ComputeLength = _arg ; this -> Modified ( ) ; } } ; virtual bool GetComputeVertexCountComputeLength ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeLength  of  << this -> ComputeLength ) ; return this -> ComputeLength ; } ; virtual void ComputeLengthOn ( ) { this -> SetComputeVertexCountComputeLength ( static_cast < bool > ( 1 ) ) ; } virtual void ComputeLengthOff ( ) { this -> SetComputeVertexCountComputeLength ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify whether or not to compute sizes for 2D cells
##  cells. The computed value is the area of the cell.
##  This option is enabled by default.
##  virtual void SetComputeVertexCountComputeLengthComputeArea ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeArea  to  << _arg ) ; if ( this -> ComputeArea != _arg ) { this -> ComputeArea = _arg ; this -> Modified ( ) ; } } ; virtual bool GetComputeVertexCountComputeLengthComputeArea ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeArea  of  << this -> ComputeArea ) ; return this -> ComputeArea ; } ; virtual void ComputeAreaOn ( ) { this -> SetComputeVertexCountComputeLengthComputeArea ( static_cast < bool > ( 1 ) ) ; } virtual void ComputeAreaOff ( ) { this -> SetComputeVertexCountComputeLengthComputeArea ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify whether or not to compute sizes for 3D cells
##  cells. The computed value is the volume of the cell.
##  This option is enabled by default.
##  virtual void SetComputeVertexCountComputeLengthComputeAreaComputeVolume ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeVolume  to  << _arg ) ; if ( this -> ComputeVolume != _arg ) { this -> ComputeVolume = _arg ; this -> Modified ( ) ; } } ; virtual bool GetComputeVertexCountComputeLengthComputeAreaComputeVolume ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeVolume  of  << this -> ComputeVolume ) ; return this -> ComputeVolume ; } ; virtual void ComputeVolumeOn ( ) { this -> SetComputeVertexCountComputeLengthComputeAreaComputeVolume ( static_cast < bool > ( 1 ) ) ; } virtual void ComputeVolumeOff ( ) { this -> SetComputeVertexCountComputeLengthComputeAreaComputeVolume ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify whether to sum the computed sizes and put the result in
##  a field data array. This option is disabled by default.
##  virtual void SetComputeVertexCountComputeLengthComputeAreaComputeVolumeComputeSum ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ComputeSum  to  << _arg ) ; if ( this -> ComputeSum != _arg ) { this -> ComputeSum = _arg ; this -> Modified ( ) ; } } ; virtual bool GetComputeVertexCountComputeLengthComputeAreaComputeVolumeComputeSum ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ComputeSum  of  << this -> ComputeSum ) ; return this -> ComputeSum ; } ; virtual void ComputeSumOn ( ) { this -> SetComputeVertexCountComputeLengthComputeAreaComputeVolumeComputeSum ( static_cast < bool > ( 1 ) ) ; } virtual void ComputeSumOff ( ) { this -> SetComputeVertexCountComputeLengthComputeAreaComputeVolumeComputeSum ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Set/Get the name of the computed arrays. Default names are VertexCount,
##  Length, Area and Volume.
##  virtual void SetVertexCountArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << VertexCountArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> VertexCountArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> VertexCountArrayName && _arg && ( ! strcmp ( this -> VertexCountArrayName , _arg ) ) ) { return ; } delete [ ] this -> VertexCountArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> VertexCountArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> VertexCountArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetVertexCountArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << VertexCountArrayName  of  << ( this -> VertexCountArrayName ? this -> VertexCountArrayName : (null) ) ) ; return this -> VertexCountArrayName ; } ; virtual void SetVertexCountArrayNameLengthArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << LengthArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> LengthArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> LengthArrayName && _arg && ( ! strcmp ( this -> LengthArrayName , _arg ) ) ) { return ; } delete [ ] this -> LengthArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> LengthArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> LengthArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetVertexCountArrayNameLengthArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << LengthArrayName  of  << ( this -> LengthArrayName ? this -> LengthArrayName : (null) ) ) ; return this -> LengthArrayName ; } ; virtual void SetVertexCountArrayNameLengthArrayNameAreaArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << AreaArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> AreaArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> AreaArrayName && _arg && ( ! strcmp ( this -> AreaArrayName , _arg ) ) ) { return ; } delete [ ] this -> AreaArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> AreaArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> AreaArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetVertexCountArrayNameLengthArrayNameAreaArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << AreaArrayName  of  << ( this -> AreaArrayName ? this -> AreaArrayName : (null) ) ) ; return this -> AreaArrayName ; } ; virtual void SetVertexCountArrayNameLengthArrayNameAreaArrayNameVolumeArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << VolumeArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> VolumeArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> VolumeArrayName && _arg && ( ! strcmp ( this -> VolumeArrayName , _arg ) ) ) { return ; } delete [ ] this -> VolumeArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> VolumeArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> VolumeArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetVertexCountArrayNameLengthArrayNameAreaArrayNameVolumeArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << VolumeArrayName  of  << ( this -> VolumeArrayName ? this -> VolumeArrayName : (null) ) ) ; return this -> VolumeArrayName ; } ; /@} protected : vtkCellSizeFilter ( ) ; ~ vtkCellSizeFilter ( ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; bool ComputeDataSet ( vtkDataSet * input , vtkDataSet * output , double sum [ 4 ] ) ; void IntegrateImageData ( vtkImageData * input , vtkImageData * output , double sum [ 4 ] ) ; void ExecuteBlock ( vtkDataSet * input , vtkDataSet * output , double sum [ 4 ] ) ; /@{ *
##  Specify whether to sum the computed sizes and put the result in
##  a field data array. This option is disabled by default.
##  double IntegratePolyLine ( vtkDataSet * input , vtkIdList * cellPtIds ) ; double IntegratePolygon ( vtkPointSet * input , vtkIdList * cellPtIds ) ; double IntegrateTriangleStrip ( vtkPointSet * input , vtkIdList * cellPtIds ) ; double IntegratePixel ( vtkDataSet * input , vtkIdList * cellPtIds ) ; double IntegrateVoxel ( vtkDataSet * input , vtkIdList * cellPtIds ) ; double IntegrateGeneral1DCell ( vtkDataSet * input , vtkIdList * cellPtIds ) ; double IntegrateGeneral2DCell ( vtkPointSet * input , vtkIdList * cellPtIds ) ; double IntegrateGeneral3DCell ( vtkPointSet * input , vtkIdList * cellPtIds ) ; /@} /@{ *
##  Method to add the computed sum to the field data of the data object.
##  void AddSumFieldData ( vtkDataObject * , double sum [ 4 ] ) ; /@} /@{ *
##  Method to compute the global sum information. For serial operation this is a no-op.
##  virtual void ComputeGlobalSum ( double sum [ 4 ] ) { ( void ) sum ; } /@} private : vtkCellSizeFilter ( const vtkCellSizeFilter & ) = delete ; void operator = ( const vtkCellSizeFilter & ) = delete ; bool ComputeVertexCount ; bool ComputeLength ; bool ComputeArea ; bool ComputeVolume ; bool ComputeSum ; char * VertexCountArrayName ; char * LengthArrayName ; char * AreaArrayName ; char * VolumeArrayName ; } ;
## Error: token expected: ; but got: [identifier]!!!
