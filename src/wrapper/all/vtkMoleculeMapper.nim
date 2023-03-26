## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkMoleculeMapper.h
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
##  @class   vtkMoleculeMapper
##  @brief   Mapper that draws vtkMolecule objects
##
##
##  vtkMoleculeMapper uses glyphs (display lists) to quickly render a
##  molecule.
##

## !!!Ignored construct:  # vtkMoleculeMapper_h [NewLine] # vtkMoleculeMapper_h [NewLine] # vtkDomainsChemistryModule.h  For export macro # vtkMapper.h [NewLine] # vtkNew.h  For vtkNew [NewLine] class vtkActor ;
## Error: token expected: ; but got: [identifier]!!!

discard "forward decl of vtkGlyph3DMapper"
discard "forward decl of vtkIdTypeArray"
discard "forward decl of vtkMolecule"
discard "forward decl of vtkPeriodicTable"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper"
discard "forward decl of vtkRenderer"
discard "forward decl of vtkSelection"
discard "forward decl of vtkSphereSource"
discard "forward decl of vtkTrivialProducer"
## !!!Ignored construct:  class VTKDOMAINSCHEMISTRY_EXPORT vtkMoleculeMapper : public vtkMapper { public : static vtkMoleculeMapper * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkMapper Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkMapper :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkMoleculeMapper :: IsTypeOf ( type ) ; } static vtkMoleculeMapper * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkMoleculeMapper * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkMoleculeMapper * NewInstance ( ) const { return vtkMoleculeMapper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkMoleculeMapper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkMoleculeMapper :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@{ *
##  Get/Set the input vtkMolecule.
##  void SetInputData ( vtkMolecule * in ) ; vtkMolecule * GetInput ( ) ; /@} *
##  Set ivars to default ball-and-stick settings. This is equivalent
##  to the following:
##  - SetRenderAtoms( true )
##  - SetRenderBonds( true )
##  - SetAtomicRadiusType( VDWRadius )
##  - SetAtomicRadiusScaleFactor( 0.3 )
##  - SetBondColorMode( DiscreteByAtom )
##  - SetUseMultiCylindersForBonds( true )
##  - SetBondRadius( 0.075 )
##  void UseBallAndStickSettings ( ) ; *
##  Set ivars to default van der Waals spheres settings. This is
##  equivalent to the following:
##  - SetRenderAtoms( true )
##  - SetRenderBonds( true )
##  - SetAtomicRadiusType( VDWRadius )
##  - SetAtomicRadiusScaleFactor( 1.0 )
##  - SetBondColorMode( DiscreteByAtom )
##  - SetUseMultiCylindersForBonds( true )
##  - SetBondRadius( 0.075 )
##  void UseVDWSpheresSettings ( ) ; *
##  Set ivars to default liquorice stick settings. This is
##  equivalent to the following:
##  - SetRenderAtoms( true )
##  - SetRenderBonds( true )
##  - SetAtomicRadiusType( UnitRadius )
##  - SetAtomicRadiusScaleFactor( 0.1 )
##  - SetBondColorMode( DiscreteByAtom )
##  - SetUseMultiCylindersForBonds( false )
##  - SetBondRadius( 0.1 )
##  void UseLiquoriceStickSettings ( ) ; *
##  Set ivars to use fast settings that may be useful for rendering
##  extremely large molecules where the overall shape is more
##  important than the details of the atoms/bond. This is equivalent
##  to the following:
##  - SetRenderAtoms( true )
##  - SetRenderBonds( true )
##  - SetAtomicRadiusType( UnitRadius )
##  - SetAtomicRadiusScaleFactor( 0.60 )
##  - SetBondColorMode( SingleColor )
##  - SetBondColor( 50, 50, 50 )
##  - SetUseMultiCylindersForBonds( false )
##  - SetBondRadius( 0.075 )
##  void UseFastSettings ( ) ; /@{ *
##  Get/Set whether or not to render atoms. Default: On.
##  virtual bool GetRenderAtoms ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RenderAtoms  of  << this -> RenderAtoms ) ; return this -> RenderAtoms ; } ; virtual void SetRenderAtoms ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RenderAtoms  to  << _arg ) ; if ( this -> RenderAtoms != _arg ) { this -> RenderAtoms = _arg ; this -> Modified ( ) ; } } ; virtual void RenderAtomsOn ( ) { this -> SetRenderAtoms ( static_cast < bool > ( 1 ) ) ; } virtual void RenderAtomsOff ( ) { this -> SetRenderAtoms ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Get/Set whether or not to render bonds. Default: On.
##  virtual bool GetRenderAtomsRenderBonds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RenderBonds  of  << this -> RenderBonds ) ; return this -> RenderBonds ; } ; virtual void SetRenderAtomsRenderBonds ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RenderBonds  to  << _arg ) ; if ( this -> RenderBonds != _arg ) { this -> RenderBonds = _arg ; this -> Modified ( ) ; } } ; virtual void RenderBondsOn ( ) { this -> SetRenderAtomsRenderBonds ( static_cast < bool > ( 1 ) ) ; } virtual void RenderBondsOff ( ) { this -> SetRenderAtomsRenderBonds ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Get/Set whether or not to render the unit cell lattice, if present.
##  Default: On.
##  virtual bool GetRenderAtomsRenderBondsRenderLattice ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << RenderLattice  of  << this -> RenderLattice ) ; return this -> RenderLattice ; } ; virtual void SetRenderAtomsRenderBondsRenderLattice ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  RenderLattice  to  << _arg ) ; if ( this -> RenderLattice != _arg ) { this -> RenderLattice = _arg ; this -> Modified ( ) ; } } ; virtual void RenderLatticeOn ( ) { this -> SetRenderAtomsRenderBondsRenderLattice ( static_cast < bool > ( 1 ) ) ; } virtual void RenderLatticeOff ( ) { this -> SetRenderAtomsRenderBondsRenderLattice ( static_cast < bool > ( 0 ) ) ; } ; /@} enum { CovalentRadius = 0 , VDWRadius , UnitRadius , CustomArrayRadius } ; /@{ *
##  Get/Set the type of radius used to generate the atoms. Default:
##  VDWRadius. If CustomArrayRadius is used, the VertexData array named
##  'radii' is used for per-atom radii.
##  virtual int GetRenderAtomsRenderBondsRenderLatticeAtomicRadiusType ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AtomicRadiusType  of  << this -> AtomicRadiusType ) ; return this -> AtomicRadiusType ; } ; virtual void SetRenderAtomsRenderBondsRenderLatticeAtomicRadiusType ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AtomicRadiusType  to  << _arg ) ; if ( this -> AtomicRadiusType != _arg ) { this -> AtomicRadiusType = _arg ; this -> Modified ( ) ; } } ; const char * GetAtomicRadiusTypeAsString ( ) ; void SetAtomicRadiusTypeToCovalentRadius ( ) { this -> SetAtomicRadiusType ( CovalentRadius ) ; } void SetAtomicRadiusTypeToVDWRadius ( ) { this -> SetAtomicRadiusType ( VDWRadius ) ; } void SetAtomicRadiusTypeToUnitRadius ( ) { this -> SetAtomicRadiusType ( UnitRadius ) ; } void SetAtomicRadiusTypeToCustomArrayRadius ( ) { this -> SetAtomicRadiusType ( CustomArrayRadius ) ; } /@} /@{ *
##  Get/Set the uniform scaling factor applied to the atoms.
##  This is ignored when AtomicRadiusType == CustomArrayRadius.
##  Default: 0.3.
##  virtual float GetRenderAtomsRenderBondsRenderLatticeAtomicRadiusTypeAtomicRadiusScaleFactor ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AtomicRadiusScaleFactor  of  << this -> AtomicRadiusScaleFactor ) ; return this -> AtomicRadiusScaleFactor ; } ; virtual void SetRenderAtomsRenderBondsRenderLatticeAtomicRadiusTypeAtomicRadiusScaleFactor ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  AtomicRadiusScaleFactor  to  << _arg ) ; if ( this -> AtomicRadiusScaleFactor != _arg ) { this -> AtomicRadiusScaleFactor = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Get/Set whether multicylinders will be used to represent multiple
##  bonds. Default: On.
##  virtual bool GetRenderAtomsRenderBondsRenderLatticeAtomicRadiusTypeAtomicRadiusScaleFactorUseMultiCylindersForBonds ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseMultiCylindersForBonds  of  << this -> UseMultiCylindersForBonds ) ; return this -> UseMultiCylindersForBonds ; } ; virtual void SetRenderAtomsRenderBondsRenderLatticeAtomicRadiusTypeAtomicRadiusScaleFactorUseMultiCylindersForBonds ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseMultiCylindersForBonds  to  << _arg ) ; if ( this -> UseMultiCylindersForBonds != _arg ) { this -> UseMultiCylindersForBonds = _arg ; this -> Modified ( ) ; } } ; virtual void UseMultiCylindersForBondsOn ( ) { this -> SetRenderAtomsRenderBondsRenderLatticeUseMultiCylindersForBonds ( static_cast < bool > ( 1 ) ) ; } virtual void UseMultiCylindersForBondsOff ( ) { this -> SetRenderAtomsRenderBondsRenderLatticeUseMultiCylindersForBonds ( static_cast < bool > ( 0 ) ) ; } ; /@} enum { SingleColor = 0 , DiscreteByAtom } ; /@{ *
##  Get/Set the method by which bonds are colored.
##
##  If 'SingleColor' is used, all bonds will be the same color. Use
##  SetBondColor to set the rgb values used.
##
##  If 'DiscreteByAtom' is selected, each bond is colored using the
##  same lookup table as the atoms at each end, with a sharp color
##  boundary at the bond center.
##  virtual int GetRenderAtomsRenderBondsRenderLatticeAtomicRadiusTypeAtomicRadiusScaleFactorUseMultiCylindersForBondsBondColorMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BondColorMode  of  << this -> BondColorMode ) ; return this -> BondColorMode ; } ; virtual void SetBondColorMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << BondColorMode  to  << _arg ) ; if ( this -> BondColorMode != ( _arg < SingleColor ? SingleColor : ( _arg > DiscreteByAtom ? DiscreteByAtom : _arg ) ) ) { this -> BondColorMode = ( _arg < SingleColor ? SingleColor : ( _arg > DiscreteByAtom ? DiscreteByAtom : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetBondColorModeMinValue ( ) { return SingleColor ; } virtual int GetBondColorModeMaxValue ( ) { return DiscreteByAtom ; } ; void SetBondColorModeToSingleColor ( ) { this -> SetBondColorMode ( SingleColor ) ; } void SetBondColorModeToDiscreteByAtom ( ) { this -> SetBondColorMode ( DiscreteByAtom ) ; } const char * GetBondColorModeAsString ( ) ; /@} /@{ *
##  Get/Set the method by which atoms are colored.
##
##  If 'SingleColor' is used, all atoms will have the same color. Use
##  SetAtomColor to set the rgb values to be used.
##
##  If 'DiscreteByAtom' is selected, each atom is colored using the
##  internal lookup table.
##  virtual int GetRenderAtomsRenderBondsRenderLatticeAtomicRadiusTypeAtomicRadiusScaleFactorUseMultiCylindersForBondsBondColorModeAtomColorMode ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << AtomColorMode  of  << this -> AtomColorMode ) ; return this -> AtomColorMode ; } ; virtual void SetBondColorModeAtomColorMode ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << AtomColorMode  to  << _arg ) ; if ( this -> AtomColorMode != ( _arg < SingleColor ? SingleColor : ( _arg > DiscreteByAtom ? DiscreteByAtom : _arg ) ) ) { this -> AtomColorMode = ( _arg < SingleColor ? SingleColor : ( _arg > DiscreteByAtom ? DiscreteByAtom : _arg ) ) ; this -> Modified ( ) ; } } virtual int GetBondColorModeMinValueAtomColorModeMinValue ( ) { return SingleColor ; } virtual int GetBondColorModeMaxValueAtomColorModeMaxValue ( ) { return DiscreteByAtom ; } ; /@} /@{ *
##  Get/Set the color of the atoms as an rgb tuple.
##  Default: {150, 150, 150} (grey)
##  virtual unsigned char * GetAtomColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << AtomColor  pointer  << this -> AtomColor ) ; return this -> AtomColor ; } VTK_WRAPEXCLUDE virtual void GetAtomColor ( unsigned char & _arg1 , unsigned char & _arg2 , unsigned char & _arg3 ) { _arg1 = this -> AtomColor [ 0 ] ; _arg2 = this -> AtomColor [ 1 ] ; _arg3 = this -> AtomColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << AtomColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetAtomColor ( unsigned char _arg [ 3 ] ) { this -> GetAtomColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual void SetAtomColor ( unsigned char _arg1 , unsigned char _arg2 , unsigned char _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << AtomColor  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> AtomColor [ 0 ] != _arg1 ) || ( this -> AtomColor [ 1 ] != _arg2 ) || ( this -> AtomColor [ 2 ] != _arg3 ) ) { this -> AtomColor [ 0 ] = _arg1 ; this -> AtomColor [ 1 ] = _arg2 ; this -> AtomColor [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetAtomColor ( const unsigned char _arg [ 3 ] ) { this -> SetAtomColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Get/Set the color of the bonds as an rgb tuple.
##  Default: {50, 50, 50} (dark grey)
##  virtual unsigned char * GetAtomColorBondColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << BondColor  pointer  << this -> BondColor ) ; return this -> BondColor ; } VTK_WRAPEXCLUDE virtual void GetAtomColorBondColor ( unsigned char & _arg1 , unsigned char & _arg2 , unsigned char & _arg3 ) { _arg1 = this -> BondColor [ 0 ] ; _arg2 = this -> BondColor [ 1 ] ; _arg3 = this -> BondColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << BondColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetAtomColorBondColor ( unsigned char _arg [ 3 ] ) { this -> GetAtomColorBondColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual void SetAtomColorBondColor ( unsigned char _arg1 , unsigned char _arg2 , unsigned char _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << BondColor  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> BondColor [ 0 ] != _arg1 ) || ( this -> BondColor [ 1 ] != _arg2 ) || ( this -> BondColor [ 2 ] != _arg3 ) ) { this -> BondColor [ 0 ] = _arg1 ; this -> BondColor [ 1 ] = _arg2 ; this -> BondColor [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetAtomColorBondColor ( const unsigned char _arg [ 3 ] ) { this -> SetAtomColorBondColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Get/Set the radius of the bond cylinders. Default: 0.075
##  virtual float GetRenderAtomsRenderBondsRenderLatticeAtomicRadiusTypeAtomicRadiusScaleFactorUseMultiCylindersForBondsBondColorModeAtomColorModeBondRadius ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << BondRadius  of  << this -> BondRadius ) ; return this -> BondRadius ; } ; virtual void SetRenderAtomsRenderBondsRenderLatticeAtomicRadiusTypeAtomicRadiusScaleFactorUseMultiCylindersForBondsBondRadius ( float _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  BondRadius  to  << _arg ) ; if ( this -> BondRadius != _arg ) { this -> BondRadius = _arg ; this -> Modified ( ) ; } } ; /@} /@{ *
##  Get/Set the color of the bonds as an rgb tuple.
##  Default: {255, 255, 255} (white)
##  virtual unsigned char * GetAtomColorBondColorLatticeColor ( ) VTK_SIZEHINT ( 3 ) { vtkDebugWithObjectMacro ( this , <<  returning  << LatticeColor  pointer  << this -> LatticeColor ) ; return this -> LatticeColor ; } VTK_WRAPEXCLUDE virtual void GetAtomColorBondColorLatticeColor ( unsigned char & _arg1 , unsigned char & _arg2 , unsigned char & _arg3 ) { _arg1 = this -> LatticeColor [ 0 ] ; _arg2 = this -> LatticeColor [ 1 ] ; _arg3 = this -> LatticeColor [ 2 ] ; vtkDebugWithObjectMacro ( this , <<  returning  << LatticeColor  = ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; } VTK_WRAPEXCLUDE virtual void GetAtomColorBondColorLatticeColor ( unsigned char _arg [ 3 ] ) { this -> GetAtomColorBondColorLatticeColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; virtual void SetAtomColorBondColorLatticeColor ( unsigned char _arg1 , unsigned char _arg2 , unsigned char _arg3 ) { vtkDebugWithObjectMacro ( this , <<  setting  << LatticeColor  to ( << _arg1 << , << _arg2 << , << _arg3 << ) ) ; if ( ( this -> LatticeColor [ 0 ] != _arg1 ) || ( this -> LatticeColor [ 1 ] != _arg2 ) || ( this -> LatticeColor [ 2 ] != _arg3 ) ) { this -> LatticeColor [ 0 ] = _arg1 ; this -> LatticeColor [ 1 ] = _arg2 ; this -> LatticeColor [ 2 ] = _arg3 ; this -> Modified ( ) ; } } virtual void SetAtomColorBondColorLatticeColor ( const unsigned char _arg [ 3 ] ) { this -> SetAtomColorBondColorLatticeColor ( _arg [ 0 ] , _arg [ 1 ] , _arg [ 2 ] ) ; } ; /@} /@{ *
##  Extract the ids atoms and/or bonds rendered by this molecule from a
##  vtkSelection object. The vtkIdTypeArray
##  virtual void GetSelectedAtomsAndBonds ( vtkSelection * selection , vtkIdTypeArray * atomIds , vtkIdTypeArray * bondIds ) ; virtual void GetSelectedAtoms ( vtkSelection * selection , vtkIdTypeArray * atomIds ) { this -> GetSelectedAtomsAndBonds ( selection , atomIds , nullptr ) ; } virtual void GetSelectedBonds ( vtkSelection * selection , vtkIdTypeArray * bondIds ) { this -> GetSelectedAtomsAndBonds ( selection , nullptr , bondIds ) ; } /@} /@{ *
##  Reimplemented from base class
##  void Render ( vtkRenderer * , vtkActor * ) override ; void ReleaseGraphicsResources ( vtkWindow * ) override ; double * GetBounds ( ) override ; void GetBounds ( double bounds [ 6 ] ) override { vtkAbstractMapper3D :: GetBounds ( bounds ) ; } int FillInputPortInformation ( int port , vtkInformation * info ) override ; bool GetSupportsSelection ( ) override { return true ; } /@} /@{ *
##  Get/Set the atomic radius array name. Default: "radii"
##  It is only used when AtomicRadiusType is set to CustomArrayRadius.
##  virtual char * GetAtomicRadiusArrayName ( ) { vtkDebugWithObjectMacro ( this , <<  returning  << AtomicRadiusArrayName  of  << ( this -> AtomicRadiusArrayName ? this -> AtomicRadiusArrayName : (null) ) ) ; return this -> AtomicRadiusArrayName ; } ; virtual void SetAtomicRadiusArrayName ( const char * _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << AtomicRadiusArrayName  to  << ( _arg ? _arg : (null) ) ) ; if ( this -> AtomicRadiusArrayName == nullptr && _arg == nullptr ) { return ; } if ( this -> AtomicRadiusArrayName && _arg && ( ! strcmp ( this -> AtomicRadiusArrayName , _arg ) ) ) { return ; } delete [ ] this -> AtomicRadiusArrayName ; if ( _arg ) { size_t n = strlen ( _arg ) + 1 ; char * cp1 = new char [ n ] ; const char * cp2 = ( _arg ) ; this -> AtomicRadiusArrayName = cp1 ; do { * cp1 ++ = * cp2 ++ ; } while ( -- n ) ; } else { this -> AtomicRadiusArrayName = nullptr ; } this -> Modified ( ) ; } ; /@} *
##  Helper method to set ScalarMode on both AtomGlyphMapper and BondGlyphMapper.
##  true means VTK_COLOR_MODE_MAP_SCALARS, false VTK_COLOR_MODE_DIRECT_SCALARS.
##  virtual void SetMapScalars ( bool map ) ; *
##  Accessor to internal structure. This is exposed to make it available for ray tracers.
##  vtkPeriodicTable * GetPeriodicTable ( ) { return this -> PeriodicTable ; } protected : vtkMoleculeMapper ( ) ; ~ vtkMoleculeMapper ( ) override ; /@{ *
##  Customize atom rendering
##  bool RenderAtoms ; int AtomicRadiusType ; float AtomicRadiusScaleFactor ; char * AtomicRadiusArrayName ; int AtomColorMode ; unsigned char AtomColor [ 3 ] ; /@} /@{ *
##  Customize bond rendering
##  bool RenderBonds ; int BondColorMode ; bool UseMultiCylindersForBonds ; float BondRadius ; unsigned char BondColor [ 3 ] ; /@} bool RenderLattice ; *
##  Internal render methods
##  void GlyphRender ( vtkRenderer * ren , vtkActor * act ) ; /@{ *
##  Cached variables and update methods
##  vtkNew < vtkPolyData > AtomGlyphPolyData ; vtkNew < vtkTrivialProducer > AtomGlyphPointOutput ; vtkNew < vtkPolyData > BondGlyphPolyData ; vtkNew < vtkTrivialProducer > BondGlyphPointOutput ; bool GlyphDataInitialized ; virtual void UpdateGlyphPolyData ( ) ; virtual void UpdateAtomGlyphPolyData ( ) ; virtual void UpdateBondGlyphPolyData ( ) ; /@} /@{ *
##  Internal mappers
##  vtkNew < vtkGlyph3DMapper > AtomGlyphMapper ; vtkNew < vtkGlyph3DMapper > BondGlyphMapper ; /@} unsigned char LatticeColor [ 3 ] ; vtkNew < vtkPolyData > LatticePolyData ; vtkNew < vtkPolyDataMapper > LatticeMapper ; virtual void UpdateLatticePolyData ( ) ; *
##  Periodic table for lookups
##  vtkNew < vtkPeriodicTable > PeriodicTable ; private : vtkMoleculeMapper ( const vtkMoleculeMapper & ) = delete ; void operator = ( const vtkMoleculeMapper & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
