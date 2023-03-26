## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkVolumeOutlineSource.h
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
##  @class   vtkVolumeOutlineSource
##  @brief   outline of volume cropping region
##
##  vtkVolumeOutlineSource generates a wireframe outline that corresponds
##  to the cropping region of a vtkVolumeMapper.  It requires a
##  vtkVolumeMapper as input.  The GenerateFaces option turns on the
##  solid faces of the outline, and the GenerateScalars option generates
##  color scalars.  When GenerateScalars is on, it is possible to set
##  an "ActivePlaneId" value in the range [0..6] to highlight one of the
##  six cropping planes.
##  @par Thanks:
##  Thanks to David Gobbi for contributing this class to VTK.
##

## !!!Ignored construct:  # vtkVolumeOutlineSource_h [NewLine] # vtkVolumeOutlineSource_h [NewLine] # vtkPolyDataAlgorithm.h [NewLine] # vtkRenderingVolumeModule.h  For export macro [NewLine] class vtkVolumeMapper ;
## Error: token expected: ; but got: [identifier]!!!

## !!!Ignored construct:  class VTKRENDERINGVOLUME_EXPORT vtkVolumeOutlineSource : public vtkPolyDataAlgorithm { public : static vtkVolumeOutlineSource * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkVolumeOutlineSource :: IsTypeOf ( type ) ; } static vtkVolumeOutlineSource * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkVolumeOutlineSource * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkVolumeOutlineSource * NewInstance ( ) const { return vtkVolumeOutlineSource :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkVolumeOutlineSource :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkVolumeOutlineSource :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Set the mapper that has the cropping region that the outline will
##  be generated for.  The mapper must have an input, because the
##  bounds of the data must be computed in order to generate the
##  outline.
##  virtual void SetVolumeMapper ( vtkVolumeMapper * mapper ) ; vtkVolumeMapper * GetVolumeMapper ( ) { return this -> VolumeMapper ; } /@} /@{ *
##  Set whether to generate color scalars for the output.  By default,
##  the output has no scalars and the color must be set in the
##  property of the actor.
##  virtual void SetGenerateScalars ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateScalars  to  << _arg ) ; if ( this -> GenerateScalars != _arg ) { this -> GenerateScalars = _arg ; this -> Modified ( ) ; } } ; virtual void GenerateScalarsOn ( ) { this -> SetGenerateScalars ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateScalarsOff ( ) { this -> SetGenerateScalars ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetGenerateScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateScalars  of  << this -> GenerateScalars ) ; return this -> GenerateScalars ; } ; /@} /@{ *
##  Set whether to generate an outline wherever an input face was
##  cut by a plane.  This is on by default.
##  virtual void SetGenerateScalarsGenerateOutline ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateOutline  to  << _arg ) ; if ( this -> GenerateOutline != _arg ) { this -> GenerateOutline = _arg ; this -> Modified ( ) ; } } ; virtual void GenerateOutlineOn ( ) { this -> SetGenerateScalarsGenerateOutline ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateOutlineOff ( ) { this -> SetGenerateScalarsGenerateOutline ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetGenerateScalarsGenerateOutline ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateOutline  of  << this -> GenerateOutline ) ; return this -> GenerateOutline ; } ; /@} /@{ *
##  Set whether to generate polygonal faces for the output.  By default,
##  only lines are generated.  The faces will form a closed, watertight
##  surface.
##  virtual void SetGenerateScalarsGenerateOutlineGenerateFaces ( vtkTypeBool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  GenerateFaces  to  << _arg ) ; if ( this -> GenerateFaces != _arg ) { this -> GenerateFaces = _arg ; this -> Modified ( ) ; } } ; virtual void GenerateFacesOn ( ) { this -> SetGenerateScalarsGenerateOutlineGenerateFaces ( static_cast < vtkTypeBool > ( 1 ) ) ; } virtual void GenerateFacesOff ( ) { this -> SetGenerateScalarsGenerateOutlineGenerateFaces ( static_cast < vtkTypeBool > ( 0 ) ) ; } ; virtual vtkTypeBool GetGenerateScalarsGenerateOutlineGenerateFaces ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << GenerateFaces  of  << this -> GenerateFaces ) ; return this -> GenerateFaces ; } ; /@} /@{ *
##  Set the color of the outline.  This has no effect unless GenerateScalars
##  is On.  The default color is red.
##  virtual void SetColor ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Color  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> Color [ 0 ] != _arg1 ) || ( this -> Color [ 1 ] != _arg2 ) || ( this -> Color [ 2 ] != _arg3 ) ) { this -> Color [ 0 ] = _arg1 ; this -> Color [ 1 ] = _arg2 ; this -> Color [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetColor ( const double _arg [ 3 ] ) { this -> SetColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Color  pointer  << this -> Color ) ; return this -> Color ; } VTK_WRAPEXCLUDE virtual void GetColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> Color [ 0 ] ; _arg2 = this -> Color [ 1 ] ; _arg3 = this -> Color [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << Color  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetColor ( double _arg [ 3 ] ) { this -> GetColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Set the active plane, e.g. to display which plane is currently being
##  modified by an interaction.  Set this to -1 if there is no active plane.
##  The default value is -1.
##  virtual void SetGenerateScalarsGenerateOutlineGenerateFacesActivePlaneId ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ActivePlaneId  to  << _arg ) ; if ( this -> ActivePlaneId != _arg ) { this -> ActivePlaneId = _arg ; this -> Modified ( ) ; } } ; virtual int GetGenerateScalarsGenerateOutlineGenerateFacesActivePlaneId ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ActivePlaneId  of  << this -> ActivePlaneId ) ; return this -> ActivePlaneId ; } ; /@} /@{ *
##  Set the color of the active cropping plane.  This has no effect unless
##  GenerateScalars is On and ActivePlaneId is non-negative.  The default
##  color is yellow.
##  virtual void SetColorActivePlaneColor ( double _arg1 , double _arg2 , double _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << ActivePlaneColor  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> ActivePlaneColor [ 0 ] != _arg1 ) || ( this -> ActivePlaneColor [ 1 ] != _arg2 ) || ( this -> ActivePlaneColor [ 2 ] != _arg3 ) ) { this -> ActivePlaneColor [ 0 ] = _arg1 ; this -> ActivePlaneColor [ 1 ] = _arg2 ; this -> ActivePlaneColor [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetColorActivePlaneColor ( const double _arg [ 3 ] ) { this -> SetColorActivePlaneColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual double * GetColorActivePlaneColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << ActivePlaneColor  pointer  << this -> ActivePlaneColor ) ; return this -> ActivePlaneColor ; } VTK_WRAPEXCLUDE virtual void GetColorActivePlaneColor ( double & _arg1 , double & _arg2 , double & _arg3 ) { _arg1 = this -> ActivePlaneColor [ 0 ] ; _arg2 = this -> ActivePlaneColor [ 1 ] ; _arg3 = this -> ActivePlaneColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << ActivePlaneColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetColorActivePlaneColor ( double _arg [ 3 ] ) { this -> GetColorActivePlaneColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} protected : vtkVolumeOutlineSource ( ) ; ~ vtkVolumeOutlineSource ( ) override ; vtkVolumeMapper * VolumeMapper ; vtkTypeBool GenerateScalars ; vtkTypeBool GenerateOutline ; vtkTypeBool GenerateFaces ; int ActivePlaneId ; double Color [ 3 ] ; double ActivePlaneColor [ 3 ] ; int Cropping ; int CroppingRegionFlags ; double Bounds [ 6 ] ; double CroppingRegionPlanes [ 6 ] ; static int ComputeCubePlanes ( double planes [ 3 ] [ 4 ] , double croppingPlanes [ 6 ] , double bounds [ 6 ] ) ; static void GeneratePolys ( vtkCellArray * polys , vtkUnsignedCharArray * scalars , unsigned char colors [ 2 ] [ 3 ] , int activePlane , int flags , int tolPtId [ 3 ] [ 4 ] ) ; static void GenerateLines ( vtkCellArray * lines , vtkUnsignedCharArray * scalars , unsigned char colors [ 2 ] [ 3 ] , int activePlane , int flags , int tolPtId [ 3 ] [ 4 ] ) ; static void GeneratePoints ( vtkPoints * points , vtkCellArray * lines , vtkCellArray * polys , double planes [ 3 ] [ 4 ] , double tol ) ; static void NudgeCropPlanesToBounds ( int tolPtId [ 3 ] [ 4 ] , double planes [ 3 ] [ 4 ] , double tol ) ; static void CreateColorValues ( unsigned char colors [ 2 ] [ 3 ] , double color1 [ 3 ] , double color2 [ 3 ] ) ; int ComputePipelineMTime ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector , int requestFromOutputPort , vtkMTimeType * mtime ) override ; int RequestInformation ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; int RequestData ( vtkInformation * request , vtkInformationVector * * inputVector , vtkInformationVector * outputVector ) override ; private : vtkVolumeOutlineSource ( const vtkVolumeOutlineSource & ) = delete ; void operator = ( const vtkVolumeOutlineSource & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
