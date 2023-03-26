## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFixedPointVolumeRayCastHelper.h
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
##  @class   vtkFixedPointVolumeRayCastHelper
##  @brief   An abstract helper that generates images for the volume ray cast mapper
##
##  This is the abstract superclass of all helper classes for the
##  vtkFixedPointVolumeRayCastMapper. This class should not be used directly.
##
##  @sa
##  vtkFixedPointVolumeRayCastMapper
##

## !!!Ignored construct:  # vtkFixedPointVolumeRayCastHelper_h [NewLine] # vtkFixedPointVolumeRayCastHelper_h [NewLine] # VTKKWRCHelper_GetCellScalarValues ( DATA , SCALE , SHIFT ) A = static_cast < unsigned int > [end of template] ( SCALE * ( * ( DATA ) + SHIFT ) ) ;
## Error: expected ';'!!!

B = static_cast[cuint](SCALE * ((DATA + Binc)[] + SHIFT))
C = static_cast[cuint](SCALE * ((DATA + Cinc)[] + SHIFT))
D = static_cast[cuint](SCALE * ((DATA + Dinc)[] + SHIFT))
E = static_cast[cuint](SCALE * ((DATA + Einc)[] + SHIFT))
F = static_cast[cuint](SCALE * ((DATA + Finc)[] + SHIFT))
G = static_cast[cuint](SCALE * ((DATA + Ginc)[] + SHIFT))
## !!!Ignored construct:  H = static_cast < unsigned int > [end of template] ( SCALE * ( * ( DATA + Hinc ) + SHIFT ) ) [NewLine] # VTKKWRCHelper_GetCellScalarValuesSimple ( DATA ) A = static_cast < unsigned int > ( * ( DATA ) ) ;
## Error: expected ';'!!!

B = static_cast[cuint]((DATA + Binc)[])
C = static_cast[cuint]((DATA + Cinc)[])
D = static_cast[cuint]((DATA + Dinc)[])
E = static_cast[cuint]((DATA + Einc)[])
F = static_cast[cuint]((DATA + Finc)[])
G = static_cast[cuint]((DATA + Ginc)[])
## !!!Ignored construct:  H = static_cast < unsigned int > [end of template] ( * ( DATA + Hinc ) ) [NewLine] # VTKKWRCHelper_GetCellMagnitudeValues ( ABCD , EFGH ) mA = static_cast < unsigned int > ( * ( ABCD ) ) ;
## Error: expected ';'!!!

mB = static_cast[cuint]((ABCD + mBFinc)[])
mC = static_cast[cuint]((ABCD + mCGinc)[])
mD = static_cast[cuint]((ABCD + mDHinc)[])
mE = static_cast[cuint]((EFGH)[])
mF = static_cast[cuint]((EFGH + mBFinc)[])
mG = static_cast[cuint]((EFGH + mCGinc)[])
## !!!Ignored construct:  mH = static_cast < unsigned int > [end of template] ( * ( EFGH + mDHinc ) ) [NewLine] # VTKKWRCHelper_GetCellDirectionValues ( ABCD , EFGH ) normalA = static_cast < unsigned int > ( * ( ABCD ) ) ;
## Error: expected ';'!!!

normalB = static_cast[cuint]((ABCD + dBFinc)[])
normalC = static_cast[cuint]((ABCD + dCGinc)[])
normalD = static_cast[cuint]((ABCD + dDHinc)[])
normalE = static_cast[cuint]((EFGH)[])
normalF = static_cast[cuint]((EFGH + dBFinc)[])
normalG = static_cast[cuint]((EFGH + dCGinc)[])
normalH = static_cast[cuint]((EFGH + dDHinc)[])
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_GetCellComponentScalarValues ( DATA , CIDX , SCALE , SHIFT ) A [ CIDX ] = static_cast < unsigned int > ( SCALE * ( * ( DATA ) + SHIFT ) ) ;
## Error: did not expect [NewLine]!!!

B[CIDX] = static_cast[cuint](SCALE * ((DATA + Binc)[] + SHIFT))
C[CIDX] = static_cast[cuint](SCALE * ((DATA + Cinc)[] + SHIFT))
D[CIDX] = static_cast[cuint](SCALE * ((DATA + Dinc)[] + SHIFT))
E[CIDX] = static_cast[cuint](SCALE * ((DATA + Einc)[] + SHIFT))
F[CIDX] = static_cast[cuint](SCALE * ((DATA + Finc)[] + SHIFT))
G[CIDX] = static_cast[cuint](SCALE * ((DATA + Ginc)[] + SHIFT))
## !!!Ignored construct:  H [ CIDX ] = static_cast < unsigned int > [end of template] ( SCALE * ( * ( DATA + Hinc ) + SHIFT ) ) [NewLine] # VTKKWRCHelper_GetCellComponentRawScalarValues ( DATA , CIDX ) A [ CIDX ] = static_cast < unsigned int > ( ( * ( DATA ) ) ) ;
## Error: expected ';'!!!

B[CIDX] = static_cast[cuint](((DATA + Binc)[]))
C[CIDX] = static_cast[cuint](((DATA + Cinc)[]))
D[CIDX] = static_cast[cuint](((DATA + Dinc)[]))
E[CIDX] = static_cast[cuint](((DATA + Einc)[]))
F[CIDX] = static_cast[cuint](((DATA + Finc)[]))
G[CIDX] = static_cast[cuint](((DATA + Ginc)[]))
## !!!Ignored construct:  H [ CIDX ] = static_cast < unsigned int > [end of template] ( ( * ( DATA + Hinc ) ) ) [NewLine] # VTKKWRCHelper_GetCellComponentMagnitudeValues ( ABCD , EFGH , CIDX ) mA [ CIDX ] = static_cast < unsigned int > ( * ( ABCD ) ) ;
## Error: expected ';'!!!

mB[CIDX] = static_cast[cuint]((ABCD + mBFinc)[])
mC[CIDX] = static_cast[cuint]((ABCD + mCGinc)[])
mD[CIDX] = static_cast[cuint]((ABCD + mDHinc)[])
mE[CIDX] = static_cast[cuint]((EFGH)[])
mF[CIDX] = static_cast[cuint]((EFGH + mBFinc)[])
mG[CIDX] = static_cast[cuint]((EFGH + mCGinc)[])
## !!!Ignored construct:  mH [ CIDX ] = static_cast < unsigned int > [end of template] ( * ( EFGH + mDHinc ) ) [NewLine] # VTKKWRCHelper_GetCellComponentDirectionValues ( ABCD , EFGH , CIDX ) normalA [ CIDX ] = static_cast < unsigned int > ( * ( ABCD ) ) ;
## Error: expected ';'!!!

normalB[CIDX] = static_cast[cuint]((ABCD + dBFinc)[])
normalC[CIDX] = static_cast[cuint]((ABCD + dCGinc)[])
normalD[CIDX] = static_cast[cuint]((ABCD + dDHinc)[])
normalE[CIDX] = static_cast[cuint]((EFGH)[])
normalF[CIDX] = static_cast[cuint]((EFGH + dBFinc)[])
normalG[CIDX] = static_cast[cuint]((EFGH + dCGinc)[])
normalH[CIDX] = static_cast[cuint]((EFGH + dDHinc)[])
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_ComputeWeights ( POS ) w2X = ( POS [ 0 ] & VTKKW_FP_MASK ) ;
## Error: did not expect [NewLine]!!!

w2Y = (POS[1] and VTKKW_FP_MASK)
w2Z = (POS[2] and VTKKW_FP_MASK)
w1X = ((not w2X) and VTKKW_FP_MASK)
w1Y = ((not w2Y) and VTKKW_FP_MASK)
w1Z = ((not w2Z) and VTKKW_FP_MASK)
w1Xw1Y = (0x4000 + (w1X * w1Y)) shr VTKKW_FP_SHIFT
w2Xw1Y = (0x4000 + (w2X * w1Y)) shr VTKKW_FP_SHIFT
w1Xw2Y = (0x4000 + (w1X * w2Y)) shr VTKKW_FP_SHIFT
w2Xw2Y = (0x4000 + (w2X * w2Y)) shr VTKKW_FP_SHIFT
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InterpolateScalar ( VAL ) VAL = ( 0x7fff + ( ( A * ( ( 0x4000 + w1Xw1Y * w1Z ) >> VTKKW_FP_SHIFT ) ) + ( B * ( ( 0x4000 + w2Xw1Y * w1Z ) >> VTKKW_FP_SHIFT ) ) + ( C * ( ( 0x4000 + w1Xw2Y * w1Z ) >> VTKKW_FP_SHIFT ) ) + ( D * ( ( 0x4000 + w2Xw2Y * w1Z ) >> VTKKW_FP_SHIFT ) ) + ( E * ( ( 0x4000 + w1Xw1Y * w2Z ) >> VTKKW_FP_SHIFT ) ) + ( F * ( ( 0x4000 + w2Xw1Y * w2Z ) >> VTKKW_FP_SHIFT ) ) + ( G * ( ( 0x4000 + w1Xw2Y * w2Z ) >> VTKKW_FP_SHIFT ) ) + ( H * ( ( 0x4000 + w2Xw2Y * w2Z ) >> VTKKW_FP_SHIFT ) ) ) ) >> VTKKW_FP_SHIFT ;
## Error: did not expect [NewLine]!!!

## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InterpolateMagnitude ( VAL ) VAL = ( 0x7fff + ( ( mA * ( ( 0x4000 + w1Xw1Y * w1Z ) >> VTKKW_FP_SHIFT ) ) + ( mB * ( ( 0x4000 + w2Xw1Y * w1Z ) >> VTKKW_FP_SHIFT ) ) + ( mC * ( ( 0x4000 + w1Xw2Y * w1Z ) >> VTKKW_FP_SHIFT ) ) + ( mD * ( ( 0x4000 + w2Xw2Y * w1Z ) >> VTKKW_FP_SHIFT ) ) + ( mE * ( ( 0x4000 + w1Xw1Y * w2Z ) >> VTKKW_FP_SHIFT ) ) + ( mF * ( ( 0x4000 + w2Xw1Y * w2Z ) >> VTKKW_FP_SHIFT ) ) + ( mG * ( ( 0x4000 + w1Xw2Y * w2Z ) >> VTKKW_FP_SHIFT ) ) + ( mH * ( ( 0x4000 + w2Xw2Y * w2Z ) >> VTKKW_FP_SHIFT ) ) ) ) >> VTKKW_FP_SHIFT ;
## Error: did not expect [NewLine]!!!

## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InterpolateScalarComponent ( VAL , CIDX , COMPONENTS ) for ( CIDX = 0 ;
## Error: did not expect [NewLine]!!!

## !!!Ignored construct:  CIDX < COMPONENTS ;
## Error: identifier expected, but got: <!!!

## !!!Ignored construct:  CIDX ++ ) { VAL [ CIDX ] = ( 0x7fff + ( ( A [ CIDX ] * ( ( 0x4000 + w1Xw1Y * w1Z ) >> VTKKW_FP_SHIFT ) ) + ( B [ CIDX ] * ( ( 0x4000 + w2Xw1Y * w1Z ) >> VTKKW_FP_SHIFT ) ) + ( C [ CIDX ] * ( ( 0x4000 + w1Xw2Y * w1Z ) >> VTKKW_FP_SHIFT ) ) + ( D [ CIDX ] * ( ( 0x4000 + w2Xw2Y * w1Z ) >> VTKKW_FP_SHIFT ) ) + ( E [ CIDX ] * ( ( 0x4000 + w1Xw1Y * w2Z ) >> VTKKW_FP_SHIFT ) ) + ( F [ CIDX ] * ( ( 0x4000 + w2Xw1Y * w2Z ) >> VTKKW_FP_SHIFT ) ) + ( G [ CIDX ] * ( ( 0x4000 + w1Xw2Y * w2Z ) >> VTKKW_FP_SHIFT ) ) + ( H [ CIDX ] * ( ( 0x4000 + w2Xw2Y * w2Z ) >> VTKKW_FP_SHIFT ) ) ) ) >> VTKKW_FP_SHIFT ; } [NewLine] # VTKKWRCHelper_InterpolateMagnitudeComponent ( VAL , CIDX , COMPONENTS ) for ( CIDX = 0 ;
## Error: expected ';'!!!

## !!!Ignored construct:  CIDX < COMPONENTS ;
## Error: identifier expected, but got: <!!!

## !!!Ignored construct:  CIDX ++ ) { VAL [ CIDX ] = ( 0x7fff + ( ( mA [ CIDX ] * ( ( 0x4000 + w1Xw1Y * w1Z ) >> VTKKW_FP_SHIFT ) ) + ( mB [ CIDX ] * ( ( 0x4000 + w2Xw1Y * w1Z ) >> VTKKW_FP_SHIFT ) ) + ( mC [ CIDX ] * ( ( 0x4000 + w1Xw2Y * w1Z ) >> VTKKW_FP_SHIFT ) ) + ( mD [ CIDX ] * ( ( 0x4000 + w2Xw2Y * w1Z ) >> VTKKW_FP_SHIFT ) ) + ( mE [ CIDX ] * ( ( 0x4000 + w1Xw1Y * w2Z ) >> VTKKW_FP_SHIFT ) ) + ( mF [ CIDX ] * ( ( 0x4000 + w2Xw1Y * w2Z ) >> VTKKW_FP_SHIFT ) ) + ( mG [ CIDX ] * ( ( 0x4000 + w1Xw2Y * w2Z ) >> VTKKW_FP_SHIFT ) ) + ( mH [ CIDX ] * ( ( 0x4000 + w2Xw2Y * w2Z ) >> VTKKW_FP_SHIFT ) ) ) ) >> VTKKW_FP_SHIFT ; } [NewLine] # VTKKWRCHelper_InterpolateShading ( DTABLE , STABLE , COLOR ) unsigned int _tmpDColor [ 3 ] ;
## Error: expected ';'!!!

var _tmpSColor* {.importcpp: "_tmpSColor",
                header: "vtkFixedPointVolumeRayCastHelper.h".}: array[3, cuint]

