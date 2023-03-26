## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkIntegrateAttributes.h
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
##  @class   vtkIntegrateAttributes
##  @brief   Integrates lines, surfaces and volume.
##
##  Integrates all point and cell data attributes while computing
##  length, area or volume.  Works for 1D, 2D or 3D.  Only one dimensionality
##  at a time.  For volume, this filter ignores all but 3D cells.  It
##  will not compute the volume contained in a closed surface.
##  The output of this filter is a single point and vertex.  The attributes
##  for this point and cell will contain the integration results
##  for the corresponding input attributes.
##

## !!!Ignored construct:  # vtkIntegrateAttributes_h [NewLine] # vtkIntegrateAttributes_h [NewLine] # vtkFiltersParallelModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class vtkDataSet ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIdList"
discard "forward decl of vtkInformation"
discard "forward decl of vtkInformationVector"
discard "forward decl of vtkDataSetAttributes"
discard "forward decl of vtkMultiProcessController"
## !!!Ignored construct:  class VTKFILTERSPARALLEL_EXPORT vtkIntegrateAttributes : public vtkUnstructuredGridAlgorithm { public : static vtkIntegrateAttributes * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkIntegrateAttributes :: IsTypeOf ( type ) ; } static vtkIntegrateAttributes * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkIntegrateAttributes * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkIntegrateAttributes * NewInstance ( ) const { return vtkIntegrateAttributes :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkIntegrateAttributes :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkIntegrateAttributes :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get/Set the parallel controller to use. By default, set to.
##  `vtkMultiProcessController::GlobalController`.
##  void SetController ( vtkMultiProcessController * controller ) ; virtual vtkMultiProcessController * GetnameController ( ) { vtkDebugWithObjectMacro ( this , <<  returning  Controller  address  << static_cast < vtkMultiProcessController * > ( this -> Controller ) ) ; return this -> Controller ; } ; /@} /@{ *
##  If set to true then the filter will divide all output cell data arrays (the integrated values)
##  by the computed volume/area of the dataset.  Defaults to false.
##  virtual void SetDivideAllCellDataByVolume ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DivideAllCellDataByVolume  to  << _arg ) ; if ( this -> DivideAllCellDataByVolume != _arg ) { this -> DivideAllCellDataByVolume = _arg ; this -> Modified ( ) ; } } ; virtual bool GetDivideAllCellDataByVolume ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DivideAllCellDataByVolume  of  << this -> DivideAllCellDataByVolume ) ; return this -> DivideAllCellDataByVolume ; } ; /@} protected : vtkIntegrateAttributes ( ) ; ~ vtkIntegrateAttributes ( ) override ; vtkMultiProcessController * Controller ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ;  Create a default executive. vtkExecutive * CreateDefaultExecutive ( ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; int CompareIntegrationDimension ( vtkDataSet * output , int dim ) ; int IntegrationDimension ;  The length, area or volume of the data set.  Computed by Execute; double Sum ;  ToCompute the location of the output point. double SumCenter [ 3 ] ; bool DivideAllCellDataByVolume ; void IntegratePolyLine ( vtkDataSet * input , vtkUnstructuredGrid * output , vtkIdType cellId , vtkIdList * cellPtIds ) ; void IntegratePolygon ( vtkDataSet * input , vtkUnstructuredGrid * output , vtkIdType cellId , vtkIdList * cellPtIds ) ; void IntegrateTriangleStrip ( vtkDataSet * input , vtkUnstructuredGrid * output , vtkIdType cellId , vtkIdList * cellPtIds ) ; void IntegrateTriangle ( vtkDataSet * input , vtkUnstructuredGrid * output , vtkIdType cellId , vtkIdType pt1Id , vtkIdType pt2Id , vtkIdType pt3Id ) ; void IntegrateTetrahedron ( vtkDataSet * input , vtkUnstructuredGrid * output , vtkIdType cellId , vtkIdType pt1Id , vtkIdType pt2Id , vtkIdType pt3Id , vtkIdType pt4Id ) ; void IntegratePixel ( vtkDataSet * input , vtkUnstructuredGrid * output , vtkIdType cellId , vtkIdList * cellPtIds ) ; void IntegrateVoxel ( vtkDataSet * input , vtkUnstructuredGrid * output , vtkIdType cellId , vtkIdList * cellPtIds ) ; void IntegrateGeneral1DCell ( vtkDataSet * input , vtkUnstructuredGrid * output , vtkIdType cellId , vtkIdList * cellPtIds ) ; void IntegrateGeneral2DCell ( vtkDataSet * input , vtkUnstructuredGrid * output , vtkIdType cellId , vtkIdList * cellPtIds ) ; void IntegrateGeneral3DCell ( vtkDataSet * input , vtkUnstructuredGrid * output , vtkIdType cellId , vtkIdList * cellPtIds ) ; void IntegrateSatelliteData ( vtkDataSetAttributes * inda , vtkDataSetAttributes * outda ) ; void ZeroAttributes ( vtkDataSetAttributes * outda ) ; int PieceNodeMinToNode0 ( vtkUnstructuredGrid * data ) ; void SendPiece ( vtkUnstructuredGrid * src ) ; void ReceivePiece ( vtkUnstructuredGrid * mergeTo , int fromId ) ;  This function assumes the data is in the format of the output of this filter with one
##  point/cell having the value computed as its only tuple.  It divides each value by sum,
##  skipping the last data array if requested (so the volume doesn't get divided by itself
##  and set to 1). static void DivideDataArraysByConstant ( vtkDataSetAttributes * data , bool skipLastArray , double sum ) ; private : vtkIntegrateAttributes ( const vtkIntegrateAttributes & ) = delete ; void operator = ( const vtkIntegrateAttributes & ) = delete ; class vtkFieldList ; vtkFieldList * CellFieldList ; vtkFieldList * PointFieldList ; int FieldListIndex ; void AllocateAttributes ( vtkFieldList & fieldList , vtkDataSetAttributes * outda ) ; void ExecuteBlock ( vtkDataSet * input , vtkUnstructuredGrid * output , int fieldset_index , vtkFieldList & pdList , vtkFieldList & cdList ) ; void IntegrateData1 ( vtkDataSetAttributes * inda , vtkDataSetAttributes * outda , vtkIdType pt1Id , double k , vtkFieldList & fieldlist , int fieldlist_index ) ; void IntegrateData2 ( vtkDataSetAttributes * inda , vtkDataSetAttributes * outda , vtkIdType pt1Id , vtkIdType pt2Id , double k , vtkFieldList & fieldlist , int fieldlist_index ) ; void IntegrateData3 ( vtkDataSetAttributes * inda , vtkDataSetAttributes * outda , vtkIdType pt1Id , vtkIdType pt2Id , vtkIdType pt3Id , double k , vtkFieldList & fieldlist , int fieldlist_index ) ; void IntegrateData4 ( vtkDataSetAttributes * inda , vtkDataSetAttributes * outda , vtkIdType pt1Id , vtkIdType pt2Id , vtkIdType pt3Id , vtkIdType pt4Id , double k , vtkFieldList & fieldlist , int fieldlist_index ) ; public : enum CommunicationIds { IntegrateAttrInfo = 2000 , IntegrateAttrData } ; } ;
## Error: token expected: ; but got: [identifier]!!!
