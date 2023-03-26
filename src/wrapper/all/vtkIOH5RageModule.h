
#ifndef VTKIOH5RAGE_EXPORT_H
#define VTKIOH5RAGE_EXPORT_H

#ifdef VTKIOH5RAGE_STATIC_DEFINE
#  define VTKIOH5RAGE_EXPORT
#  define VTKIOH5RAGE_NO_EXPORT
#else
#  ifndef VTKIOH5RAGE_EXPORT
#    ifdef IOH5Rage_EXPORTS
        /* We are building this library */
#      define VTKIOH5RAGE_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOH5RAGE_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOH5RAGE_NO_EXPORT
#    define VTKIOH5RAGE_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOH5RAGE_DEPRECATED
#  define VTKIOH5RAGE_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOH5RAGE_DEPRECATED_EXPORT
#  define VTKIOH5RAGE_DEPRECATED_EXPORT VTKIOH5RAGE_EXPORT VTKIOH5RAGE_DEPRECATED
#endif

#ifndef VTKIOH5RAGE_DEPRECATED_NO_EXPORT
#  define VTKIOH5RAGE_DEPRECATED_NO_EXPORT VTKIOH5RAGE_NO_EXPORT VTKIOH5RAGE_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOH5RAGE_NO_DEPRECATED
#    define VTKIOH5RAGE_NO_DEPRECATED
#  endif
#endif

#endif /* VTKIOH5RAGE_EXPORT_H */
