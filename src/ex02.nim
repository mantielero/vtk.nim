{.passL:"-lvtkCommonCore -lvtksys -lvtkFiltersSources".}
{.passC:"-I/usr/include/vtk/" .}
import wrapper/vtk_wrapper

# type
#   vtkCylinderSource* {.importcpp: "vtkCylinderSource",
#                       header: "vtkCylinderSource.h", bycopy.} = object #of vtkPolyDataAlgorithm

# proc newCylinderSource*(): ptr vtkCylinderSource {.importcpp: "vtkCylinderSource::New(@)",
#                                  header: "vtkCylinderSource.h".}



proc main =
  var tmp = newCylinderSource()

main()