_tmpDColor[0] = (0x7fff +
    ((DTABLE[3 * normalA] * ((0x4000 + w1Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalB] * ((0x4000 + w2Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalC] * ((0x4000 + w1Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalD] * ((0x4000 + w2Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalE] * ((0x4000 + w1Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalF] * ((0x4000 + w2Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalG] * ((0x4000 + w1Xw2Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalH] * ((0x4000 + w2Xw2Y * w2Z) shr VTKKW_FP_SHIFT)))) shr
    VTKKW_FP_SHIFT
_tmpDColor[1] = (0x7fff +
    ((DTABLE[3 * normalA + 1] * ((0x4000 + w1Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalB + 1] * ((0x4000 + w2Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalC + 1] * ((0x4000 + w1Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalD + 1] * ((0x4000 + w2Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalE + 1] * ((0x4000 + w1Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalF + 1] * ((0x4000 + w2Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalG + 1] * ((0x4000 + w1Xw2Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalH + 1] * ((0x4000 + w2Xw2Y * w2Z) shr VTKKW_FP_SHIFT)))) shr
    VTKKW_FP_SHIFT
_tmpDColor[2] = (0x7fff +
    ((DTABLE[3 * normalA + 2] * ((0x4000 + w1Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalB + 2] * ((0x4000 + w2Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalC + 2] * ((0x4000 + w1Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalD + 2] * ((0x4000 + w2Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalE + 2] * ((0x4000 + w1Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalF + 2] * ((0x4000 + w2Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalG + 2] * ((0x4000 + w1Xw2Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[3 * normalH + 2] * ((0x4000 + w2Xw2Y * w2Z) shr VTKKW_FP_SHIFT)))) shr
    VTKKW_FP_SHIFT
_tmpSColor[0] = (0x7fff +
    ((STABLE[3 * normalA] * ((0x4000 + w1Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalB] * ((0x4000 + w2Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalC] * ((0x4000 + w1Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalD] * ((0x4000 + w2Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalE] * ((0x4000 + w1Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalF] * ((0x4000 + w2Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalG] * ((0x4000 + w1Xw2Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalH] * ((0x4000 + w2Xw2Y * w2Z) shr VTKKW_FP_SHIFT)))) shr
    VTKKW_FP_SHIFT
_tmpSColor[1] = (0x7fff +
    ((STABLE[3 * normalA + 1] * ((0x4000 + w1Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalB + 1] * ((0x4000 + w2Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalC + 1] * ((0x4000 + w1Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalD + 1] * ((0x4000 + w2Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalE + 1] * ((0x4000 + w1Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalF + 1] * ((0x4000 + w2Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalG + 1] * ((0x4000 + w1Xw2Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalH + 1] * ((0x4000 + w2Xw2Y * w2Z) shr VTKKW_FP_SHIFT)))) shr
    VTKKW_FP_SHIFT
_tmpSColor[2] = (0x7fff +
    ((STABLE[3 * normalA + 2] * ((0x4000 + w1Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalB + 2] * ((0x4000 + w2Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalC + 2] * ((0x4000 + w1Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalD + 2] * ((0x4000 + w2Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalE + 2] * ((0x4000 + w1Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalF + 2] * ((0x4000 + w2Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalG + 2] * ((0x4000 + w1Xw2Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[3 * normalH + 2] * ((0x4000 + w2Xw2Y * w2Z) shr VTKKW_FP_SHIFT)))) shr
    VTKKW_FP_SHIFT
COLOR[0] = static_cast[cushort]((_tmpDColor[0] * COLOR[0] + 0x7fff) shr
    VTKKW_FP_SHIFT)
COLOR[1] = static_cast[cushort]((_tmpDColor[1] * COLOR[1] + 0x7fff) shr
    VTKKW_FP_SHIFT)
COLOR[2] = static_cast[cushort]((_tmpDColor[2] * COLOR[2] + 0x7fff) shr
    VTKKW_FP_SHIFT)
inc(COLOR[0], (_tmpSColor[0] * COLOR[3] + 0x7fff) shr VTKKW_FP_SHIFT)
inc(COLOR[1], (_tmpSColor[1] * COLOR[3] + 0x7fff) shr VTKKW_FP_SHIFT)
inc(COLOR[2], (_tmpSColor[2] * COLOR[3] + 0x7fff) shr VTKKW_FP_SHIFT)
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InterpolateShadingComponent ( DTABLE , STABLE , COLOR , CIDX ) unsigned int _tmpDColor [ 3 ] ;
## Error: did not expect [NewLine]!!!

var _tmpSColor* {.importcpp: "_tmpSColor",
                header: "vtkFixedPointVolumeRayCastHelper.h".}: array[3, cuint]

_tmpDColor[0] = (0x7fff +
    ((DTABLE[CIDX][3 * normalA[CIDX]] *
    ((0x4000 + w1Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalB[CIDX]] *
    ((0x4000 + w2Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalC[CIDX]] *
    ((0x4000 + w1Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalD[CIDX]] *
    ((0x4000 + w2Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalE[CIDX]] *
    ((0x4000 + w1Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalF[CIDX]] *
    ((0x4000 + w2Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalG[CIDX]] *
    ((0x4000 + w1Xw2Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalH[CIDX]] *
    ((0x4000 + w2Xw2Y * w2Z) shr VTKKW_FP_SHIFT)))) shr VTKKW_FP_SHIFT
_tmpDColor[1] = (0x7fff +
    ((DTABLE[CIDX][3 * normalA[CIDX] + 1] *
    ((0x4000 + w1Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalB[CIDX] + 1] *
    ((0x4000 + w2Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalC[CIDX] + 1] *
    ((0x4000 + w1Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalD[CIDX] + 1] *
    ((0x4000 + w2Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalE[CIDX] + 1] *
    ((0x4000 + w1Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalF[CIDX] + 1] *
    ((0x4000 + w2Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalG[CIDX] + 1] *
    ((0x4000 + w1Xw2Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalH[CIDX] + 1] *
    ((0x4000 + w2Xw2Y * w2Z) shr VTKKW_FP_SHIFT)))) shr VTKKW_FP_SHIFT
_tmpDColor[2] = (0x7fff +
    ((DTABLE[CIDX][3 * normalA[CIDX] + 2] *
    ((0x4000 + w1Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalB[CIDX] + 2] *
    ((0x4000 + w2Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalC[CIDX] + 2] *
    ((0x4000 + w1Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalD[CIDX] + 2] *
    ((0x4000 + w2Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalE[CIDX] + 2] *
    ((0x4000 + w1Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalF[CIDX] + 2] *
    ((0x4000 + w2Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalG[CIDX] + 2] *
    ((0x4000 + w1Xw2Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (DTABLE[CIDX][3 * normalH[CIDX] + 2] *
    ((0x4000 + w2Xw2Y * w2Z) shr VTKKW_FP_SHIFT)))) shr VTKKW_FP_SHIFT
_tmpSColor[0] = (0x7fff +
    ((STABLE[CIDX][3 * normalA[CIDX]] *
    ((0x4000 + w1Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalB[CIDX]] *
    ((0x4000 + w2Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalC[CIDX]] *
    ((0x4000 + w1Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalD[CIDX]] *
    ((0x4000 + w2Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalE[CIDX]] *
    ((0x4000 + w1Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalF[CIDX]] *
    ((0x4000 + w2Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalG[CIDX]] *
    ((0x4000 + w1Xw2Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalH[CIDX]] *
    ((0x4000 + w2Xw2Y * w2Z) shr VTKKW_FP_SHIFT)))) shr VTKKW_FP_SHIFT
_tmpSColor[1] = (0x7fff +
    ((STABLE[CIDX][3 * normalA[CIDX] + 1] *
    ((0x4000 + w1Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalB[CIDX] + 1] *
    ((0x4000 + w2Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalC[CIDX] + 1] *
    ((0x4000 + w1Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalD[CIDX] + 1] *
    ((0x4000 + w2Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalE[CIDX] + 1] *
    ((0x4000 + w1Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalF[CIDX] + 1] *
    ((0x4000 + w2Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalG[CIDX] + 1] *
    ((0x4000 + w1Xw2Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalH[CIDX] + 1] *
    ((0x4000 + w2Xw2Y * w2Z) shr VTKKW_FP_SHIFT)))) shr VTKKW_FP_SHIFT
_tmpSColor[2] = (0x7fff +
    ((STABLE[CIDX][3 * normalA[CIDX] + 2] *
    ((0x4000 + w1Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalB[CIDX] + 2] *
    ((0x4000 + w2Xw1Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalC[CIDX] + 2] *
    ((0x4000 + w1Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalD[CIDX] + 2] *
    ((0x4000 + w2Xw2Y * w1Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalE[CIDX] + 2] *
    ((0x4000 + w1Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalF[CIDX] + 2] *
    ((0x4000 + w2Xw1Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalG[CIDX] + 2] *
    ((0x4000 + w1Xw2Y * w2Z) shr VTKKW_FP_SHIFT)) +
    (STABLE[CIDX][3 * normalH[CIDX] + 2] *
    ((0x4000 + w2Xw2Y * w2Z) shr VTKKW_FP_SHIFT)))) shr VTKKW_FP_SHIFT
COLOR[0] = static_cast[cushort]((_tmpDColor[0] * COLOR[0] + 0x7fff) shr
    VTKKW_FP_SHIFT)
COLOR[1] = static_cast[cushort]((_tmpDColor[1] * COLOR[1] + 0x7fff) shr
    VTKKW_FP_SHIFT)
COLOR[2] = static_cast[cushort]((_tmpDColor[2] * COLOR[2] + 0x7fff) shr
    VTKKW_FP_SHIFT)
inc(COLOR[0], (_tmpSColor[0] * COLOR[3] + 0x7fff) shr VTKKW_FP_SHIFT)
inc(COLOR[1], (_tmpSColor[1] * COLOR[3] + 0x7fff) shr VTKKW_FP_SHIFT)
inc(COLOR[2], (_tmpSColor[2] * COLOR[3] + 0x7fff) shr VTKKW_FP_SHIFT)
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_LookupColorUS ( COLORTABLE , SCALAROPACITYTABLE , IDX , COLOR ) COLOR [ 3 ] = SCALAROPACITYTABLE [ IDX ] ;
## Error: did not expect [NewLine]!!!

if not COLOR[3]:
  continue
COLOR[0] = static_cast[cushort]((COLORTABLE[3 * IDX] * COLOR[3] + 0x7fff) shr
    (VTKKW_FP_SHIFT))
COLOR[1] = static_cast[cushort]((COLORTABLE[3 * IDX + 1] * COLOR[3] + 0x7fff) shr
    (VTKKW_FP_SHIFT))
COLOR[2] = static_cast[cushort]((COLORTABLE[3 * IDX + 2] * COLOR[3] + 0x7fff) shr
    (VTKKW_FP_SHIFT))
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_LookupColorMax ( COLORTABLE , SCALAROPACITYTABLE , IDX , COLOR ) COLOR [ 3 ] = SCALAROPACITYTABLE [ IDX ] ;
## Error: did not expect [NewLine]!!!

COLOR[0] = static_cast[cushort]((COLORTABLE[3 * IDX] * COLOR[3] + 0x7fff) shr
    (VTKKW_FP_SHIFT))
COLOR[1] = static_cast[cushort]((COLORTABLE[3 * IDX + 1] * COLOR[3] + 0x7fff) shr
    (VTKKW_FP_SHIFT))
COLOR[2] = static_cast[cushort]((COLORTABLE[3 * IDX + 2] * COLOR[3] + 0x7fff) shr
    (VTKKW_FP_SHIFT))
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_LookupDependentColorUS ( COLORTABLE , SCALAROPACITYTABLE , IDX , CMPS , COLOR ) { unsigned short _alpha ; switch ( CMPS ) { case 2 : _alpha = SCALAROPACITYTABLE [ IDX [ 1 ] ] ; COLOR [ 0 ] = static_cast < unsigned short > ( ( COLORTABLE [ 3 * IDX [ 0 ] ] * _alpha + 0x7fff ) >> ( VTKKW_FP_SHIFT ) ) ; COLOR [ 1 ] = static_cast < unsigned short > ( ( COLORTABLE [ 3 * IDX [ 0 ] + 1 ] * _alpha + 0x7fff ) >> ( VTKKW_FP_SHIFT ) ) ; COLOR [ 2 ] = static_cast < unsigned short > ( ( COLORTABLE [ 3 * IDX [ 0 ] + 2 ] * _alpha + 0x7fff ) >> ( VTKKW_FP_SHIFT ) ) ; COLOR [ 3 ] = _alpha ; break ; case 4 : _alpha = SCALAROPACITYTABLE [ IDX [ 3 ] ] ; COLOR [ 0 ] = static_cast < unsigned short > ( ( IDX [ 0 ] * _alpha + 0x7f ) >> 8 ) ; COLOR [ 1 ] = static_cast < unsigned short > ( ( IDX [ 1 ] * _alpha + 0x7f ) >> 8 ) ; COLOR [ 2 ] = static_cast < unsigned short > ( ( IDX [ 2 ] * _alpha + 0x7f ) >> 8 ) ; COLOR [ 3 ] = _alpha ; break ; } } [NewLine] # VTKKWRCHelper_LookupColorGOUS ( CTABLE , SOTABLE , GOTABLE , IDX , IDX2 , COLOR ) COLOR [ 3 ] = ( SOTABLE [ IDX ] * GOTABLE [ IDX2 ] + 0x7fff ) >> VTKKW_FP_SHIFT ;
## Error: did not expect [NewLine]!!!

if not COLOR[3]:
  continue
COLOR[0] = static_cast[cushort]((CTABLE[3 * IDX] * COLOR[3] + 0x7fff) shr
    (VTKKW_FP_SHIFT))
COLOR[1] = static_cast[cushort]((CTABLE[3 * IDX + 1] * COLOR[3] + 0x7fff) shr
    (VTKKW_FP_SHIFT))
COLOR[2] = static_cast[cushort]((CTABLE[3 * IDX + 2] * COLOR[3] + 0x7fff) shr
    (VTKKW_FP_SHIFT))
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_LookupShading ( DTABLE , STABLE , NORMAL , COLOR ) COLOR [ 0 ] = static_cast < unsigned short > ( ( DTABLE [ 3 * NORMAL ] * COLOR [ 0 ] + 0x7fff ) >> VTKKW_FP_SHIFT ) ;
## Error: did not expect [NewLine]!!!

COLOR[1] = static_cast[cushort]((DTABLE[3 * NORMAL + 1] * COLOR[1] + 0x7fff) shr
    VTKKW_FP_SHIFT)
COLOR[2] = static_cast[cushort]((DTABLE[3 * NORMAL + 2] * COLOR[2] + 0x7fff) shr
    VTKKW_FP_SHIFT)
inc(COLOR[0], (STABLE[3 * NORMAL] * COLOR[3] + 0x7fff) shr VTKKW_FP_SHIFT)
inc(COLOR[1], (STABLE[3 * NORMAL + 1] * COLOR[3] + 0x7fff) shr VTKKW_FP_SHIFT)
inc(COLOR[2], (STABLE[3 * NORMAL + 2] * COLOR[3] + 0x7fff) shr VTKKW_FP_SHIFT)
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_LookupAndCombineIndependentColorsUS ( COLORTABLE , SOTABLE , SCALAR , WEIGHTS , COMPONENTS , COLOR ) unsigned int _tmp [ 4 ] = { 0 , 0 , 0 , 0 } ;
## Error: did not expect [NewLine]!!!

var _alpha* {.importcpp: "_alpha", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    4, cushort]

var _totalAlpha* {.importcpp: "_totalAlpha",
                 header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

var _idx: cint

while _idx < COMPONENTS:
  _alpha[_idx] = static_cast[cushort](SOTABLE[_idx][SCALAR[_idx]] * WEIGHTS[_idx])
  inc(_totalAlpha, _alpha[_idx])
  inc(_idx)
if not _totalAlpha:
  continue
var _idx: cint

while _idx < COMPONENTS:
  if _alpha[_idx]:
    inc(_tmp[0], static_cast[cushort](((COLORTABLE[_idx][3 * SCALAR[_idx]]) *
        _alpha[_idx] + 0x7fff) shr (VTKKW_FP_SHIFT)))
    inc(_tmp[1], static_cast[cushort](((COLORTABLE[_idx][3 * SCALAR[_idx] + 1]) *
        _alpha[_idx] + 0x7fff) shr (VTKKW_FP_SHIFT)))
    inc(_tmp[2], static_cast[cushort](((COLORTABLE[_idx][3 * SCALAR[_idx] + 2]) *
        _alpha[_idx] + 0x7fff) shr (VTKKW_FP_SHIFT)))
    inc(_tmp[3], ((_alpha[_idx] * _alpha[_idx]) div _totalAlpha))
  inc(_idx)
if not _tmp[3]:
  continue
COLOR[0] = if (_tmp[0] > 32767): (32767) else: (_tmp[0])
COLOR[1] = if (_tmp[1] > 32767): (32767) else: (_tmp[1])
COLOR[2] = if (_tmp[2] > 32767): (32767) else: (_tmp[2])
COLOR[3] = if (_tmp[3] > 32767): (32767) else: (_tmp[3])
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_LookupAndCombineIndependentColorsMax ( COLORTABLE , SCALAROPACITYTABLE , IDX , WEIGHTS , CMPS , COLOR ) { unsigned int _tmp [ 4 ] = { 0 , 0 , 0 , 0 } ; for ( int _idx = 0 ; _idx < CMPS ; _idx ++ ) { unsigned short _alpha = static_cast < unsigned short > ( SCALAROPACITYTABLE [ _idx ] [ IDX [ _idx ] ] * WEIGHTS [ _idx ] ) ; _tmp [ 0 ] += static_cast < unsigned short > ( ( ( COLORTABLE [ _idx ] [ 3 * IDX [ _idx ] ] ) * _alpha + 0x7fff ) >> ( VTKKW_FP_SHIFT ) ) ; _tmp [ 1 ] += static_cast < unsigned short > ( ( ( COLORTABLE [ _idx ] [ 3 * IDX [ _idx ] + 1 ] ) * _alpha + 0x7fff ) >> ( VTKKW_FP_SHIFT ) ) ; _tmp [ 2 ] += static_cast < unsigned short > ( ( ( COLORTABLE [ _idx ] [ 3 * IDX [ _idx ] + 2 ] ) * _alpha + 0x7fff ) >> ( VTKKW_FP_SHIFT ) ) ; _tmp [ 3 ] += _alpha ; } COLOR [ 0 ] = ( _tmp [ 0 ] > 32767 ) ? ( 32767 ) : ( _tmp [ 0 ] ) ; COLOR [ 1 ] = ( _tmp [ 1 ] > 32767 ) ? ( 32767 ) : ( _tmp [ 1 ] ) ; COLOR [ 2 ] = ( _tmp [ 2 ] > 32767 ) ? ( 32767 ) : ( _tmp [ 2 ] ) ; COLOR [ 3 ] = ( _tmp [ 3 ] > 32767 ) ? ( 32767 ) : ( _tmp [ 3 ] ) ; } [NewLine] # VTKKWRCHelper_LookupAndCombineIndependentColorsGOUS ( COLORTABLE , SOTABLE , GOTABLE , SCALAR , MAG , WEIGHTS , COMPONENTS , COLOR ) unsigned int _tmp [ 4 ] = { 0 , 0 , 0 , 0 } ;
## Error: did not expect [NewLine]!!!

var _alpha* {.importcpp: "_alpha", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    4, cushort]

var _totalAlpha* {.importcpp: "_totalAlpha",
                 header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

COMPONENTS = if (COMPONENTS < 4): COMPONENTS else: 4
var _idx: cint

while _idx < COMPONENTS:
  _alpha[_idx] = static_cast[cushort](SOTABLE[_idx][SCALAR[_idx]] * WEIGHTS[_idx])
  if _alpha[_idx]:
    _alpha[_idx] = static_cast[cushort]((_alpha[_idx] * GOTABLE[_idx][MAG[_idx]] +
        0x7fff) shr (VTKKW_FP_SHIFT))
    inc(_totalAlpha, _alpha[_idx])
  inc(_idx)
if not _totalAlpha:
  continue
var _idx: cint

while _idx < COMPONENTS:
  if _alpha[_idx]:
    inc(_tmp[0], static_cast[cushort](((COLORTABLE[_idx][3 * SCALAR[_idx]]) *
        _alpha[_idx] + 0x7fff) shr (VTKKW_FP_SHIFT)))
    inc(_tmp[1], static_cast[cushort](((COLORTABLE[_idx][3 * SCALAR[_idx] + 1]) *
        _alpha[_idx] + 0x7fff) shr (VTKKW_FP_SHIFT)))
    inc(_tmp[2], static_cast[cushort](((COLORTABLE[_idx][3 * SCALAR[_idx] + 2]) *
        _alpha[_idx] + 0x7fff) shr (VTKKW_FP_SHIFT)))
    inc(_tmp[3], ((_alpha[_idx] * _alpha[_idx]) div _totalAlpha))
  inc(_idx)
if not _tmp[3]:
  continue
COLOR[0] = if (_tmp[0] > 32767): (32767) else: (_tmp[0])
COLOR[1] = if (_tmp[1] > 32767): (32767) else: (_tmp[1])
COLOR[2] = if (_tmp[2] > 32767): (32767) else: (_tmp[2])
COLOR[3] = if (_tmp[3] > 32767): (32767) else: (_tmp[3])
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_LookupAndCombineIndependentColorsShadeUS ( COLORTABLE , SOTABLE , DTABLE , STABLE , SCALAR , NORMAL , WEIGHTS , COMPONENTS , COLOR ) unsigned int _tmp [ 4 ] = { 0 , 0 , 0 , 0 } ;
## Error: did not expect [NewLine]!!!

var _tmpC* {.importcpp: "_tmpC", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    3, cuint]

var _alpha* {.importcpp: "_alpha", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    4, cushort]

var _totalAlpha* {.importcpp: "_totalAlpha",
                 header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

var _idx: cint

while _idx < COMPONENTS:
  _alpha[_idx] = static_cast[cushort](SOTABLE[_idx][SCALAR[_idx]] * WEIGHTS[_idx])
  inc(_totalAlpha, _alpha[_idx])
  inc(_idx)
if not _totalAlpha:
  continue
var _idx: cint

while _idx < COMPONENTS:
  if _alpha[_idx]:
    _tmpC[0] = static_cast[cushort](((COLORTABLE[_idx][3 * SCALAR[_idx]]) *
        _alpha[_idx] + 0x7fff) shr (VTKKW_FP_SHIFT))
    _tmpC[1] = static_cast[cushort](((COLORTABLE[_idx][3 * SCALAR[_idx] + 1]) *
        _alpha[_idx] + 0x7fff) shr (VTKKW_FP_SHIFT))
    _tmpC[2] = static_cast[cushort](((COLORTABLE[_idx][3 * SCALAR[_idx] + 2]) *
        _alpha[_idx] + 0x7fff) shr (VTKKW_FP_SHIFT))
    _tmpC[0] = static_cast[cushort]((DTABLE[_idx][3 * NORMAL[_idx]] * _tmpC[0] +
        0x7fff) shr VTKKW_FP_SHIFT)
    _tmpC[1] = static_cast[cushort]((DTABLE[_idx][3 * NORMAL[_idx] + 1] * _tmpC[1] +
        0x7fff) shr VTKKW_FP_SHIFT)
    _tmpC[2] = static_cast[cushort]((DTABLE[_idx][3 * NORMAL[_idx] + 2] * _tmpC[2] +
        0x7fff) shr VTKKW_FP_SHIFT)
    inc(_tmpC[0], (STABLE[_idx][3 * NORMAL[_idx]] * _alpha[_idx] + 0x7fff) shr
        VTKKW_FP_SHIFT)
    inc(_tmpC[1], (STABLE[_idx][3 * NORMAL[_idx] + 1] * _alpha[_idx] + 0x7fff) shr
        VTKKW_FP_SHIFT)
    inc(_tmpC[2], (STABLE[_idx][3 * NORMAL[_idx] + 2] * _alpha[_idx] + 0x7fff) shr
        VTKKW_FP_SHIFT)
    inc(_tmp[0], _tmpC[0])
    inc(_tmp[1], _tmpC[1])
    inc(_tmp[2], _tmpC[2])
    inc(_tmp[3], ((_alpha[_idx] * _alpha[_idx]) div _totalAlpha))
  inc(_idx)
if not _tmp[3]:
  continue
COLOR[0] = if (_tmp[0] > 32767): (32767) else: (_tmp[0])
COLOR[1] = if (_tmp[1] > 32767): (32767) else: (_tmp[1])
COLOR[2] = if (_tmp[2] > 32767): (32767) else: (_tmp[2])
COLOR[3] = if (_tmp[3] > 32767): (32767) else: (_tmp[3])
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_LookupAndCombineIndependentColorsInterpolateShadeUS ( COLORTABLE , SOTABLE , DTABLE , STABLE , SCALAR , WEIGHTS , COMPONENTS , COLOR ) unsigned int _tmp [ 4 ] = { 0 , 0 , 0 , 0 } ;
## Error: did not expect [NewLine]!!!

var _tmpC* {.importcpp: "_tmpC", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    4, cuint]

var _alpha* {.importcpp: "_alpha", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    4, cushort]

var _totalAlpha* {.importcpp: "_totalAlpha",
                 header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

var _idx: cint

while _idx < COMPONENTS:
  _alpha[_idx] = static_cast[cushort](SOTABLE[_idx][SCALAR[_idx]] * WEIGHTS[_idx])
  inc(_totalAlpha, _alpha[_idx])
  inc(_idx)
if not _totalAlpha:
  continue
var _idx: cint

while _idx < COMPONENTS:
  if _alpha[_idx]:
    _tmpC[0] = static_cast[cushort](((COLORTABLE[_idx][3 * SCALAR[_idx]]) *
        _alpha[_idx] + 0x7fff) shr (VTKKW_FP_SHIFT))
    _tmpC[1] = static_cast[cushort](((COLORTABLE[_idx][3 * SCALAR[_idx] + 1]) *
        _alpha[_idx] + 0x7fff) shr (VTKKW_FP_SHIFT))
    _tmpC[2] = static_cast[cushort](((COLORTABLE[_idx][3 * SCALAR[_idx] + 2]) *
        _alpha[_idx] + 0x7fff) shr (VTKKW_FP_SHIFT))
    _tmpC[3] = _alpha[_idx]
    VTKKWRCHelper_InterpolateShadingComponent(DTABLE, STABLE, _tmpC, _idx)
    inc(_tmp[0], _tmpC[0])
    inc(_tmp[1], _tmpC[1])
    inc(_tmp[2], _tmpC[2])
    inc(_tmp[3], ((_alpha[_idx] * _alpha[_idx]) div _totalAlpha))
  inc(_idx)
if not _tmp[3]:
  continue
COLOR[0] = if (_tmp[0] > 32767): (32767) else: (_tmp[0])
COLOR[1] = if (_tmp[1] > 32767): (32767) else: (_tmp[1])
COLOR[2] = if (_tmp[2] > 32767): (32767) else: (_tmp[2])
COLOR[3] = if (_tmp[3] > 32767): (32767) else: (_tmp[3])
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_CompositeColorAndCheckEarlyTermination ( COLOR , TMP , REMAININGOPACITY ) COLOR [ 0 ] += ( TMP [ 0 ] * REMAININGOPACITY + 0x7fff ) >> VTKKW_FP_SHIFT ;
## Error: did not expect [NewLine]!!!

inc(COLOR[1], (TMP[1] * REMAININGOPACITY + 0x7fff) shr VTKKW_FP_SHIFT)
inc(COLOR[2], (TMP[2] * REMAININGOPACITY + 0x7fff) shr VTKKW_FP_SHIFT)
REMAININGOPACITY = (REMAININGOPACITY * ((not (TMP[3]) and VTKKW_FP_MASK)) + 0x7fff) shr
    VTKKW_FP_SHIFT
if REMAININGOPACITY < 0xff:
  break
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_LookupAndCombineIndependentColorsGOShadeUS ( COLORTABLE , SOTABLE , GOTABLE , DTABLE , STABLE , SCALAR , MAG , NORMAL , WEIGHTS , COMPONENTS , COLOR ) unsigned int _tmp [ 4 ] = { 0 , 0 , 0 , 0 } ;
## Error: did not expect [NewLine]!!!

var _tmpC* {.importcpp: "_tmpC", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    3, cuint]

var _alpha* {.importcpp: "_alpha", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    4, cushort]

var _totalAlpha* {.importcpp: "_totalAlpha",
                 header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

var _idx: cint

while _idx < COMPONENTS:
  _alpha[_idx] = static_cast[cushort](SOTABLE[_idx][SCALAR[_idx]] * WEIGHTS[_idx])
  if _alpha[_idx]:
    _alpha[_idx] = static_cast[cushort]((_alpha[_idx] * GOTABLE[_idx][MAG[_idx]] +
        0x7fff) shr (VTKKW_FP_SHIFT))
    inc(_totalAlpha, _alpha[_idx])
  inc(_idx)
if not _totalAlpha:
  continue
var _idx: cint

while _idx < COMPONENTS:
  if _alpha[_idx]:
    _tmpC[0] = static_cast[cushort](((COLORTABLE[_idx][3 * SCALAR[_idx]]) *
        _alpha[_idx] + 0x7fff) shr (VTKKW_FP_SHIFT))
    _tmpC[1] = static_cast[cushort](((COLORTABLE[_idx][3 * SCALAR[_idx] + 1]) *
        _alpha[_idx] + 0x7fff) shr (VTKKW_FP_SHIFT))
    _tmpC[2] = static_cast[cushort](((COLORTABLE[_idx][3 * SCALAR[_idx] + 2]) *
        _alpha[_idx] + 0x7fff) shr (VTKKW_FP_SHIFT))
    _tmpC[0] = static_cast[cushort]((DTABLE[_idx][3 * NORMAL[_idx]] * _tmpC[0] +
        0x7fff) shr VTKKW_FP_SHIFT)
    _tmpC[1] = static_cast[cushort]((DTABLE[_idx][3 * NORMAL[_idx] + 1] * _tmpC[1] +
        0x7fff) shr VTKKW_FP_SHIFT)
    _tmpC[2] = static_cast[cushort]((DTABLE[_idx][3 * NORMAL[_idx] + 2] * _tmpC[2] +
        0x7fff) shr VTKKW_FP_SHIFT)
    inc(_tmpC[0], (STABLE[_idx][3 * NORMAL[_idx]] * _alpha[_idx] + 0x7fff) shr
        VTKKW_FP_SHIFT)
    inc(_tmpC[1], (STABLE[_idx][3 * NORMAL[_idx] + 1] * _alpha[_idx] + 0x7fff) shr
        VTKKW_FP_SHIFT)
    inc(_tmpC[2], (STABLE[_idx][3 * NORMAL[_idx] + 2] * _alpha[_idx] + 0x7fff) shr
        VTKKW_FP_SHIFT)
    inc(_tmp[0], _tmpC[0])
    inc(_tmp[1], _tmpC[1])
    inc(_tmp[2], _tmpC[2])
    inc(_tmp[3], ((_alpha[_idx] * _alpha[_idx]) div _totalAlpha))
  inc(_idx)
if not _tmp[3]:
  continue
COLOR[0] = if (_tmp[0] > 32767): (32767) else: (_tmp[0])
COLOR[1] = if (_tmp[1] > 32767): (32767) else: (_tmp[1])
COLOR[2] = if (_tmp[2] > 32767): (32767) else: (_tmp[2])
COLOR[3] = if (_tmp[3] > 32767): (32767) else: (_tmp[3])
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_LookupAndCombineIndependentColorsGOInterpolateShadeUS ( COLORTABLE , SOTABLE , GOTABLE , DTABLE , STABLE , SCALAR , MAG , WEIGHTS , COMPONENTS , COLOR ) unsigned int _tmp [ 4 ] = { 0 , 0 , 0 , 0 } ;
## Error: did not expect [NewLine]!!!

var _tmpC* {.importcpp: "_tmpC", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    4, cuint]

var _alpha* {.importcpp: "_alpha", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    4, cushort]

var _totalAlpha* {.importcpp: "_totalAlpha",
                 header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

var _idx: cint

while _idx < COMPONENTS:
  _alpha[_idx] = static_cast[cushort](SOTABLE[_idx][SCALAR[_idx]] * WEIGHTS[_idx])
  if _alpha[_idx]:
    _alpha[_idx] = static_cast[cushort]((_alpha[_idx] * GOTABLE[_idx][MAG[_idx]] +
        0x7fff) shr (VTKKW_FP_SHIFT))
    inc(_totalAlpha, _alpha[_idx])
  inc(_idx)
if not _totalAlpha:
  continue
var _idx: cint

while _idx < COMPONENTS:
  if _alpha[_idx]:
    _tmpC[0] = static_cast[cushort](((COLORTABLE[_idx][3 * SCALAR[_idx]]) *
        _alpha[_idx] + 0x7fff) shr (VTKKW_FP_SHIFT))
    _tmpC[1] = static_cast[cushort](((COLORTABLE[_idx][3 * SCALAR[_idx] + 1]) *
        _alpha[_idx] + 0x7fff) shr (VTKKW_FP_SHIFT))
    _tmpC[2] = static_cast[cushort](((COLORTABLE[_idx][3 * SCALAR[_idx] + 2]) *
        _alpha[_idx] + 0x7fff) shr (VTKKW_FP_SHIFT))
    _tmpC[3] = _alpha[_idx]
    VTKKWRCHelper_InterpolateShadingComponent(DTABLE, STABLE, _tmpC, _idx)
    inc(_tmp[0], _tmpC[0])
    inc(_tmp[1], _tmpC[1])
    inc(_tmp[2], _tmpC[2])
    inc(_tmp[3], ((_alpha[_idx] * _alpha[_idx]) div _totalAlpha))
  inc(_idx)
if not _tmp[3]:
  continue
COLOR[0] = if (_tmp[0] > 32767): (32767) else: (_tmp[0])
COLOR[1] = if (_tmp[1] > 32767): (32767) else: (_tmp[1])
COLOR[2] = if (_tmp[2] > 32767): (32767) else: (_tmp[2])
COLOR[3] = if (_tmp[3] > 32767): (32767) else: (_tmp[3])
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_SetPixelColor ( IMAGEPTR , COLOR , REMAININGOPACITY ) IMAGEPTR [ 0 ] = ( COLOR [ 0 ] > 32767 ) ? ( 32767 ) : ( COLOR [ 0 ] ) ;
## Error: did not expect [NewLine]!!!

IMAGEPTR[1] = if (COLOR[1] > 32767): (32767) else: (COLOR[1])
IMAGEPTR[2] = if (COLOR[2] > 32767): (32767) else: (COLOR[2])
var tmpAlpha* {.importcpp: "tmpAlpha", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

IMAGEPTR[3] = if (tmpAlpha > 32767): (32767) else: (tmpAlpha)
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_MoveToNextSampleNN ( ) if ( k < numSteps - 1 ) { mapper -> FixedPointIncrement ( pos , dir ) ; mapper -> ShiftVectorDown ( pos , spos ) ; dptr = data + spos [ 0 ] * inc [ 0 ] + spos [ 1 ] * inc [ 1 ] + spos [ 2 ] * inc [ 2 ] ; } [NewLine] # VTKKWRCHelper_MoveToNextSampleGONN ( ) if ( k < numSteps - 1 ) { mapper -> FixedPointIncrement ( pos , dir ) ; mapper -> ShiftVectorDown ( pos , spos ) ; dptr = data + spos [ 0 ] * inc [ 0 ] + spos [ 1 ] * inc [ 1 ] + spos [ 2 ] * inc [ 2 ] ; magPtr = gradientMag [ spos [ 2 ] ] + spos [ 0 ] * mInc [ 0 ] + spos [ 1 ] * mInc [ 1 ] ; } [NewLine] # VTKKWRCHelper_MoveToNextSampleShadeNN ( ) if ( k < numSteps - 1 ) { mapper -> FixedPointIncrement ( pos , dir ) ; mapper -> ShiftVectorDown ( pos , spos ) ; dptr = data + spos [ 0 ] * inc [ 0 ] + spos [ 1 ] * inc [ 1 ] + spos [ 2 ] * inc [ 2 ] ; dirPtr = gradientDir [ spos [ 2 ] ] + spos [ 0 ] * dInc [ 0 ] + spos [ 1 ] * dInc [ 1 ] ; } [NewLine] # VTKKWRCHelper_MoveToNextSampleGOShadeNN ( ) if ( k < numSteps - 1 ) { mapper -> FixedPointIncrement ( pos , dir ) ; mapper -> ShiftVectorDown ( pos , spos ) ; dptr = data + spos [ 0 ] * inc [ 0 ] + spos [ 1 ] * inc [ 1 ] + spos [ 2 ] * inc [ 2 ] ; magPtr = gradientMag [ spos [ 2 ] ] + spos [ 0 ] * mInc [ 0 ] + spos [ 1 ] * mInc [ 1 ] ; dirPtr = gradientDir [ spos [ 2 ] ] + spos [ 0 ] * dInc [ 0 ] + spos [ 1 ] * dInc [ 1 ] ; } [NewLine] # VTKKWRCHelper_InitializeVariables ( ) int i , j ;
## Error: did not expect [NewLine]!!!

var imagePtr* {.importcpp: "imagePtr", header: "vtkFixedPointVolumeRayCastHelper.h".}: ptr cushort

var imageInUseSize* {.importcpp: "imageInUseSize",
                    header: "vtkFixedPointVolumeRayCastHelper.h".}: array[2, cint]

var imageMemorySize* {.importcpp: "imageMemorySize",
                     header: "vtkFixedPointVolumeRayCastHelper.h".}: array[2, cint]

var imageViewportSize* {.importcpp: "imageViewportSize",
                       header: "vtkFixedPointVolumeRayCastHelper.h".}: array[2,
    cint]

var imageOrigin* {.importcpp: "imageOrigin",
                 header: "vtkFixedPointVolumeRayCastHelper.h".}: array[2, cint]

var dim* {.importcpp: "dim", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[3,
    cint]

var shift* {.importcpp: "shift", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    4, cfloat]

var scale* {.importcpp: "scale", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    4, cfloat]

mapper.GetRayCastImage().GetImageInUseSize(imageInUseSize)
mapper.GetRayCastImage().GetImageMemorySize(imageMemorySize)
mapper.GetRayCastImage().GetImageViewportSize(imageViewportSize)
mapper.GetRayCastImage().GetImageOrigin(imageOrigin)
var imData* {.importcpp: "imData", header: "vtkFixedPointVolumeRayCastHelper.h".}: ptr vtkImageData

var rGrid* {.importcpp: "rGrid", header: "vtkFixedPointVolumeRayCastHelper.h".}: ptr vtkRectilinearGrid

if imData:
  imData.GetDimensions(dim)
elif rGrid:
  rGrid.GetDimensions(dim)
mapper.GetTableShift(shift)
mapper.GetTableScale(scale)
var rowBounds* {.importcpp: "rowBounds",
               header: "vtkFixedPointVolumeRayCastHelper.h".}: ptr cint

var image* {.importcpp: "image", header: "vtkFixedPointVolumeRayCastHelper.h".}: ptr cushort

var renWin* {.importcpp: "renWin", header: "vtkFixedPointVolumeRayCastHelper.h".}: ptr vtkRenderWindow

var components* {.importcpp: "components",
                header: "vtkFixedPointVolumeRayCastHelper.h".}: cint

if imData:
  components = imData.GetNumberOfScalarComponents()
elif rGrid:
  components = rGrid.GetNumberOfScalarComponents()
var cropping* {.importcpp: "cropping", header: "vtkFixedPointVolumeRayCastHelper.h".}: cint

components = if (components < 4): components else: 4
var colorTable* {.importcpp: "colorTable",
                header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4,
    ptr cushort]

var scalarOpacityTable* {.importcpp: "scalarOpacityTable",
                        header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4,
    ptr cushort]

var c* {.importcpp: "c", header: "vtkFixedPointVolumeRayCastHelper.h".}: cint

c = 0
while c < 4:
  colorTable[c] = mapper.GetColorTable(c)
  (void)(colorTable[c])
  scalarOpacityTable[c] = mapper.GetScalarOpacityTable(c)
  inc(c)
var inc* {.importcpp: "inc", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[3,
    vtkIdType]

inc[0] = components
inc[1] = inc[0] * dim[0]
inc[2] = inc[1] * dim[1]
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializeWeights ( ) float weights [ 4 ] = { } ;
## Error: did not expect [NewLine]!!!

weights[0] = vol.GetProperty().GetComponentWeight(0)
weights[1] = vol.GetProperty().GetComponentWeight(1)
weights[2] = vol.GetProperty().GetComponentWeight(2)
weights[3] = vol.GetProperty().GetComponentWeight(3)
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializeVariablesGO ( ) unsigned short * gradientOpacityTable [ 4 ] ;
## Error: did not expect [NewLine]!!!

c = 0
while c < 4:
  gradientOpacityTable[c] = mapper.GetGradientOpacityTable(c)
  inc(c)
var gradientMag* {.importcpp: "gradientMag",
                 header: "vtkFixedPointVolumeRayCastHelper.h".}: ptr ptr cuchar

var mInc* {.importcpp: "mInc", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    3, vtkIdType]

if vol.GetProperty().GetIndependentComponents():
  mInc[0] = inc[0]
  mInc[1] = inc[1]
  mInc[2] = inc[2]
else:
  mInc[0] = 1
  mInc[1] = mInc[0] * dim[0]
  mInc[2] = mInc[1] * dim[1]
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializeVariablesShade ( ) unsigned short * diffuseShadingTable [ 4 ] ;
## Error: did not expect [NewLine]!!!

var specularShadingTable* {.importcpp: "specularShadingTable",
                          header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4,
    ptr cushort]

c = 0
while c < 4:
  diffuseShadingTable[c] = mapper.GetDiffuseShadingTable(c)
  specularShadingTable[c] = mapper.GetSpecularShadingTable(c)
  inc(c)
var gradientDir* {.importcpp: "gradientDir",
                 header: "vtkFixedPointVolumeRayCastHelper.h".}: ptr ptr cushort

var dInc* {.importcpp: "dInc", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    3, vtkIdType]

if vol.GetProperty().GetIndependentComponents():
  dInc[0] = inc[0]
  dInc[1] = inc[1]
  dInc[2] = inc[2]
else:
  dInc[0] = 1
  dInc[1] = dInc[0] * dim[0]
  dInc[2] = dInc[1] * dim[1]
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializeTrilinVariables ( ) vtkIdType Binc = components ;
## Error: did not expect [NewLine]!!!

var Cinc* {.importcpp: "Cinc", header: "vtkFixedPointVolumeRayCastHelper.h".}: vtkIdType

var Dinc* {.importcpp: "Dinc", header: "vtkFixedPointVolumeRayCastHelper.h".}: vtkIdType

var Einc* {.importcpp: "Einc", header: "vtkFixedPointVolumeRayCastHelper.h".}: vtkIdType

var Finc* {.importcpp: "Finc", header: "vtkFixedPointVolumeRayCastHelper.h".}: vtkIdType

var Ginc* {.importcpp: "Ginc", header: "vtkFixedPointVolumeRayCastHelper.h".}: vtkIdType

var Hinc* {.importcpp: "Hinc", header: "vtkFixedPointVolumeRayCastHelper.h".}: vtkIdType

## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializeTrilinVariablesGO ( ) vtkIdType magOffset ;
## Error: did not expect [NewLine]!!!

if vol.GetProperty().GetIndependentComponents():
  magOffset = components
else:
  magOffset = 1
var mBFinc* {.importcpp: "mBFinc", header: "vtkFixedPointVolumeRayCastHelper.h".}: vtkIdType

var mCGinc* {.importcpp: "mCGinc", header: "vtkFixedPointVolumeRayCastHelper.h".}: vtkIdType

var mDHinc* {.importcpp: "mDHinc", header: "vtkFixedPointVolumeRayCastHelper.h".}: vtkIdType

## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializeTrilinVariablesShade ( ) vtkIdType dirOffset ;
## Error: did not expect [NewLine]!!!

if vol.GetProperty().GetIndependentComponents():
  dirOffset = components
else:
  dirOffset = 1
var dBFinc* {.importcpp: "dBFinc", header: "vtkFixedPointVolumeRayCastHelper.h".}: vtkIdType

var dCGinc* {.importcpp: "dCGinc", header: "vtkFixedPointVolumeRayCastHelper.h".}: vtkIdType

var dDHinc* {.importcpp: "dDHinc", header: "vtkFixedPointVolumeRayCastHelper.h".}: vtkIdType

## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_OuterInitialization ( ) if ( j % threadCount != threadID ) { continue ; } if ( ! threadID ) { if ( renWin -> CheckAbortStatus ( ) ) { break ; } } else if ( renWin -> GetAbortRender ( ) ) { break ; } imagePtr = image + 4 * ( j * imageMemorySize [ 0 ] + rowBounds [ j * 2 ] ) ;
## Error: did not expect [NewLine]!!!

## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InnerInitialization ( ) unsigned int numSteps ;
## Error: did not expect [NewLine]!!!

var pos* {.importcpp: "pos", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[3,
    cuint]

var dir* {.importcpp: "dir", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[3,
    cuint]

mapper.ComputeRayInfo(i, j, pos, dir, addr(numSteps))
if numSteps == 0:
  (imagePtr)[] = 0
  (imagePtr + 1)[] = 0
  (imagePtr + 2)[] = 0
  (imagePtr + 3)[] = 0
  inc(imagePtr, 4)
  continue
var spos* {.importcpp: "spos", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    3, cuint]

var k* {.importcpp: "k", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializeMIPOneNN ( ) mapper -> ShiftVectorDown ( pos , spos ) ;
## Error: did not expect [NewLine]!!!

var dptr* {.importcpp: "dptr", header: "vtkFixedPointVolumeRayCastHelper.h".}: ptr T

var maxValue* {.importcpp: "maxValue", header: "vtkFixedPointVolumeRayCastHelper.h".}: T

## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializeMIPMultiNN ( ) mapper -> ShiftVectorDown ( pos , spos ) ;
## Error: did not expect [NewLine]!!!

var dptr* {.importcpp: "dptr", header: "vtkFixedPointVolumeRayCastHelper.h".}: ptr T

var maxValue* {.importcpp: "maxValue", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    4, T]

c = 0
while c < components:
  maxValue[c] = (dptr + c)[]
  inc(c)
## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializeMIPOneTrilin ( ) T * dptr ;
## Error: did not expect [NewLine]!!!

var oldSPos* {.importcpp: "oldSPos", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    3, cuint]

oldSPos[0] = (pos[0] shr VTKKW_FP_SHIFT) + 1
oldSPos[1] = 0
oldSPos[2] = 0
var
  w1X* {.importcpp: "w1X", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w1Y* {.importcpp: "w1Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w1Z* {.importcpp: "w1Z", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

var
  w2X* {.importcpp: "w2X", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w2Y* {.importcpp: "w2Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w2Z* {.importcpp: "w2Z", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

var
  w1Xw1Y* {.importcpp: "w1Xw1Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w2Xw1Y* {.importcpp: "w2Xw1Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w1Xw2Y* {.importcpp: "w1Xw2Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w2Xw2Y* {.importcpp: "w2Xw2Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

var maxValue* {.importcpp: "maxValue", header: "vtkFixedPointVolumeRayCastHelper.h".}: cushort

var val* {.importcpp: "val", header: "vtkFixedPointVolumeRayCastHelper.h".}: cushort

var
  A* {.importcpp: "A", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  B* {.importcpp: "B", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  C* {.importcpp: "C", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  D* {.importcpp: "D", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  E* {.importcpp: "E", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  F* {.importcpp: "F", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  G* {.importcpp: "G", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  H* {.importcpp: "H", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializeMIPMultiTrilin ( ) T * dptr ;
## Error: did not expect [NewLine]!!!

var oldSPos* {.importcpp: "oldSPos", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    3, cuint]

oldSPos[0] = (pos[0] shr VTKKW_FP_SHIFT) + 1
oldSPos[1] = 0
oldSPos[2] = 0
var
  w1X* {.importcpp: "w1X", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w1Y* {.importcpp: "w1Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w1Z* {.importcpp: "w1Z", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

var
  w2X* {.importcpp: "w2X", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w2Y* {.importcpp: "w2Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w2Z* {.importcpp: "w2Z", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

var
  w1Xw1Y* {.importcpp: "w1Xw1Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w2Xw1Y* {.importcpp: "w2Xw1Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w1Xw2Y* {.importcpp: "w1Xw2Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w2Xw2Y* {.importcpp: "w2Xw2Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

var maxValue* {.importcpp: "maxValue", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    4, cushort]

var val* {.importcpp: "val", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4,
    cushort]

var
  A* {.importcpp: "A", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4, cuint]
  B* {.importcpp: "B", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4, cuint]
  C* {.importcpp: "C", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4, cuint]
  D* {.importcpp: "D", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4, cuint]
  E* {.importcpp: "E", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4, cuint]
  F* {.importcpp: "F", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4, cuint]
  G* {.importcpp: "G", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4, cuint]
  H* {.importcpp: "H", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4, cuint]

## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializeCompositeGONN ( ) unsigned char * magPtr = gradientMag [ spos [ 2 ] ] + spos [ 0 ] * mInc [ 0 ] + spos [ 1 ] * mInc [ 1 ] ;
## Error: did not expect [NewLine]!!!

## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializeCompositeShadeNN ( ) unsigned short * dirPtr = gradientDir [ spos [ 2 ] ] + spos [ 0 ] * dInc [ 0 ] + spos [ 1 ] * dInc [ 1 ] ;
## Error: did not expect [NewLine]!!!

## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializeCompositeOneNN ( ) mapper -> ShiftVectorDown ( pos , spos ) ;
## Error: did not expect [NewLine]!!!

var dptr* {.importcpp: "dptr", header: "vtkFixedPointVolumeRayCastHelper.h".}: ptr T

var color* {.importcpp: "color", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    3, cuint]

var remainingOpacity* {.importcpp: "remainingOpacity",
                      header: "vtkFixedPointVolumeRayCastHelper.h".}: cushort

var tmp* {.importcpp: "tmp", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4,
    cushort]

## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializeCompositeMultiNN ( ) mapper -> ShiftVectorDown ( pos , spos ) ;
## Error: did not expect [NewLine]!!!

var dptr* {.importcpp: "dptr", header: "vtkFixedPointVolumeRayCastHelper.h".}: ptr T

var color* {.importcpp: "color", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    3, cuint]

var remainingOpacity* {.importcpp: "remainingOpacity",
                      header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

var tmp* {.importcpp: "tmp", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4,
    cushort]

var val* {.importcpp: "val", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4,
    cushort]

## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializeCompositeOneTrilin ( ) T * dptr ;
## Error: did not expect [NewLine]!!!

var oldSPos* {.importcpp: "oldSPos", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    3, cuint]

oldSPos[0] = (pos[0] shr VTKKW_FP_SHIFT) + 1
oldSPos[1] = 0
oldSPos[2] = 0
var
  w1X* {.importcpp: "w1X", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w1Y* {.importcpp: "w1Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w1Z* {.importcpp: "w1Z", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

var
  w2X* {.importcpp: "w2X", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w2Y* {.importcpp: "w2Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w2Z* {.importcpp: "w2Z", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

var
  w1Xw1Y* {.importcpp: "w1Xw1Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w2Xw1Y* {.importcpp: "w2Xw1Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w1Xw2Y* {.importcpp: "w1Xw2Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w2Xw2Y* {.importcpp: "w2Xw2Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

var val* {.importcpp: "val", header: "vtkFixedPointVolumeRayCastHelper.h".}: cushort

var
  A* {.importcpp: "A", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  B* {.importcpp: "B", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  C* {.importcpp: "C", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  D* {.importcpp: "D", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  E* {.importcpp: "E", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  F* {.importcpp: "F", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  G* {.importcpp: "G", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  H* {.importcpp: "H", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

var color* {.importcpp: "color", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    3, cuint]

var remainingOpacity* {.importcpp: "remainingOpacity",
                      header: "vtkFixedPointVolumeRayCastHelper.h".}: cushort

var tmp* {.importcpp: "tmp", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4,
    cushort]

## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializeCompositeOneGOTrilin ( ) unsigned char * magPtrABCD = nullptr , * magPtrEFGH = nullptr ;
## Error: did not expect [NewLine]!!!

var mag* {.importcpp: "mag", header: "vtkFixedPointVolumeRayCastHelper.h".}: cushort

var
  mA* {.importcpp: "mA", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  mB* {.importcpp: "mB", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  mC* {.importcpp: "mC", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  mD* {.importcpp: "mD", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  mE* {.importcpp: "mE", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  mF* {.importcpp: "mF", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  mG* {.importcpp: "mG", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  mH* {.importcpp: "mH", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializeCompositeOneShadeTrilin ( ) unsigned short * dirPtrABCD = 0 , * dirPtrEFGH = 0 ;
## Error: did not expect [NewLine]!!!

var
  normalA* {.importcpp: "normalA", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  normalB* {.importcpp: "normalB", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  normalC* {.importcpp: "normalC", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  normalD* {.importcpp: "normalD", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

var
  normalE* {.importcpp: "normalE", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  normalF* {.importcpp: "normalF", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  normalG* {.importcpp: "normalG", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  normalH* {.importcpp: "normalH", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializeCompositeMultiTrilin ( ) T * dptr ;
## Error: did not expect [NewLine]!!!

var oldSPos* {.importcpp: "oldSPos", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    3, cuint]

oldSPos[0] = (pos[0] shr VTKKW_FP_SHIFT) + 1
oldSPos[1] = 0
oldSPos[2] = 0
var
  w1X* {.importcpp: "w1X", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w1Y* {.importcpp: "w1Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w1Z* {.importcpp: "w1Z", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

var
  w2X* {.importcpp: "w2X", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w2Y* {.importcpp: "w2Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w2Z* {.importcpp: "w2Z", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

var
  w1Xw1Y* {.importcpp: "w1Xw1Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w2Xw1Y* {.importcpp: "w2Xw1Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w1Xw2Y* {.importcpp: "w1Xw2Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint
  w2Xw2Y* {.importcpp: "w2Xw2Y", header: "vtkFixedPointVolumeRayCastHelper.h".}: cuint

var val* {.importcpp: "val", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4,
    cushort]

var A* {.importcpp: "A", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4, cuint]

var B* {.importcpp: "B", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4, cuint]

var C* {.importcpp: "C", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4, cuint]

var D* {.importcpp: "D", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4, cuint]

var E* {.importcpp: "E", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4, cuint]

var F* {.importcpp: "F", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4, cuint]

var G* {.importcpp: "G", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4, cuint]

var H* {.importcpp: "H", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4, cuint]

var color* {.importcpp: "color", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
    3, cuint]

var remainingOpacity* {.importcpp: "remainingOpacity",
                      header: "vtkFixedPointVolumeRayCastHelper.h".}: cushort

var tmp* {.importcpp: "tmp", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4,
    cushort]

## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializeCompositeMultiGOTrilin ( ) unsigned char * magPtrABCD = 0 , * magPtrEFGH = 0 ;
## Error: did not expect [NewLine]!!!

var mag* {.importcpp: "mag", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4,
    cushort]

var
  mA* {.importcpp: "mA", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4,
      cuint]
  mB* {.importcpp: "mB", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4,
      cuint]
  mC* {.importcpp: "mC", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4,
      cuint]
  mD* {.importcpp: "mD", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4,
      cuint]
  mE* {.importcpp: "mE", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4,
      cuint]
  mF* {.importcpp: "mF", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4,
      cuint]
  mG* {.importcpp: "mG", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4,
      cuint]
  mH* {.importcpp: "mH", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[4,
      cuint]

## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializeCompositeMultiShadeTrilin ( ) unsigned short * dirPtrABCD = 0 , * dirPtrEFGH = 0 ;
## Error: did not expect [NewLine]!!!

var
  normalA* {.importcpp: "normalA", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
      4, cuint]
  normalB* {.importcpp: "normalB", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
      4, cuint]
  normalC* {.importcpp: "normalC", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
      4, cuint]
  normalD* {.importcpp: "normalD", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
      4, cuint]

var
  normalE* {.importcpp: "normalE", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
      4, cuint]
  normalF* {.importcpp: "normalF", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
      4, cuint]
  normalG* {.importcpp: "normalG", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
      4, cuint]
  normalH* {.importcpp: "normalH", header: "vtkFixedPointVolumeRayCastHelper.h".}: array[
      4, cuint]

## !!!Ignored construct:  [NewLine] # VTKKWRCHelper_InitializationAndLoopStartNN ( ) VTKKWRCHelper_InitializeVariables ( ) ;
## Error: did not expect [NewLine]!!!

## !!!Ignored construct:  for ( j = 0 ;
## Error: token expected: } but got: [EOF]!!!

## !!!Ignored construct:  j < imageInUseSize [ 1 ] ;
## Error: identifier expected, but got: <!!!

## !!!Ignored construct:  j ++ ) { VTKKWRCHelper_OuterInitialization ( ) ; for ( i = rowBounds [ j * 2 ] ; i <= rowBounds [ j * 2 + 1 ] ; i ++ ) { VTKKWRCHelper_InnerInitialization ( ) ; [NewLine] # VTKKWRCHelper_InitializationAndLoopStartGONN ( ) VTKKWRCHelper_InitializeVariables ( ) ; VTKKWRCHelper_InitializeVariablesGO ( ) ; for ( j = 0 ; j < imageInUseSize [ 1 ] ; j ++ ) { VTKKWRCHelper_OuterInitialization ( ) ; for ( i = rowBounds [ j * 2 ] ; i <= rowBounds [ j * 2 + 1 ] ; i ++ ) { VTKKWRCHelper_InnerInitialization ( ) ; [NewLine] # VTKKWRCHelper_InitializationAndLoopStartShadeNN ( ) VTKKWRCHelper_InitializeVariables ( ) ; VTKKWRCHelper_InitializeVariablesShade ( ) ; for ( j = 0 ; j < imageInUseSize [ 1 ] ; j ++ ) { VTKKWRCHelper_OuterInitialization ( ) ; for ( i = rowBounds [ j * 2 ] ; i <= rowBounds [ j * 2 + 1 ] ; i ++ ) { VTKKWRCHelper_InnerInitialization ( ) ; [NewLine] # VTKKWRCHelper_InitializationAndLoopStartGOShadeNN ( ) VTKKWRCHelper_InitializeVariables ( ) ; VTKKWRCHelper_InitializeVariablesGO ( ) ; VTKKWRCHelper_InitializeVariablesShade ( ) ; for ( j = 0 ; j < imageInUseSize [ 1 ] ; j ++ ) { VTKKWRCHelper_OuterInitialization ( ) ; for ( i = rowBounds [ j * 2 ] ; i <= rowBounds [ j * 2 + 1 ] ; i ++ ) { VTKKWRCHelper_InnerInitialization ( ) ; [NewLine] # VTKKWRCHelper_InitializationAndLoopStartTrilin ( ) VTKKWRCHelper_InitializeVariables ( ) ; VTKKWRCHelper_InitializeTrilinVariables ( ) ; for ( j = 0 ; j < imageInUseSize [ 1 ] ; j ++ ) { VTKKWRCHelper_OuterInitialization ( ) ; for ( i = rowBounds [ j * 2 ] ; i <= rowBounds [ j * 2 + 1 ] ; i ++ ) { VTKKWRCHelper_InnerInitialization ( ) ; [NewLine] # VTKKWRCHelper_InitializationAndLoopStartGOTrilin ( ) VTKKWRCHelper_InitializeVariables ( ) ; VTKKWRCHelper_InitializeVariablesGO ( ) ; VTKKWRCHelper_InitializeTrilinVariables ( ) ; VTKKWRCHelper_InitializeTrilinVariablesGO ( ) ; for ( j = 0 ; j < imageInUseSize [ 1 ] ; j ++ ) { VTKKWRCHelper_OuterInitialization ( ) ; for ( i = rowBounds [ j * 2 ] ; i <= rowBounds [ j * 2 + 1 ] ; i ++ ) { VTKKWRCHelper_InnerInitialization ( ) ; [NewLine] # VTKKWRCHelper_InitializationAndLoopStartShadeTrilin ( ) VTKKWRCHelper_InitializeVariables ( ) ; VTKKWRCHelper_InitializeVariablesShade ( ) ; VTKKWRCHelper_InitializeTrilinVariables ( ) ; VTKKWRCHelper_InitializeTrilinVariablesShade ( ) ; for ( j = 0 ; j < imageInUseSize [ 1 ] ; j ++ ) { VTKKWRCHelper_OuterInitialization ( ) ; for ( i = rowBounds [ j * 2 ] ; i <= rowBounds [ j * 2 + 1 ] ; i ++ ) { VTKKWRCHelper_InnerInitialization ( ) ; [NewLine] # VTKKWRCHelper_InitializationAndLoopStartGOShadeTrilin ( ) VTKKWRCHelper_InitializeVariables ( ) ; VTKKWRCHelper_InitializeVariablesShade ( ) ; VTKKWRCHelper_InitializeVariablesGO ( ) ; VTKKWRCHelper_InitializeTrilinVariables ( ) ; VTKKWRCHelper_InitializeTrilinVariablesShade ( ) ; VTKKWRCHelper_InitializeTrilinVariablesGO ( ) ; for ( j = 0 ; j < imageInUseSize [ 1 ] ; j ++ ) { VTKKWRCHelper_OuterInitialization ( ) ; for ( i = rowBounds [ j * 2 ] ; i <= rowBounds [ j * 2 + 1 ] ; i ++ ) { VTKKWRCHelper_InnerInitialization ( ) ; [NewLine] # VTKKWRCHelper_IncrementAndLoopEnd ( ) imagePtr += 4 ; } if ( ( j / threadCount ) % 8 == 7 && threadID == 0 ) { double fargs [ 1 ] ; fargs [ 0 ] = static_cast < double > [end of template] ( j ) / static_cast < float > [end of template] ( imageInUseSize [ 1 ] - 1 ) ; mapper -> InvokeEvent ( vtkCommand :: VolumeMapperRenderProgressEvent , fargs ) ; } } [NewLine] # VTKKWRCHelper_CroppingCheckTrilin ( POS ) if ( cropping ) { if ( mapper -> CheckIfCropped ( POS ) ) { continue ; } } [NewLine] # VTKKWRCHelper_CroppingCheckNN ( POS ) if ( cropping ) { if ( mapper -> CheckIfCropped ( POS ) ) { continue ; } } [NewLine] # VTKKWRCHelper_SpaceLeapSetup ( ) unsigned int mmpos [ 3 ] ; mmpos [ 0 ] = ( pos [ 0 ] >> VTKKW_FPMM_SHIFT ) + 1 ; mmpos [ 1 ] = 0 ; mmpos [ 2 ] = 0 ; int mmvalid = 0 ; [NewLine] # VTKKWRCHelper_SpaceLeapSetupMulti ( ) unsigned int mmpos [ 3 ] ; mmpos [ 0 ] = ( pos [ 0 ] >> VTKKW_FPMM_SHIFT ) + 1 ; mmpos [ 1 ] = 0 ; mmpos [ 2 ] = 0 ; int mmvalid [ 4 ] = { 0 , 0 , 0 , 0 } ; [NewLine] # VTKKWRCHelper_SpaceLeapCheck ( ) if ( pos [ 0 ] >> VTKKW_FPMM_SHIFT != mmpos [ 0 ] || pos [ 1 ] >> VTKKW_FPMM_SHIFT != mmpos [ 1 ] || pos [ 2 ] >> VTKKW_FPMM_SHIFT != mmpos [ 2 ] ) { mmpos [ 0 ] = pos [ 0 ] >> VTKKW_FPMM_SHIFT ; mmpos [ 1 ] = pos [ 1 ] >> VTKKW_FPMM_SHIFT ; mmpos [ 2 ] = pos [ 2 ] >> VTKKW_FPMM_SHIFT ; mmvalid = mapper -> CheckMinMaxVolumeFlag ( mmpos , 0 ) ; } if ( ! mmvalid ) { continue ; } [NewLine] # VTKKWRCHelper_MIPSpaceLeapCheck ( MAXIDX , MAXIDXDEF , FLIP ) if ( pos [ 0 ] >> VTKKW_FPMM_SHIFT != mmpos [ 0 ] || pos [ 1 ] >> VTKKW_FPMM_SHIFT != mmpos [ 1 ] || pos [ 2 ] >> VTKKW_FPMM_SHIFT != mmpos [ 2 ] ) { mmpos [ 0 ] = pos [ 0 ] >> VTKKW_FPMM_SHIFT ; mmpos [ 1 ] = pos [ 1 ] >> VTKKW_FPMM_SHIFT ; mmpos [ 2 ] = pos [ 2 ] >> VTKKW_FPMM_SHIFT ; mmvalid = ( MAXIDXDEF ) ? ( mapper -> CheckMIPMinMaxVolumeFlag ( mmpos , 0 , MAXIDX , FLIP ) ) : ( 1 ) ; } if ( ! mmvalid ) { continue ; } [NewLine] # VTKKWRCHelper_MIPSpaceLeapPopulateMulti ( MAXIDX , FLIP ) if ( pos [ 0 ] >> VTKKW_FPMM_SHIFT != mmpos [ 0 ] || pos [ 1 ] >> VTKKW_FPMM_SHIFT != mmpos [ 1 ] || pos [ 2 ] >> VTKKW_FPMM_SHIFT != mmpos [ 2 ] ) { mmpos [ 0 ] = pos [ 0 ] >> VTKKW_FPMM_SHIFT ; mmpos [ 1 ] = pos [ 1 ] >> VTKKW_FPMM_SHIFT ; mmpos [ 2 ] = pos [ 2 ] >> VTKKW_FPMM_SHIFT ; for ( c = 0 ; c < components ; c ++ ) { mmvalid [ c ] = mapper -> CheckMIPMinMaxVolumeFlag ( mmpos , c , MAXIDX [ c ] , FLIP ) ; } } [NewLine] # VTKKWRCHelper_MIPSpaceLeapCheckMulti ( COMP , FLIP ) mmvalid [ COMP ] [NewLine] # vtkObject.h [NewLine] # vtkRenderingVolumeModule.h  For export macro [NewLine] class vtkFixedPointVolumeRayCastMapper ; class vtkVolume ; class VTKRENDERINGVOLUME_EXPORT vtkFixedPointVolumeRayCastHelper : public vtkObject { public : static vtkFixedPointVolumeRayCastHelper * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkFixedPointVolumeRayCastHelper :: IsTypeOf ( type ) ; } static vtkFixedPointVolumeRayCastHelper * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkFixedPointVolumeRayCastHelper * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkFixedPointVolumeRayCastHelper * NewInstance ( ) const { return vtkFixedPointVolumeRayCastHelper :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFixedPointVolumeRayCastHelper :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFixedPointVolumeRayCastHelper :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; virtual void GenerateImage ( int , int , vtkVolume * , vtkFixedPointVolumeRayCastMapper * ) { } protected : vtkFixedPointVolumeRayCastHelper ( ) ; ~ vtkFixedPointVolumeRayCastHelper ( ) override ; private : vtkFixedPointVolumeRayCastHelper ( const vtkFixedPointVolumeRayCastHelper & ) = delete ; void operator = ( const vtkFixedPointVolumeRayCastHelper & ) = delete ; } ; # [NewLine]
## Error: expected ';'!!!
