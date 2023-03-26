## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkProteinRibbonFilter.h
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

## !!!Ignored construct:  # vtkProteinRibbonFilter_h [NewLine] # vtkProteinRibbonFilter_h [NewLine] *
##  @class   vtkProteinRibbonFilter
##  @brief   generates protein ribbons
##
##  vtkProteinRibbonFilter is a polydata algorithm that generates protein
##  ribbons.
##  # vtkDomainsChemistryModule.h  for export macro # vtkPolyDataAlgorithm.h [NewLine] # vtkColor.h  For vtkColor3ub. # < map >  For element to color map. [NewLine] class vtkVector3f ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkStringArray"
## !!!Ignored construct:  class VTKDOMAINSCHEMISTRY_EXPORT vtkProteinRibbonFilter : public vtkPolyDataAlgorithm { public : protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkProteinRibbonFilter :: IsTypeOf ( type ) ; } static vtkProteinRibbonFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkProteinRibbonFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkProteinRibbonFilter * NewInstance ( ) const { return vtkProteinRibbonFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkProteinRibbonFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkProteinRibbonFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; static vtkProteinRibbonFilter * New ( ) ; /@{ *
##  Width of the ribbon coil. Default is 0.3.
##  virtual float GetCoilWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << CoilWidth  of  << this -> CoilWidth ) ; return this -> CoilWidth ; } ; virtual void SetCoilWidth ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  CoilWidth  to  << _arg ) ; if ( this -> CoilWidth != _arg ) { this -> CoilWidth = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Width of the helix part of the ribbon. Default is 1.3.
##  virtual float GetCoilWidthHelixWidth ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << HelixWidth  of  << this -> HelixWidth ) ; return this -> HelixWidth ; } ; virtual void SetCoilWidthHelixWidth ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  HelixWidth  to  << _arg ) ; if ( this -> HelixWidth != _arg ) { this -> HelixWidth = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Smoothing factor of the ribbon. Default is 20.
##  virtual int GetCoilWidthHelixWidthSubdivideFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SubdivideFactor  of  << this -> SubdivideFactor ) ; return this -> SubdivideFactor ; } ; virtual void SetCoilWidthHelixWidthSubdivideFactor ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SubdivideFactor  to  << _arg ) ; if ( this -> SubdivideFactor != _arg ) { this -> SubdivideFactor = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  If enabled, small molecules (HETATMs) are drawn as spheres. Default is true.
##  virtual bool GetCoilWidthHelixWidthSubdivideFactorDrawSmallMoleculesAsSpheres ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << DrawSmallMoleculesAsSpheres  of  << this -> DrawSmallMoleculesAsSpheres ) ; return this -> DrawSmallMoleculesAsSpheres ; } ; virtual void SetCoilWidthHelixWidthSubdivideFactorDrawSmallMoleculesAsSpheres ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  DrawSmallMoleculesAsSpheres  to  << _arg ) ; if ( this -> DrawSmallMoleculesAsSpheres != _arg ) { this -> DrawSmallMoleculesAsSpheres = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Resolution of the spheres for small molecules. Default is 20.
##  virtual int GetCoilWidthHelixWidthSubdivideFactorDrawSmallMoleculesAsSpheresSphereResolution ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << SphereResolution  of  << this -> SphereResolution ) ; return this -> SphereResolution ; } ; virtual void SetCoilWidthHelixWidthSubdivideFactorDrawSmallMoleculesAsSpheresSphereResolution ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  SphereResolution  to  << _arg ) ; if ( this -> SphereResolution != _arg ) { this -> SphereResolution = _arg ; this -> Modified ( ) ; } } ; /@} protected : vtkProteinRibbonFilter ( ) ; ~ vtkProteinRibbonFilter ( ) override ; int FillInputPortInformation ( int , vtkInformation * ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; void CreateThinStrip ( vtkPolyData * poly , vtkUnsignedCharArray * pointsColors , vtkPoints * p , std :: vector < std :: pair < vtkVector3f , bool >> & p1 , std :: vector < std :: pair < vtkVector3f , bool >> & p2 , std :: vector < vtkColor3ub > & colors ) ; void CreateAtomAsSphere ( vtkPolyData * poly , vtkUnsignedCharArray * pointsColors , double * pos , const vtkColor3ub & color , float radius , float scale ) ; static std :: vector < vtkVector3f > * Subdivide ( std :: vector < std :: pair < vtkVector3f , bool >> & p , int div ) ; void SetColorByAtom ( std :: vector < vtkColor3ub > & colors , vtkStringArray * atomTypes ) ; void SetColorByStructure ( std :: vector < vtkColor3ub > & colors , vtkStringArray * atomTypes , vtkUnsignedCharArray * ss , const vtkColor3ub & helixColor , const vtkColor3ub & sheetColor ) ; std :: map < std :: string , vtkColor3ub > ElementColors ; float CoilWidth ; float HelixWidth ; int SphereResolution ; int SubdivideFactor ; bool DrawSmallMoleculesAsSpheres ; private : vtkProteinRibbonFilter ( const vtkProteinRibbonFilter & ) = delete ; void operator = ( const vtkProteinRibbonFilter & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
