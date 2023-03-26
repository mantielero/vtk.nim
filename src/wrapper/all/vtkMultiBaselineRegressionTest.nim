import
  vtkNew, vtkRenderWindow, vtkTesting, vtksys/SystemTools

## *\brief Run a regression test with an explicitly-provided image filename.
##
##  Unlike the traditional C++ image-based test macro (vtkRegressionTestImage),
##  this templated function accepts the name of a baseline image.
##  It uses the existing vtkTesting infrastructure to expand the image name
##  into a full path by replacing the implied filename component of the valid
##  image (specified with "-V" on the command line) with the given \a img
##  value. The directory portion of the valid image path preceding is untouched.
##

proc RegressionTestWithImageName*[T](argc: cint; argv: ptr cstring; rw: ptr T;
                                    img: string; thresh: cdouble = 10.0): cint =
  discard

##  VTK-HeaderTest-Exclude: vtkMultiBaselineRegressionTest.h
