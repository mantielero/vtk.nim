## =========================================================================
##
##   Program: Visualization Toolkit
##   Module: vtkProStarReader.h
##
##   Copyright (c) Ken Martin, Will Schroeder, Bill Lorensen
##   All rights reserved.
##   See Copyright.txt or http://www.kitware.com/Copyright.htm for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE. See the above copyright notice for more information.
##
## =========================================================================
## *
##  @class   vtkProStarReader
##  @brief   Reads geometry in proSTAR (STARCD) file format.
##
##  vtkProStarReader creates an unstructured grid dataset.
##  It reads .cel/.vrt files stored in proSTAR (STARCD) ASCII format.
##
##  @par Thanks:
##  Reader written by Mark Olesen
##
##

## !!!Ignored construct:  # vtkProStarReader_h [NewLine] # vtkProStarReader_h [NewLine] # vtkIOGeometryModule.h  For export macro # vtkUnstructuredGridAlgorithm.h [NewLine] class VTKIOGEOMETRY_EXPORT vtkProStarReader : public vtkUnstructuredGridAlgorithm { public : static vtkProStarReader * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkUnstructuredGridAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkUnstructuredGridAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkProStarReader :: IsTypeOf ( type ) ; } static vtkProStarReader * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkProStarReader * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkProStarReader * NewInstance ( ) const { return vtkProStarReader :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkUnstructuredGridAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProStarReader :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProStarReader :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Specify the file name prefix of the cel/vrt files to read.
##  The reader will try to open FileName.cel and FileName.vrt files.
##  virtual void SetFileName ( VTK_FILEPATH const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << FileName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> FileName == nullptr && _arg == nullptr ) { return ; } if ( this -> FileName && _arg && ( ! strcmp ( this -> FileName , _arg ) ) ) { return ; } delete [ ] this -> FileName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> FileName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> FileName = nullptr ; } this -> Modified ( ) ; } ; virtual VTK_FILEPATH VTK_FUTURE_CONST char * GetFileName ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FileName  of  << ( this -> FileName ? this -> FileName : (null) ) ) ; return this -> FileName ; } ; /@} /@{ *
##  The proSTAR files are often in millimeters.
##  Specify an alternative scaling factor.
##  virtual void SetScaleFactor ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ScaleFactor  to  << _arg ) ; if ( this -> ScaleFactor != ( _arg < 0 ? 0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ) { this -> ScaleFactor = ( _arg < 0 ? 0 : ( _arg > VTK_DOUBLE_MAX ? VTK_DOUBLE_MAX : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetScaleFactorMinValue ( ) { return 0 ; } virtual double GetScaleFactorMaxValue ( ) { return VTK_DOUBLE_MAX ; } ; virtual double GetScaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ScaleFactor  of  << this -> ScaleFactor ) ; return this -> ScaleFactor ; } ; /@} *
##  The type of material represented by the cell
##  enum cellType { starcdFluidType = 1 , starcdSolidType = 2 , starcdBaffleType = 3 , starcdShellType = 4 , starcdLineType = 5 , starcdPointType = 6 } ; *
##  The primitive cell shape
##  enum shapeType { starcdPoint = 1 , starcdLine = 2 , starcdShell = 3 , starcdHex = 11 , starcdPrism = 12 , starcdTet = 13 , starcdPyr = 14 , starcdPoly = 255 } ; protected : vtkProStarReader ( ) ; ~ vtkProStarReader ( ) override ; int RequestInformation ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; *
##  The name of the file to be read.  If it has a .cel, .vrt, or .inp
##  extension it will be truncated and later appended when reading
##  the appropriate files.  Otherwise those extensions will be appended
##  to FileName when opening the files.
##  char * FileName ; *
##  The coordinates are multiplied by ScaleFactor when setting them.
##  The default value is 1.
##  double ScaleFactor ; private :
##  Internal Classes/Structures
##  struct idMapping ; FILE * OpenFile ( const char * ext ) ; bool ReadVrtFile ( vtkUnstructuredGrid * output , idMapping & pointMapping ) ; bool ReadCelFile ( vtkUnstructuredGrid * output , const idMapping & pointMapping ) ; vtkProStarReader ( const vtkProStarReader & ) = delete ; void operator = ( const vtkProStarReader & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
