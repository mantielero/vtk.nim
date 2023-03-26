## =========================================================================
##
##   Program:   Visualization Toolkit
##   Module:    vtkCylinderSource.h
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
##  @class   vtkCylinderSource
##  @brief   generate a polygonal cylinder centered at the origin
##
##  vtkCylinderSource creates a polygonal cylinder centered at Center;
##  The axis of the cylinder is aligned along the global y-axis.
##  The height and radius of the cylinder can be specified, as well as the
##  number of sides. It is also possible to control whether the cylinder is
##  open-ended or capped. If you have the end points of the cylinder, you
##  should use a vtkLineSource followed by a vtkTubeFilter instead of the
##  vtkCylinderSource.
##
##  @sa
##  vtkCylinder
##

import
  vtkPolyDataAlgorithm, vtkCell #, vtkFiltersSourcesModule

type
  vtkCylinderSource* {.importcpp: "vtkCylinderSource",
                      header: "vtkCylinderSource.h", bycopy.} = object #of vtkPolyDataAlgorithm


proc newCylinderSource*(): ptr vtkCylinderSource {.importcpp: "vtkCylinderSource::New(@)",
                                 header: "vtkCylinderSource.h".}
## !!!Ignored construct:  vtkTypeMacro ( vtkCylinderSource , vtkPolyDataAlgorithm ) ;
## Error: token expected: ) but got: ,!!!

#proc PrintSelf*(this: var vtkCylinderSource; os: var ostream; indent: vtkIndent) {.
#    importcpp: "PrintSelf", header: "vtkCylinderSource.h".}
## !!!Ignored construct:  /@{ *
##  Set the height of the cylinder. Initial value is 1.
##  vtkSetClampMacro ( Height , double , 0.0 , VTK_DOUBLE_MAX ) ;
## Error: token expected: ) but got: ,!!!

## !!!Ignored construct:  vtkGetMacro ( Height , double ) ;
## Error: token expected: ) but got: ,!!!

## !!!Ignored construct:  /@} /@{ *
##  Set the radius of the cylinder. Initial value is 0.5
##  vtkSetClampMacro ( Radius , double , 0.0 , VTK_DOUBLE_MAX ) ;
## Error: token expected: ) but got: ,!!!

## !!!Ignored construct:  vtkGetMacro ( Radius , double ) ;
## Error: token expected: ) but got: ,!!!

## !!!Ignored construct:  /@} /@{ *
##  Set/Get cylinder center. Initial value is (0.0,0.0,0.0)
##  vtkSetVector3Macro ( Center , double ) ;
## Error: token expected: ) but got: ,!!!

## !!!Ignored construct:  vtkGetVectorMacro ( Center , double , 3 ) ;
## Error: token expected: ) but got: ,!!!

## !!!Ignored construct:  /@} /@{ *
##  Set the number of facets used to define cylinder. Initial value is 6.
##  vtkSetClampMacro ( Resolution , int , 3 , VTK_CELL_SIZE ) ;
## Error: token expected: ) but got: ,!!!

## !!!Ignored construct:  vtkGetMacro ( Resolution , int ) ;
## Error: token expected: ) but got: ,!!!

## !!!Ignored construct:  /@} /@{ *
##  Turn on/off whether to cap cylinder with polygons. Initial value is true.
##  vtkSetMacro ( Capping , vtkTypeBool ) ;
## Error: token expected: ) but got: ,!!!

## !!!Ignored construct:  vtkGetMacro ( Capping , vtkTypeBool ) ;
## Error: token expected: ) but got: ,!!!

## !!!Ignored construct:  vtkBooleanMacro ( Capping , vtkTypeBool ) ;
## Error: token expected: ) but got: ,!!!

## !!!Ignored construct:  /@} /@{ *
##  Set/get the desired precision for the output points.
##  vtkAlgorithm::SINGLE_PRECISION - Output single-precision floating point.
##  vtkAlgorithm::DOUBLE_PRECISION - Output double-precision floating point.
##  vtkSetMacro ( OutputPointsPrecision , int ) ;
## Error: token expected: ) but got: ,!!!

## !!!Ignored construct:  vtkGetMacro ( OutputPointsPrecision , int ) ;
## Error: token expected: ) but got: ,!!!
