## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkAmoebaMinimizer.h
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
##  @class   vtkAmoebaMinimizer
##  @brief   nonlinear optimization with a simplex
##
##  vtkAmoebaMinimizer will modify a set of parameters in order to find
##  the minimum of a specified function.  The method used is commonly
##  known as the amoeba method, it constructs an n-dimensional simplex
##  in parameter space (i.e. a tetrahedron if the number or parameters
##  is 3) and moves the vertices around parameter space until a local
##  minimum is found.  The amoeba method is robust, reasonably efficient,
##  but is not guaranteed to find the global minimum if several local
##  minima exist.
##

## !!!Ignored construct:  # vtkAmoebaMinimizer_h [NewLine] # vtkAmoebaMinimizer_h [NewLine] # vtkCommonMathModule.h  For export macro # vtkObject.h [NewLine] class VTKCOMMONMATH_EXPORT vtkAmoebaMinimizer : public vtkObject { public : static vtkAmoebaMinimizer * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkAmoebaMinimizer :: IsTypeOf ( type ) ; } static vtkAmoebaMinimizer * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkAmoebaMinimizer * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkAmoebaMinimizer * NewInstance ( ) const { return vtkAmoebaMinimizer :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkAmoebaMinimizer :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkAmoebaMinimizer :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; *
##  Specify the function to be minimized.  When this function
##  is called, it must get the parameter values by calling
##  GetParameterValue() for each parameter, and then must
##  call SetFunctionValue() to tell the minimizer what the result
##  of the function evaluation was.  The number of function
##  evaluations used for the minimization can be retrieved
##  using GetFunctionEvaluations().
##  void SetFunction ( void ( * f ) ( void * ) , void * arg ) ; *
##  Set a function to call when a void* argument is being discarded.
##  void SetFunctionArgDelete ( void ( * f ) ( void * ) ) ; /@{ *
##  Set the initial value for the specified parameter.  Calling
##  this function for any parameter will reset the Iterations
##  and the FunctionEvaluations counts to zero.  You must also
##  use SetParameterScale() to specify the step size by which the
##  parameter will be modified during the minimization.  It is
##  preferable to specify parameters by name, rather than by
##  number.
##  void SetParameterValue ( const char * name , double value ) ; void SetParameterValue ( int i , double value ) ; /@} /@{ *
##  Set the scale to use when modifying a parameter, i.e. the
##  initial amount by which the parameter will be modified
##  during the search for the minimum.  It is preferable to
##  identify scalars by name rather than by number.
##  void SetParameterScale ( const char * name , double scale ) ; double GetParameterScale ( const char * name ) ; void SetParameterScale ( int i , double scale ) ; double GetParameterScale ( int i ) { return this -> ParameterScales [ i ] ; } /@} /@{ *
##  Get the value of a parameter at the current stage of the minimization.
##  Call this method within the function that you are minimizing in order
##  to get the current parameter values.  It is preferable to specify
##  parameters by name rather than by index.
##  double GetParameterValue ( const char * name ) ; double GetParameterValue ( int i ) { return this -> ParameterValues [ i ] ; } /@} *
##  For completeness, an unchecked method to get the name for particular
##  parameter (the result will be nullptr if no name was set).
##  const char * GetParameterName ( int i ) { return this -> ParameterNames [ i ] ; } *
##  Get the number of parameters that have been set.
##  int GetNumberOfParameters ( ) { return this -> NumberOfParameters ; } *
##  Initialize the minimizer.  This will reset the number of parameters to
##  zero so that the minimizer can be reused.
##  void Initialize ( ) ; *
##  Iterate until the minimum is found to within the specified tolerance,
##  or until the MaxIterations has been reached.
##  virtual void Minimize ( ) ; *
##  Perform one iteration of minimization.  Returns zero if the tolerance
##  stopping criterion has been met.
##  virtual int Iterate ( ) ; /@{ *
##  Get the function value resulting from the minimization.
##  virtual void SetFunctionValue ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  FunctionValue  to  << _arg ) ; if ( this -> FunctionValue != _arg ) { this -> FunctionValue = _arg ; this -> Modified ( ) ; } } ; double GetFunctionValue ( ) { return this -> FunctionValue ; } /@} /@{ *
##  Set the amoeba contraction ratio.  The default value of 0.5 gives
##  fast convergence, but larger values such as 0.6 or 0.7 provide
##  greater stability.
##  virtual void SetContractionRatio ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ContractionRatio  to  << _arg ) ; if ( this -> ContractionRatio != ( _arg < 0.5 ? 0.5 : ( _arg > 1.0 ? 1.0 : _arg ) ) ) { this -> ContractionRatio = ( _arg < 0.5 ? 0.5 : ( _arg > 1.0 ? 1.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetContractionRatioMinValue ( ) { return 0.5 ; } virtual double GetContractionRatioMaxValue ( ) { return 1.0 ; } ; virtual double GetContractionRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ContractionRatio  of  << this -> ContractionRatio ) ; return this -> ContractionRatio ; } ; /@} /@{ *
##  Set the amoeba expansion ratio.  The default value is 2.0, which
##  provides rapid expansion.  Values between 1.1 and 2.0 are valid.
##  virtual void SetContractionRatioExpansionRatio ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  << ExpansionRatio  to  << _arg ) ; if ( this -> ExpansionRatio != ( _arg < 1.0 ? 1.0 : ( _arg > 2.0 ? 2.0 : _arg ) ) ) { this -> ExpansionRatio = ( _arg < 1.0 ? 1.0 : ( _arg > 2.0 ? 2.0 : _arg ) ) ; this -> Modified ( ) ; } } virtual double GetContractionRatioMinValueExpansionRatioMinValue ( ) { return 1.0 ; } virtual double GetContractionRatioMaxValueExpansionRatioMaxValue ( ) { return 2.0 ; } ; virtual double GetContractionRatioExpansionRatio ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ExpansionRatio  of  << this -> ExpansionRatio ) ; return this -> ExpansionRatio ; } ; /@} /@{ *
##  Specify the value tolerance to aim for during the minimization.
##  virtual void SetFunctionValueTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  Tolerance  to  << _arg ) ; if ( this -> Tolerance != _arg ) { this -> Tolerance = _arg ; this -> Modified ( ) ; } } ; virtual double GetContractionRatioExpansionRatioTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Tolerance  of  << this -> Tolerance ) ; return this -> Tolerance ; } ; /@} /@{ *
##  Specify the parameter tolerance to aim for during the minimization.
##  virtual void SetFunctionValueToleranceParameterTolerance ( double _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  ParameterTolerance  to  << _arg ) ; if ( this -> ParameterTolerance != _arg ) { this -> ParameterTolerance = _arg ; this -> Modified ( ) ; } } ; virtual double GetContractionRatioExpansionRatioToleranceParameterTolerance ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << ParameterTolerance  of  << this -> ParameterTolerance ) ; return this -> ParameterTolerance ; } ; /@} /@{ *
##  Specify the maximum number of iterations to try before giving up.
##  virtual void SetFunctionValueToleranceParameterToleranceMaxIterations ( int _arg ) { vtkDebugWithObjectMacro ( this , <<  setting  MaxIterations  to  << _arg ) ; if ( this -> MaxIterations != _arg ) { this -> MaxIterations = _arg ; this -> Modified ( ) ; } } ; virtual int GetContractionRatioExpansionRatioToleranceParameterToleranceMaxIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << MaxIterations  of  << this -> MaxIterations ) ; return this -> MaxIterations ; } ; /@} /@{ *
##  Return the number of iterations that have been performed.  This
##  is not necessarily the same as the number of function evaluations.
##  virtual int GetContractionRatioExpansionRatioToleranceParameterToleranceMaxIterationsIterations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << Iterations  of  << this -> Iterations ) ; return this -> Iterations ; } ; /@} /@{ *
##  Return the number of times that the function has been evaluated.
##  virtual int GetContractionRatioExpansionRatioToleranceParameterToleranceMaxIterationsIterationsFunctionEvaluations ( ) VTK_FUTURE_CONST { vtkDebugWithObjectMacro ( this , <<  returning  << FunctionEvaluations  of  << this -> FunctionEvaluations ) ; return this -> FunctionEvaluations ; } ; /@} *
##  Evaluate the function.  This is usually called internally by the
##  minimization code, but it is provided here as a public method.
##  void EvaluateFunction ( ) ; protected : vtkAmoebaMinimizer ( ) ; ~ vtkAmoebaMinimizer ( ) override ; void ( * Function ) ( void * ) ; void ( * FunctionArgDelete ) ( void * ) ; void * FunctionArg ; int NumberOfParameters ; char * * ParameterNames ; double * ParameterValues ; double * ParameterScales ; double FunctionValue ; double ContractionRatio ; double ExpansionRatio ; double Tolerance ; double ParameterTolerance ; int MaxIterations ; int Iterations ; int FunctionEvaluations ; private :  specific to amoeba simplex minimization double * * AmoebaVertices ; double * AmoebaValues ; double * AmoebaSum ; double AmoebaSize ; double AmoebaHighValue ; int AmoebaNStepsNoImprovement ; void InitializeAmoeba ( ) ; void GetAmoebaParameterValues ( ) ; void TerminateAmoeba ( ) ; double TryAmoeba ( double sum [ ] , int high , double fac ) ; int PerformAmoeba ( ) ; int CheckParameterTolerance ( ) ; vtkAmoebaMinimizer ( const vtkAmoebaMinimizer & ) = delete ; void operator = ( const vtkAmoebaMinimizer & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!
