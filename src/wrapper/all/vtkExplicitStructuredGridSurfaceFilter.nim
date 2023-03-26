## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkExplicitStructuredGridSurfaceFilter.h
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
##  @class   vtkExplicitStructuredGridSurfaceFilter
##  @brief   Filter which creates a surface (polydata) from an explicit structured grid.
##

## !!!Ignored construct:  # vtkExplicitStructuredGridSurfaceFilter_h [NewLine] # vtkExplicitStructuredGridSurfaceFilter_h [NewLine] # vtkFiltersGeometryModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] class vtkExplicitStructuredGrid ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkMultiProcessController"
## !!!Ignored construct:  class VTKFILTERSGEOMETRY_EXPORT vtkExplicitStructuredGridSurfaceFilter : public vtkPolyDataAlgorithm { public : static vtkExplicitStructuredGridSurfaceFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkExplicitStructuredGridSurfaceFilter :: IsTypeOf ( type ) ; } static vtkExplicitStructuredGridSurfaceFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkExplicitStructuredGridSurfaceFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkExplicitStructuredGridSurfaceFilter * NewInstance ( ) const { return vtkExplicitStructuredGridSurfaceFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkExplicitStructuredGridSurfaceFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkExplicitStructuredGridSurfaceFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  If on, the output polygonal dataset will have a celldata array that
##  holds the cell index of the original 3D cell that produced each output
##  cell. This is useful for cell picking. The default is off to conserve
##  memory. Note that PassThroughCellIds will be ignored if UseStrips is on,
##  since in that case each tringle strip can represent more than on of the
##  input cells.
##  virtual void SetPassThroughCellIds ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassThroughCellIds  to  << _arg ) ; if ( this -> PassThroughCellIds != _arg ) { this -> PassThroughCellIds = _arg ; this -> Modified ( ) ; } } ; virtual int GetPassThroughCellIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassThroughCellIds  of  << this -> PassThroughCellIds ) ; return this -> PassThroughCellIds ; } ; virtual void PassThroughCellIdsOn ( ) { this -> SetPassThroughCellIds ( static_cast < int > ( 1 ) ) ; } virtual void PassThroughCellIdsOff ( ) { this -> SetPassThroughCellIds ( static_cast < int > ( 0 ) ) ; } ; virtual void SetPassThroughCellIdsPassThroughPointIds ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassThroughPointIds  to  << _arg ) ; if ( this -> PassThroughPointIds != _arg ) { this -> PassThroughPointIds = _arg ; this -> Modified ( ) ; } } ; virtual int GetPassThroughCellIdsPassThroughPointIds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassThroughPointIds  of  << this -> PassThroughPointIds ) ; return this -> PassThroughPointIds ; } ; virtual void PassThroughPointIdsOn ( ) { this -> SetPassThroughCellIdsPassThroughPointIds ( static_cast < int > ( 1 ) ) ; } virtual void PassThroughPointIdsOff ( ) { this -> SetPassThroughCellIdsPassThroughPointIds ( static_cast < int > ( 0 ) ) ; } ; /@} /@{ *
##  If PassThroughCellIds or PassThroughPointIds is on, then these ivars
##  control the name given to the field in which the ids are written into.  If
##  set to NULL, then vtkOriginalCellIds or vtkOriginalPointIds (the default)
##  is used, respectively.
##  virtual void SetOriginalCellIdsName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OriginalCellIdsName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> OriginalCellIdsName == nullptr && _arg == nullptr ) { return ; } if ( this -> OriginalCellIdsName && _arg && ( ! strcmp ( this -> OriginalCellIdsName , _arg ) ) ) { return ; } delete [ ] this -> OriginalCellIdsName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> OriginalCellIdsName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> OriginalCellIdsName = nullptr ; } this -> Modified ( ) ; } ; virtual const char * GetOriginalCellIdsName ( ) { return ( this -> OriginalCellIdsName ? this -> OriginalCellIdsName : vtkOriginalCellIds ) ; } virtual void SetOriginalCellIdsNameOriginalPointIdsName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << OriginalPointIdsName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> OriginalPointIdsName == nullptr && _arg == nullptr ) { return ; } if ( this -> OriginalPointIdsName && _arg && ( ! strcmp ( this -> OriginalPointIdsName , _arg ) ) ) { return ; } delete [ ] this -> OriginalPointIdsName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> OriginalPointIdsName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> OriginalPointIdsName = nullptr ; } this -> Modified ( ) ; } ; virtual const char * GetOriginalPointIdsName ( ) { return ( this -> OriginalPointIdsName ? this -> OriginalPointIdsName : vtkOriginalPointIds ) ; } /@} protected : vtkExplicitStructuredGridSurfaceFilter ( ) ; ~ vtkExplicitStructuredGridSurfaceFilter ( ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestUpdateExtent ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; int ExtractSurface ( vtkExplicitStructuredGrid * , vtkPolyData * ) ;  Helper methods. int PieceInvariant ; int PassThroughCellIds ; char * OriginalCellIdsName ; int PassThroughPointIds ; char * OriginalPointIdsName ; int WholeExtent [ 6 ] ; private : vtkExplicitStructuredGridSurfaceFilter ( const vtkExplicitStructuredGridSurfaceFilter & ) = delete ; void operator = ( const vtkExplicitStructuredGridSurfaceFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
