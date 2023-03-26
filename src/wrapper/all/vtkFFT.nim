## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkFFT.h
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
##  @class vtkFFT
##  @brief perform Discrete Fourier Transforms
##
##  vtkFFT provides methods to perform Discrete Fourier Transforms (DFT).
##  These include providing forward and reverse Fourier transforms.
##  The current implementation uses the third-party library kissfft.
##
##  The terminology tries to follow the Numpy terminology, that is :
##   - Fft means the Fast Fourier Transform algorithm
##   - Prefix `R` stands for Real (meaning optimized function for real inputs)
##   - Prefix `I` stands for Inverse
##

## !!!Ignored construct:  # vtkFFT_h [NewLine] # vtkFFT_h [NewLine] # vtkCommonMathModule.h  For export macro # vtkMath.h  For vtkMath::Pi # vtkObject.h [NewLine] # vtk_kissfft.h  For kiss_fft_scalar, kiss_fft_cpx  clang-format off # VTK_KISSFFT_HEADER ( kiss_fft . h ) [NewLine] # VTK_KISSFFT_HEADER ( tools / kiss_fftr . h ) [NewLine]  clang-format on # < vector >  For std::vector # < cmath >  for std::sin, std::cos, std::sqrt [NewLine] class VTKCOMMONMATH_EXPORT vtkFFT : public vtkObject { public : using ScalarNumber = kiss_fft_scalar ; using ComplexNumber = kiss_fft_cpx ; static vtkFFT * New ( ) ; protected : const char * GetClassNameInternal ( ) const override { return thisClass ; } public : typedef vtkObject Superclass ; static vtkTypeBool IsTypeOf ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 1 ; } return vtkObject :: IsTypeOf ( type ) ; } vtkTypeBool IsA ( const char * type ) override { return this -> vtkFFT :: IsTypeOf ( type ) ; } static vtkFFT * SafeDownCast ( vtkObjectBase * o ) { if ( o && o -> IsA ( thisClass ) ) { return static_cast < vtkFFT * > ( o ) ; } return nullptr ; } VTK_NEWINSTANCE vtkFFT * NewInstance ( ) const { return vtkFFT :: SafeDownCast ( this -> NewInstanceInternal ( ) ) ; } static vtkIdType GetNumberOfGenerationsFromBaseType ( const char * type ) { if ( ! strcmp ( thisClass , type ) ) { return 0 ; } return 1 + vtkObject :: GetNumberOfGenerationsFromBaseType ( type ) ; } vtkIdType GetNumberOfGenerationsFromBase ( const char * type ) override { return this -> vtkFFT :: GetNumberOfGenerationsFromBaseType ( type ) ; } public : protected : vtkObjectBase * NewInstanceInternal ( ) const override { return vtkFFT :: New ( ) ; } public : ; void PrintSelf ( ostream & os , vtkIndent indent ) override ; @{ *
##  Compute the one-dimensional DFT for complex input.
##  If input is scalars then the imaginary part is set to 0
##
##  input has n complex points
##  output has n complex points in case of success and empty in case of failure
##  static std :: vector < ComplexNumber > Fft ( const std :: vector < ComplexNumber > & in ) ; static std :: vector < ComplexNumber > Fft ( const std :: vector < ScalarNumber > & in ) ; @} *
##  Compute the one-dimensional DFT for real input
##
##   input has n scalar points
##   output has (n/2) + 1 complex points in case of success and empty in case of failure
##  static std :: vector < ComplexNumber > RFft ( const std :: vector < ScalarNumber > & in ) ; *
##  Compute the inverse of @c Fft. The input should be ordered in the same way as is returned by @c
##  Fft, i.e.,
##   - in[0] should contain the zero frequency term,
##   - in[1:n//2] should contain the positive-frequency terms,
##   - in[n//2 + 1:] should contain the negative-frequency terms.
##
##   input has n complex points
##   output has n scalar points in case of success and empty in case of failure
##  static std :: vector < ComplexNumber > IFft ( const std :: vector < ComplexNumber > & in ) ; *
##  Compute the inverse of @c RFft. The input is expected to be in the form returned by @c Rfft,
##  i.e. the real zero-frequency term followed by the complex positive frequency terms in
##  order of increasing frequency.
##
##   input has  (n/2) + 1 complex points
##   output has n scalar points in case of success and empty in case of failure
##  static std :: vector < ScalarNumber > IRFft ( const std :: vector < ComplexNumber > & in ) ; *
##  Return the absolute value (also known as norm, modulus, or magnitude) of complex number
##  static inline double Abs ( const ComplexNumber & in ) ; *
##  Return the squared absolute value of the complex number
##  static inline double SquaredAbs ( const ComplexNumber & in ) ; *
##  Return the DFT sample frequencies. Output has @c windowLength size.
##  static std :: vector < double > FftFreq ( int windowLength , double sampleSpacing ) ; *
##  Return the DFT sample frequencies for the real version of the dft (see @c Rfft).
##  Output has @c (windowLength / 2) + 1 size.
##  static std :: vector < double > RFftFreq ( int windowLength , double sampleSpacing ) ; @{ *
##  Window generator functions. Implementation only needs to be valid for x E [0; size / 2]
##  because kernels are symmetric by definitions. This point is very important for some
##  kernels like Bartlett for example.
##
##  @warning Hanning and Bartlett generators needs a size > 1 !
##
##  Can be used with @c GenerateKernel1D and @c GenerateKernel2D for generating full kernels.
##  using WindowGenerator = double ( * ) ( const std :: size_t , const std :: size_t ) ; static inline double HanningGenerator ( const std :: size_t x , const std :: size_t size ) ; static inline double BartlettGenerator ( const std :: size_t x , const std :: size_t size ) ; static inline double SineGenerator ( const std :: size_t x , const std :: size_t size ) ; static inline double BlackmanGenerator ( const std :: size_t x , const std :: size_t size ) ; static inline double RectangularGenerator ( const std :: size_t x , const std :: size_t size ) ; @} *
##  Given a window generator function, create a symmetric 1D kernel.
##  @c kernel is the pointer to the raw data array
##  template < typename Array1D > static void GenerateKernel1D ( Array1D * kernel , const std :: size_t n , WindowGenerator generator ) ; *
##  Given a window generator function, create a symmetric 2D kernel.
##  @c kernel is the pointer to the raw 2D data array.
##  template < typename Array2D > static void GenerateKernel2D ( Array2D * kernel , const std :: size_t n , const std :: size_t m , WindowGenerator generator ) ; protected : vtkFFT ( ) = default ; ~ vtkFFT ( ) override = default ; private : vtkFFT ( const vtkFFT & ) = delete ; void operator = ( const vtkFFT & ) = delete ; } ;
## Error: token expected: ; but got: [identifier]!!!

