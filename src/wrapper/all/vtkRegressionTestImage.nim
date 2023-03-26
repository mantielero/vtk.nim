## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkRegressionTestImage.h
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

##  Includes and a macro necessary for saving the image produced by a cxx
##  example program. This capability is critical for regression testing.
##  This function returns 1 if test passed, 0 if test failed.

import
  vtkTesting

type
  vtkRegressionTester* {.importcpp: "vtkRegressionTester",
                        header: "vtkRegressionTestImage.h", bycopy.} = object of vtkTesting


##  0.15 threshold is arbitrary but found to
##  allow most graphics system variances to pass
##  when they should and fail when they should

template vtkRegressionTestImage*(rw: untyped): untyped =
  Test(argc, argv, rw, 0.15)

template vtkRegressionTestImageThreshold*(rw, t: untyped): untyped =
  Test(argc, argv, rw, t)
