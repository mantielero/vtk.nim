## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkUnstructuredGridGhostCellsGenerator.h
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
##  @class   vtkUnstructuredGridGhostCellsGenerator
##  @brief   Builds ghost cells for a distributed unstructured grid dataset.
##
##  This filter is a serial implementation of the vtkPUnstructuredGridGhostCellsGenerator
##  filter with the intent that it can be used in non-MPI builds. Both the serial and
##  parallel version act as a "pass-through" filter when run in serial. The combination
##  of these filters serves to unify the API for serial and parallel builds.
##
##  @sa
##  vtkPDistributedDataFilter
##  vtkPUnstructuredGridGhostCellsGenerator
##
##
##

## !!!Ignored construct:  # vtkUnstructuredGridGhostCellsGenerator_h [NewLine] # vtkUnstructuredGridGhostCellsGenerator_h [NewLine] # vtkDeprecation.h  For VTK_DEPRECATED_IN_9_1_0 # vtkFiltersParallelModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class vtkMultiProcessController ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkUnstructuredGrid"
discard "forward decl of vtkUnstructuredGridBase"
## !!!Ignored construct:  class VTK_DEPRECATED_IN_9_1_0 ( Use vtkGhostCellsGenerator instead ) VTKFILTERSPARALLEL_EXPORT vtkUnstructuredGridGhostCellsGenerator : public vtkUnstructuredGridAlgorithm { protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkUnstructuredGridGhostCellsGenerator :: IsTypeOf ( type ) ; } static vtkUnstructuredGridGhostCellsGenerator * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkUnstructuredGridGhostCellsGenerator * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkUnstructuredGridGhostCellsGenerator * NewInstance ( ) const { return vtkUnstructuredGridGhostCellsGenerator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkUnstructuredGridGhostCellsGenerator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkUnstructuredGridGhostCellsGenerator :: New ( ) ; } public : ; public : void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkUnstructuredGridGhostCellsGenerator * New ( ) ; /@{ *
##  Specify if the filter must take benefit of global point ids if they exist.
##  If false, point coordinates are used. Default is TRUE.
##  virtual void SetUseGlobalPointIds ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseGlobalPointIds  to  << _arg ) ; if ( this -> UseGlobalPointIds != _arg ) { this -> UseGlobalPointIds = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUseGlobalPointIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseGlobalPointIds  of  << this -> UseGlobalPointIds ) ; return this -> UseGlobalPointIds ; } ; virtual void UseGlobalPointIdsOn ( ) { this -> SetUseGlobalPointIds ( static_cast < bool > ( 1 ) ) ; } virtual void UseGlobalPointIdsOff ( ) { this -> SetUseGlobalPointIds ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the name of the global point ids data array if the GlobalIds
##  attribute array is not set. Default is "GlobalNodeIds".
##  virtual void SetGlobalPointIdsArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << GlobalPointIdsArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> GlobalPointIdsArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> GlobalPointIdsArrayName && _arg && ( ! strcmp ( this -> GlobalPointIdsArrayName , _arg ) ) ) { return ; } delete [ ] this -> GlobalPointIdsArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> GlobalPointIdsArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> GlobalPointIdsArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetGlobalPointIdsArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << GlobalPointIdsArrayName  of  << ( this -> GlobalPointIdsArrayName ? this -> GlobalPointIdsArrayName : (null) ) ) ; return this -> GlobalPointIdsArrayName ; } ; /@} /@{ *
##  Specify if the data has global cell ids.
##  If more than one layer of ghost cells is needed, global cell ids are
##  necessary. If global cell ids are not provided, they will be computed
##  internally.
##  If false, global cell ids will be computed, then deleted afterwards.
##  Default is FALSE.
##  virtual void SetUseGlobalPointIdsHasGlobalCellIds ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  HasGlobalCellIds  to  << _arg ) ; if ( this -> HasGlobalCellIds != _arg ) { this -> HasGlobalCellIds = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUseGlobalPointIdsHasGlobalCellIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HasGlobalCellIds  of  << this -> HasGlobalCellIds ) ; return this -> HasGlobalCellIds ; } ; virtual void HasGlobalCellIdsOn ( ) { this -> SetUseGlobalPointIdsHasGlobalCellIds ( static_cast < bool > ( 1 ) ) ; } virtual void HasGlobalCellIdsOff ( ) { this -> SetUseGlobalPointIdsHasGlobalCellIds ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify the name of the global cell ids data array if the GlobalIds
##  attribute array is not set. Default is "GlobalNodeIds".
##  virtual void SetGlobalPointIdsArrayNameGlobalCellIdsArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << GlobalCellIdsArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> GlobalCellIdsArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> GlobalCellIdsArrayName && _arg && ( ! strcmp ( this -> GlobalCellIdsArrayName , _arg ) ) ) { return ; } delete [ ] this -> GlobalCellIdsArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> GlobalCellIdsArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> GlobalCellIdsArrayName = nullptr ; } this -> Modified ( ) ; } ; virtual char * GetGlobalPointIdsArrayNameGlobalCellIdsArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << GlobalCellIdsArrayName  of  << ( this -> GlobalCellIdsArrayName ? this -> GlobalCellIdsArrayName : (null) ) ) ; return this -> GlobalCellIdsArrayName ; } ; /@} /@{ *
##  Specify if the filter must generate the ghost cells only if required by
##  the pipeline.
##  If false, ghost cells are computed even if they are not required.
##  Default is TRUE.
##  virtual void SetUseGlobalPointIdsHasGlobalCellIdsBuildIfRequired ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BuildIfRequired  to  << _arg ) ; if ( this -> BuildIfRequired != _arg ) { this -> BuildIfRequired = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUseGlobalPointIdsHasGlobalCellIdsBuildIfRequired ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BuildIfRequired  of  << this -> BuildIfRequired ) ; return this -> BuildIfRequired ; } ; virtual void BuildIfRequiredOn ( ) { this -> SetUseGlobalPointIdsHasGlobalCellIdsBuildIfRequired ( static_cast < bool > ( 1 ) ) ; } virtual void BuildIfRequiredOff ( ) { this -> SetUseGlobalPointIdsHasGlobalCellIdsBuildIfRequired ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  When BuildIfRequired is `false`, this can be used to set the minimum number
##  of ghost levels to generate. Note, if the downstream pipeline requests more
##  ghost levels than the number specified here, then the filter will generate
##  those extra ghost levels as needed. Accepted values are in the interval
##  [1, VTK_INT_MAX].
##  virtual void SetMinimumNumberOfGhostLevels ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << MinimumNumberOfGhostLevels  to  << _arg ) ; if ( this -> MinimumNumberOfGhostLevels != ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ) { this -> MinimumNumberOfGhostLevels = ( _arg < 1 ? 1 : ( _arg > VTK_INT_MAX ? VTK_INT_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetMinimumNumberOfGhostLevelsMinValue ( ) { return 1 ; } virtual int GetMinimumNumberOfGhostLevelsMaxValue ( ) { return VTK_INT_MAX ; } ; virtual int GetUseGlobalPointIdsHasGlobalCellIdsBuildIfRequiredMinimumNumberOfGhostLevels ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MinimumNumberOfGhostLevels  of  << this -> MinimumNumberOfGhostLevels ) ; return this -> MinimumNumberOfGhostLevels ; } ; /@} protected : vtkUnstructuredGridGhostCellsGenerator ( ) ; ~ vtkUnstructuredGridGhostCellsGenerator ( ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; char * GlobalPointIdsArrayName ; bool UseGlobalPointIds ; char * GlobalCellIdsArrayName ; bool HasGlobalCellIds ; bool BuildIfRequired ; int MinimumNumberOfGhostLevels ; private : vtkUnstructuredGridGhostCellsGenerator ( const vtkUnstructuredGridGhostCellsGenerator & ) = delete ; void operator = ( const vtkUnstructuredGridGhostCellsGenerator & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

##  VTK-HeaderTest-Exclude: vtkUnstructuredGridGhostCellsGenerator.h
