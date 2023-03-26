## *
##  @class   vtkKMeansDistanceFunctorCalculator
##  @brief   measure distance from k-means cluster centers using a user-specified expression
##
##  This is a subclass of the default k-means distance functor that allows
##  the user to specify a distance function as a string. The provided
##  expression is evaluated whenever the parenthesis operator is invoked
##  but this is much slower than the default distance calculation.
##
##  User-specified distance expressions should be written in terms of
##  two vector variables named "x" and "y".
##  The length of the vectors will be determined by the k-means request
##  and all columns of interest in the request must contain values that
##  may be converted to a floating point representation. (Strings and
##  vtkObject pointers are not allowed.)
##  An example distance expression is "sqrt( (x0-y0)^2 + (x1-y1)^2 )"
##  which computes Euclidian distance in a plane defined by the first
##  2 coordinates of the vectors specified.
##

import
  vtkFiltersStatisticsModule, vtkKMeansDistanceFunctor

discard "forward decl of vtkFunctionParser"
discard "forward decl of vtkDoubleArray"
type
  vtkKMeansDistanceFunctorCalculator* {.importcpp: "vtkKMeansDistanceFunctorCalculator", header: "vtkKMeansDistanceFunctorCalculator.h",
                                       bycopy.} = object of vtkKMeansDistanceFunctor
    vtkKMeansDistanceFunctorCalculator* {.
        importc: "vtkKMeansDistanceFunctorCalculator".}: VTK_NEWINSTANCE


proc New*(): ptr vtkKMeansDistanceFunctorCalculator {.
    importcpp: "vtkKMeansDistanceFunctorCalculator::New(@)",
    header: "vtkKMeansDistanceFunctorCalculator.h".}
type
  vtkKMeansDistanceFunctorCalculatorSuperclass* = vtkKMeansDistanceFunctor

proc IsTypeOf*(`type`: cstring): vtkTypeBool {.
    importcpp: "vtkKMeansDistanceFunctorCalculator::IsTypeOf(@)",
    header: "vtkKMeansDistanceFunctorCalculator.h".}
proc IsA*(this: var vtkKMeansDistanceFunctorCalculator; `type`: cstring): vtkTypeBool {.
    importcpp: "IsA", header: "vtkKMeansDistanceFunctorCalculator.h".}
proc SafeDownCast*(o: ptr vtkObjectBase): ptr vtkKMeansDistanceFunctorCalculator {.
    importcpp: "vtkKMeansDistanceFunctorCalculator::SafeDownCast(@)",
    header: "vtkKMeansDistanceFunctorCalculator.h".}
## !!!Ignored construct:  * NewInstance ( ) const { return vtkKMeansDistanceFunctorCalculator :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkKMeansDistanceFunctor :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkKMeansDistanceFunctorCalculator :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkKMeansDistanceFunctorCalculator :: New ( ) ; } public : ;
## Error: identifier expected, but got: *!!!

proc PrintSelf*(this: var vtkKMeansDistanceFunctorCalculator; os: var ostream;
               indent: vtkIndent) {.importcpp: "PrintSelf", header: "vtkKMeansDistanceFunctorCalculator.h".}
proc `()`*(this: var vtkKMeansDistanceFunctorCalculator; a2: var cdouble;
          a3: ptr vtkVariantArray; a4: ptr vtkVariantArray) {.importcpp: "#(@)",
    header: "vtkKMeansDistanceFunctorCalculator.h".}
proc SetDistanceExpression*(this: var vtkKMeansDistanceFunctorCalculator;
                           _arg: cstring) {.importcpp: "SetDistanceExpression",
    header: "vtkKMeansDistanceFunctorCalculator.h".}
proc GetDistanceExpression*(this: var vtkKMeansDistanceFunctorCalculator): cstring {.
    importcpp: "GetDistanceExpression",
    header: "vtkKMeansDistanceFunctorCalculator.h".}
  ## /@}
  ## /@{
  ## *
  ##  Set/get the string containing an expression which evaluates to the
  ##  distance metric used for k-means computation. The scalar variables
  ##  "x0", "x1", ... "xn" and "y0", "y1", ..., "yn" refer to the coordinates
  ##  involved in the computation.
  ##
proc SetFunctionParser*(this: var vtkKMeansDistanceFunctorCalculator;
                       a2: ptr vtkFunctionParser) {.importcpp: "SetFunctionParser",
    header: "vtkKMeansDistanceFunctorCalculator.h".}
proc GetnameFunctionParser*(this: var vtkKMeansDistanceFunctorCalculator): ptr vtkFunctionParser {.
    importcpp: "GetnameFunctionParser",
    header: "vtkKMeansDistanceFunctorCalculator.h".}
  ## /@}