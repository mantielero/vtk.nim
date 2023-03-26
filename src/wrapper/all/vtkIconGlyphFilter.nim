## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkIconGlyphFilter.h
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
##  @class   vtkIconGlyphFilter
##  @brief   Filter that generates a polydata consisting of
##  quads with texture coordinates referring to a set of icons within a sheet
##  of icons.
##
##  vtkIconGlyphFilter takes in a vtkPointSet where each point corresponds to
##  the center of an icon. Scalar integer data must also be set to give each
##  point an icon index. This index is a zero based row major index into an
##  image that contains a grid of icons (each icon is the same size). You must
##  also specify 1) the size of the icon in the icon sheet (in pixels), 2) the
##  size of the icon sheet (in pixels), and 3) the display size of each icon
##  (again in display coordinates, or pixels).
##
##  Various other parameters are used to control how this data is combined. If
##  UseIconSize is true then the DisplaySize is ignored. If PassScalars is true,
##  then the scalar index information is passed to the output. Also, there is an
##  optional IconScale array which, if UseIconScaling is on, will scale each icon
##  independently.
##
##  @sa
##  vtkPolyDataAlgorithm vtkGlyph3D vtkGlyph2D
##

## !!!Ignored construct:  # vtkIconGlyphFilter_h [NewLine] # vtkIconGlyphFilter_h [NewLine] # vtkFiltersGeneralModule.h  For export macro # vtkPolyDataAlgorithm.h [NewLine] # VTK_ICON_GRAVITY_TOP_RIGHT 1 [NewLine] # VTK_ICON_GRAVITY_TOP_CENTER 2 [NewLine] # VTK_ICON_GRAVITY_TOP_LEFT 3 [NewLine] # VTK_ICON_GRAVITY_CENTER_RIGHT 4 [NewLine] # VTK_ICON_GRAVITY_CENTER_CENTER 5 [NewLine] # VTK_ICON_GRAVITY_CENTER_LEFT 6 [NewLine] # VTK_ICON_GRAVITY_BOTTOM_RIGHT 7 [NewLine] # VTK_ICON_GRAVITY_BOTTOM_CENTER 8 [NewLine] # VTK_ICON_GRAVITY_BOTTOM_LEFT 9 [NewLine] # VTK_ICON_SCALING_OFF 0 [NewLine] # VTK_ICON_SCALING_USE_SCALING_ARRAY 1 [NewLine] class VTKFILTERSGENERAL_EXPORT vtkIconGlyphFilter : public vtkPolyDataAlgorithm { public : /@{ *
##  Standard VTK methods.
##  static vtkIconGlyphFilter * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkPolyDataAlgorithm Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkPolyDataAlgorithm :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkIconGlyphFilter :: IsTypeOf ( type ) ; } static vtkIconGlyphFilter * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkIconGlyphFilter * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkIconGlyphFilter * NewInstance ( ) const { return vtkIconGlyphFilter :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkPolyDataAlgorithm :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkIconGlyphFilter :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkIconGlyphFilter :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; /@} /@{ *
##  Specify the Width and Height, in pixels, of an icon in the icon sheet.
##  virtual void SetIconSize ( int _arg1 , int _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << IconSize  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> IconSize [ 0 ] != _arg1 ) || ( this -> IconSize [ 1 ] != _arg2 ) ) { this -> IconSize [ 0 ] = _arg1 ; this -> IconSize [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetIconSize ( const int _arg [ 2 ] ) { this -> SetIconSize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual int * GetIconSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << IconSize  pointer  << this -> IconSize ) ; return this -> IconSize ; } VTK_WRAPEXCLUDE virtual void GetIconSize ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> IconSize [ i ] ; } } ; /@} /@{ *
##  Specify the Width and Height, in pixels, of an icon in the icon sheet.
##  virtual void SetIconSizeIconSheetSize ( int _arg1 , int _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << IconSheetSize  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> IconSheetSize [ 0 ] != _arg1 ) || ( this -> IconSheetSize [ 1 ] != _arg2 ) ) { this -> IconSheetSize [ 0 ] = _arg1 ; this -> IconSheetSize [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetIconSizeIconSheetSize ( const int _arg [ 2 ] ) { this -> SetIconSizeIconSheetSize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual int * GetIconSizeIconSheetSize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << IconSheetSize  pointer  << this -> IconSheetSize ) ; return this -> IconSheetSize ; } VTK_WRAPEXCLUDE virtual void GetIconSizeIconSheetSize ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> IconSheetSize [ i ] ; } } ; /@} /@{ *
##  Specify the Width and Height, in pixels, of the size of the icon when it
##  is rendered. By default, the IconSize is used to set the display size
##  (i.e., UseIconSize is true by default). Note that assumes that
##  IconScaling is disabled, or if enabled, the scale of a particular icon
##  is 1.
##  virtual void SetIconSizeIconSheetSizeDisplaySize ( int _arg1 , int _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << DisplaySize  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> DisplaySize [ 0 ] != _arg1 ) || ( this -> DisplaySize [ 1 ] != _arg2 ) ) { this -> DisplaySize [ 0 ] = _arg1 ; this -> DisplaySize [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetIconSizeIconSheetSizeDisplaySize ( const int _arg [ 2 ] ) { this -> SetIconSizeIconSheetSizeDisplaySize ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual int * GetIconSizeIconSheetSizeDisplaySize ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << DisplaySize  pointer  << this -> DisplaySize ) ; return this -> DisplaySize ; } VTK_WRAPEXCLUDE virtual void GetIconSizeIconSheetSizeDisplaySize ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> DisplaySize [ i ] ; } } ; /@} /@{ *
##  Specify whether the Quad generated to place the icon on will be either
##  the dimensions specified by IconSize or the DisplaySize.
##  virtual void SetUseIconSize ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  UseIconSize  to  << _arg ) ; if ( this -> UseIconSize != _arg ) { this -> UseIconSize = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUseIconSize ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << UseIconSize  of  << this -> UseIconSize ) ; return this -> UseIconSize ; } ; virtual void UseIconSizeOn ( ) { this -> SetUseIconSize ( static_cast < bool > ( 1 ) ) ; } virtual void UseIconSizeOff ( ) { this -> SetUseIconSize ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify how to specify individual icons. By default, icon scaling
##  is off, but if it is on, then the filter looks for an array named
##  "IconScale" to control individual icon size.
##  virtual void SetUseIconSizeIconScaling ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  IconScaling  to  << _arg ) ; if ( this -> IconScaling != _arg ) { this -> IconScaling = _arg ; this -> Modified ( ) ; } } ; virtual int GetUseIconSizeIconScaling ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << IconScaling  of  << this -> IconScaling ) ; return this -> IconScaling ; } ; void SetIconScalingToScalingOff ( ) { this -> SetIconScaling ( VTK_ICON_SCALING_OFF ) ; } void SetIconScalingToScalingArray ( ) { this -> SetIconScaling ( VTK_ICON_SCALING_USE_SCALING_ARRAY ) ; } /@} /@{ *
##  Specify whether to pass the scalar icon index to the output. By
##  default this is not passed since it can affect color during the
##  rendering process. Note that all other point data is passed to
##  the output regardless of the value of this flag.
##  virtual void SetUseIconSizeIconScalingPassScalars ( bool _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  PassScalars  to  << _arg ) ; if ( this -> PassScalars != _arg ) { this -> PassScalars = _arg ; this -> Modified ( ) ; } } ; virtual bool GetUseIconSizeIconScalingPassScalars ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << PassScalars  of  << this -> PassScalars ) ; return this -> PassScalars ; } ; virtual void PassScalarsOn ( ) { this -> SetUseIconSizePassScalars ( static_cast < bool > ( 1 ) ) ; } virtual void PassScalarsOff ( ) { this -> SetUseIconSizePassScalars ( static_cast < bool > ( 0 ) ) ; } ; /@} /@{ *
##  Specify if the input points define the center of the icon quad or one of
##  top right corner, top center, top left corner, center right, center, center
##  center left, bottom right corner, bottom center or bottom left corner.
##  virtual void SetUseIconSizeIconScalingPassScalarsGravity ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Gravity  to  << _arg ) ; if ( this -> Gravity != _arg ) { this -> Gravity = _arg ; this -> Modified ( ) ; } } ; virtual int GetUseIconSizeIconScalingPassScalarsGravity ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Gravity  of  << this -> Gravity ) ; return this -> Gravity ; } ; void SetGravityToTopRight ( ) { this -> SetGravity ( VTK_ICON_GRAVITY_TOP_RIGHT ) ; } void SetGravityToTopCenter ( ) { this -> SetGravity ( VTK_ICON_GRAVITY_TOP_CENTER ) ; } void SetGravityToTopLeft ( ) { this -> SetGravity ( VTK_ICON_GRAVITY_TOP_LEFT ) ; } void SetGravityToCenterRight ( ) { this -> SetGravity ( VTK_ICON_GRAVITY_CENTER_RIGHT ) ; } void SetGravityToCenterCenter ( ) { this -> SetGravity ( VTK_ICON_GRAVITY_CENTER_CENTER ) ; } void SetGravityToCenterLeft ( ) { this -> SetGravity ( VTK_ICON_GRAVITY_CENTER_LEFT ) ; } void SetGravityToBottomRight ( ) { this -> SetGravity ( VTK_ICON_GRAVITY_BOTTOM_RIGHT ) ; } void SetGravityToBottomCenter ( ) { this -> SetGravity ( VTK_ICON_GRAVITY_BOTTOM_CENTER ) ; } void SetGravityToBottomLeft ( ) { this -> SetGravity ( VTK_ICON_GRAVITY_BOTTOM_LEFT ) ; } /@} /@{ *
##  Specify an offset (in pixels or display coordinates) that offsets the icons
##  from their generating points.
##  virtual void SetIconSizeIconSheetSizeDisplaySizeOffset ( int _arg1 , int _arg2 ) { vtkDebugWithObjectMacro ( this , <<  setting  << Offset  to ( << _arg1 << , << _arg2 << ) ) ; if ( ( this -> Offset [ 0 ] != _arg1 ) || ( this -> Offset [ 1 ] != _arg2 ) ) { this -> Offset [ 0 ] = _arg1 ; this -> Offset [ 1 ] = _arg2 ; this -> Modified ( ) ; } } void SetIconSizeIconSheetSizeDisplaySizeOffset ( const int _arg [ 2 ] ) { this -> SetIconSizeIconSheetSizeDisplaySizeOffset ( _arg [ 0 ] , _arg [ 1 ] ) ; } ; virtual int * GetIconSizeIconSheetSizeDisplaySizeOffset ( ) VTK_SIZEHINT ( 2 ) { vtkDebugWithObjectMacro ( this , <<  returning  << Offset  pointer  << this -> Offset ) ; return this -> Offset ; } VTK_WRAPEXCLUDE virtual void GetIconSizeIconSheetSizeDisplaySizeOffset ( int data [ 2 ] ) { for ( int i = 0 ; i < 2 ; i ++ ) { data [ i ] = this -> Offset [ i ] ; } } ; /@} protected : vtkIconGlyphFilter ( ) ; ~ vtkIconGlyphFilter ( ) override ; int RequestData ( vtkInformation * , vtkInformationVector * * , vtkInformationVector * ) override ; int IconSize [ 2 ] ;  Size in pixels of an icon in an icon sheet int IconSheetSize [ 2 ] ;  Size in pixels of the icon sheet int DisplaySize [ 2 ] ;  Size in pixels of the icon when displayed int Gravity ; bool UseIconSize ; int IconScaling ; bool PassScalars ; int Offset [ 2 ] ; private : vtkIconGlyphFilter ( const vtkIconGlyphFilter & ) = delete ; void operator = ( const vtkIconGlyphFilter & ) = delete ; void IconConvertIndex ( int id , int & j , int & k ) ; } ;
## Error: token expected: ; but got: [identifier]!!!

proc IconConvertIndex*(id: cint; j: var cint; k: var cint) {.
    importcpp: "VTKFILTERSGENERAL_EXPORT::IconConvertIndex(@)",
    header: "vtkIconGlyphFilter.h".}