{.passL:"-lvtkCommonCore -lvtksys -lvtkFiltersSources".}
{.passC:"-I/usr/include/vtk/" .}
import wrapper/vtk_wrapper

# type
#   vtkCylinderSource* {.importcpp: "vtkCylinderSource",
#                       header: "vtkCylinderSource.h", bycopy.} = object #of vtkPolyDataAlgorithm

# proc newCylinderSource*(): ptr vtkCylinderSource {.importcpp: "vtkCylinderSource::New(@)",
#                                  header: "vtkCylinderSource.h".}


proc VTK_SIZEOF_DOUBLE*():cint {.cdecl, importcpp: "VTK_SIZEOF_DOUBLE@", 
                                header: "vtkType.h" .}

proc main =
  
  echo VTK_SIZEOF_DOUBLE()

main()