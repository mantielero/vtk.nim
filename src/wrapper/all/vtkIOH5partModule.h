
#ifndef VTKIOH5PART_EXPORT_H
#define VTKIOH5PART_EXPORT_H

#ifdef VTKIOH5PART_STATIC_DEFINE
#  define VTKIOH5PART_EXPORT
#  define VTKIOH5PART_NO_EXPORT
#else
#  ifndef VTKIOH5PART_EXPORT
#    ifdef IOH5part_EXPORTS
        /* We are building this library */
#      define VTKIOH5PART_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOH5PART_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOH5PART_NO_EXPORT
#    define VTKIOH5PART_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOH5PART_DEPRECATED
#  define VTKIOH5PART_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOH5PART_DEPRECATED_EXPORT
#  define VTKIOH5PART_DEPRECATED_EXPORT VTKIOH5PART_EXPORT VTKIOH5PART_DEPRECATED
#endif

#ifndef VTKIOH5PART_DEPRECATED_NO_EXPORT
#  define VTKIOH5PART_DEPRECATED_NO_EXPORT VTKIOH5PART_NO_EXPORT VTKIOH5PART_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOH5PART_NO_DEPRECATED
#    define VTKIOH5PART_NO_DEPRECATED
#  endif
#endif

#endif /* VTKIOH5PART_EXPORT_H */
