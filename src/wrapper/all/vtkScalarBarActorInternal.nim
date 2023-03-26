import
  vtkColor, vtkRenderingAnnotationModule, vtkSmartPointer, vtkStdString

discard "forward decl of vtkActor2D"
discard "forward decl of vtkCellArray"
discard "forward decl of vtkTextActor"
discard "forward decl of vtkPoints"
discard "forward decl of vtkPolyData"
discard "forward decl of vtkPolyDataMapper2D"
discard "forward decl of vtkUnsignedCharArray"
discard "forward decl of vtkViewport"
type
  vtkSmartVector*[T] {.importcpp: "vtkSmartVector<\'0>",
                      header: "vtkScalarBarActorInternal.h", bycopy.} = object of vector[
      vtkSmartPointer[T]] ## *\brief Convert to an array of "dumb" pointers for functions
                         ##   that need a contiguous array pointer as input.
                         ##


proc PointerArray*[T](this: var vtkSmartVector[T]): ptr ptr T {.
    importcpp: "PointerArray", header: "vtkScalarBarActorInternal.h".}
## / A structure to represent pixel coordinates for text or swatch bounds.

type
  vtkScalarBarBox* {.importcpp: "vtkScalarBarBox",
                    header: "vtkScalarBarActorInternal.h", bycopy.} = object ## / The position of the box in viewport (pixel)
                                                                        ## coordinates.
    Posn* {.importc: "Posn".}: vtkTuple[cint, 2] ## *\brief Size of the box, stored as (thickness, length) not (width, height).
                                            ##
                                            ##  Thickness is a measure of the box size perpendicular to the long axis of the scalar bar.
                                            ##  When the scalar bar orientation is horizontal, thickness measures height.
                                            ##  Length is a measure of the box size parallel to the long axis of the scalar bar.
                                            ##  When the scalar bar orientation is horizontal, length measures width.
                                            ##
    Size* {.importc: "Size".}: vtkTuple[cint, 2]


## / Internal state for the scalar bar actor shared with subclasses.