## ------------------------------------------------------------------------------

proc Abs*(`in`: ComplexNumber): cdouble {.importcpp: "VTKCOMMONMATH_EXPORT::Abs(@)",
                                      header: "vtkFFT.h".}
## ------------------------------------------------------------------------------

proc SquaredAbs*(`in`: ComplexNumber): cdouble {.
    importcpp: "VTKCOMMONMATH_EXPORT::SquaredAbs(@)", header: "vtkFFT.h".}
## ------------------------------------------------------------------------------

proc HanningGenerator*(x: size_t; size: size_t): cdouble {.
    importcpp: "VTKCOMMONMATH_EXPORT::HanningGenerator(@)", header: "vtkFFT.h".}
## ------------------------------------------------------------------------------

proc BartlettGenerator*(x: size_t; size: size_t): cdouble {.
    importcpp: "VTKCOMMONMATH_EXPORT::BartlettGenerator(@)", header: "vtkFFT.h".}
## ------------------------------------------------------------------------------

proc SineGenerator*(x: size_t; size: size_t): cdouble {.
    importcpp: "VTKCOMMONMATH_EXPORT::SineGenerator(@)", header: "vtkFFT.h".}
## ------------------------------------------------------------------------------

proc BlackmanGenerator*(x: size_t; size: size_t): cdouble {.
    importcpp: "VTKCOMMONMATH_EXPORT::BlackmanGenerator(@)", header: "vtkFFT.h".}
## ------------------------------------------------------------------------------

proc RectangularGenerator*(a1: size_t; a2: size_t): cdouble {.
    importcpp: "VTKCOMMONMATH_EXPORT::RectangularGenerator(@)", header: "vtkFFT.h".}
## ------------------------------------------------------------------------------

proc GenerateKernel1D*(kernel: ptr Array1D; n: size_t; generator: WindowGenerator) {.
    importcpp: "VTKCOMMONMATH_EXPORT::GenerateKernel1D(@)", header: "vtkFFT.h".}
## ------------------------------------------------------------------------------

proc GenerateKernel2D*(kernel: ptr Array2D; n: size_t; m: size_t;
                      generator: WindowGenerator) {.
    importcpp: "VTKCOMMONMATH_EXPORT::GenerateKernel2D(@)", header: "vtkFFT.h".}