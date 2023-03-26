
#ifndef VTKIOHDF_EXPORT_H
#define VTKIOHDF_EXPORT_H

#ifdef VTKIOHDF_STATIC_DEFINE
#  define VTKIOHDF_EXPORT
#  define VTKIOHDF_NO_EXPORT
#else
#  ifndef VTKIOHDF_EXPORT
#    ifdef IOHDF_EXPORTS
        /* We are building this library */
#      define VTKIOHDF_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOHDF_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOHDF_NO_EXPORT
#    define VTKIOHDF_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOHDF_DEPRECATED
#  define VTKIOHDF_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOHDF_DEPRECATED_EXPORT
#  define VTKIOHDF_DEPRECATED_EXPORT VTKIOHDF_EXPORT VTKIOHDF_DEPRECATED
#endif

#ifndef VTKIOHDF_DEPRECATED_NO_EXPORT
#  define VTKIOHDF_DEPRECATED_NO_EXPORT VTKIOHDF_NO_EXPORT VTKIOHDF_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOHDF_NO_DEPRECATED
#    define VTKIOHDF_NO_DEPRECATED
#  endif
#endif

#endif /* VTKIOHDF_EXPORT_H */