type
  vtkScalarBarActorInternal* {.importcpp: "vtkScalarBarActorInternal",
                              header: "vtkScalarBarActorInternal.h", bycopy.} = object
    Viewport* {.importc: "Viewport".}: ptr vtkViewport ## / The thickness and length of the (square) NaN swatch.
    NanSwatchSize* {.importc: "NanSwatchSize".}: cdouble ## / The thickness and length of the (square) Below Range swatch.
    BelowRangeSwatchSize* {.importc: "BelowRangeSwatchSize".}: cdouble ## / The thickness and length of the (square) Above Range swatch.
    AboveRangeSwatchSize* {.importc: "AboveRangeSwatchSize".}: cdouble ## / Space in pixels between swatches when in indexed lookup mode.
    SwatchPad* {.importc: "SwatchPad".}: cdouble ## / Number of annotated values (at least
                                             ## / lut->GetNumberOfAnnotatedValues(), but maybe more)
    NumNotes* {.importc: "NumNotes".}: cint ## / Number of color swatches to draw for either the continuous or
                                        ## / categorical scalar bar, not including a NaN swatch.
    NumColors* {.importc: "NumColors".}: cint ## / Either NumColors or NumColors + 1, depending on whether the NaN
                                          ## / swatch is to be drawn.
    NumSwatches* {.importc: "NumSwatches".}: cint ## / Permutation of (0, 1) that transforms thickness,length into
                                              ## / width,height.
    TL* {.importc: "TL".}: array[2, cint] ##  VERTICAL => TL={0,1}, HORIZONTAL => TL={1,0}, Size[TL[0]] == width, Size[TL[1]] ==
                                     ##  height
                                     ## / Point coordinates for the scalar bar actor
    SwatchPts* {.importc: "SwatchPts".}: ptr vtkPoints ## / Cells representing color swatches (for the scalar bar actor)
    Polys* {.importc: "Polys".}: ptr vtkCellArray ## / Colors of swatches in \a Polys
    SwatchColors* {.importc: "SwatchColors".}: ptr vtkUnsignedCharArray ## / The bounding box of the entire scalar bar frame.
    Frame* {.importc: "Frame".}: vtkScalarBarBox ## / The bounding box of the scalar bar (excluding NaN swatch)
    ScalarBarBox* {.importc: "ScalarBarBox".}: vtkScalarBarBox ## / The bounding box of the NaN swatch
    NanBox* {.importc: "NanBox".}: vtkScalarBarBox ## / The bounding box of the Below Range
    BelowRangeSwatchBox* {.importc: "BelowRangeSwatchBox".}: vtkScalarBarBox ## / The
                                                                         ## bounding box of the Above Range
    AboveRangeSwatchBox* {.importc: "AboveRangeSwatchBox".}: vtkScalarBarBox ## / The
                                                                         ## bounding box of tick mark anchor points (tick labels are not
                                                                         ## / fully
                                                                         ## contained)
    TickBox* {.importc: "TickBox".}: vtkScalarBarBox ## / The bounding box of the scalar bar title text.
    TitleBox* {.importc: "TitleBox".}: vtkScalarBarBox ## / Map from viewport coordinates to label text of each annotation.
    Labels* {.importc: "Labels".}: map[cdouble, vtkStdString] ## / Map from viewport coordinates to the leader line color of each
                                                         ## / annotation.
    LabelColors* {.importc: "LabelColors".}: map[cdouble, vtkColor3ub] ## /@}
                                                                  ## / Cache of classes holding geometry assembled and ready for rendering.
                                                                  ## /@{
    TextActors* {.importc: "TextActors".}: vtkScalarBarActorInternalActorVector
    TextActorAnchors* {.importc: "TextActorAnchors".}: vtkScalarBarActorInternalDoubleVector
    AnnotationBoxes* {.importc: "AnnotationBoxes".}: ptr vtkPolyData
    AnnotationBoxesMapper* {.importc: "AnnotationBoxesMapper".}: ptr vtkPolyDataMapper2D
    AnnotationBoxesActor* {.importc: "AnnotationBoxesActor".}: ptr vtkActor2D
    AnnotationLeaders* {.importc: "AnnotationLeaders".}: ptr vtkPolyData
    AnnotationLeadersMapper* {.importc: "AnnotationLeadersMapper".}: ptr vtkPolyDataMapper2D
    AnnotationLeadersActor* {.importc: "AnnotationLeadersActor".}: ptr vtkActor2D
    AnnotationLabels* {.importc: "AnnotationLabels".}: vtkScalarBarActorInternalActorVector
    AnnotationAnchors* {.importc: "AnnotationAnchors".}: vtkScalarBarActorInternalDoubleVector
    AnnotationColors* {.importc: "AnnotationColors".}: vtkScalarBarActorInternalColorVector
    NanSwatch* {.importc: "NanSwatch".}: ptr vtkPolyData
    NanSwatchMapper* {.importc: "NanSwatchMapper".}: ptr vtkPolyDataMapper2D
    NanSwatchActor* {.importc: "NanSwatchActor".}: ptr vtkActor2D
    BelowRangeSwatch* {.importc: "BelowRangeSwatch".}: ptr vtkPolyData
    BelowRangeSwatchMapper* {.importc: "BelowRangeSwatchMapper".}: ptr vtkPolyDataMapper2D
    BelowRangeSwatchActor* {.importc: "BelowRangeSwatchActor".}: ptr vtkActor2D
    AboveRangeSwatch* {.importc: "AboveRangeSwatch".}: ptr vtkPolyData
    AboveRangeSwatchMapper* {.importc: "AboveRangeSwatchMapper".}: ptr vtkPolyDataMapper2D
    AboveRangeSwatchActor* {.importc: "AboveRangeSwatchActor".}: ptr vtkActor2D ## /@}


proc constructvtkScalarBarActorInternal*(): vtkScalarBarActorInternal {.
    constructor, importcpp: "vtkScalarBarActorInternal(@)",
    header: "vtkScalarBarActorInternal.h".}
type
  vtkScalarBarActorInternalActorVector* = vtkSmartVector[vtkTextActor]
  vtkScalarBarActorInternalDoubleVector* = vector[cdouble]
  vtkScalarBarActorInternalColorVector* = vector[vtkColor3ub]
