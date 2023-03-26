
#ifndef VTKIOADIOS2_EXPORT_H
#define VTKIOADIOS2_EXPORT_H

#ifdef VTKIOADIOS2_STATIC_DEFINE
#  define VTKIOADIOS2_EXPORT
#  define VTKIOADIOS2_NO_EXPORT
#else
#  ifndef VTKIOADIOS2_EXPORT
#    ifdef IOADIOS2_EXPORTS
        /* We are building this library */
#      define VTKIOADIOS2_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOADIOS2_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOADIOS2_NO_EXPORT
#    define VTKIOADIOS2_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOADIOS2_DEPRECATED
#  define VTKIOADIOS2_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOADIOS2_DEPRECATED_EXPORT
#  define VTKIOADIOS2_DEPRECATED_EXPORT VTKIOADIOS2_EXPORT VTKIOADIOS2_DEPRECATED
#endif

#ifndef VTKIOADIOS2_DEPRECATED_NO_EXPORT
#  define VTKIOADIOS2_DEPRECATED_NO_EXPORT VTKIOADIOS2_NO_EXPORT VTKIOADIOS2_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOADIOS2_NO_DEPRECATED
#    define VTKIOADIOS2_NO_DEPRECATED
#  endif
#endif

#endif /* VTKIOADIOS2_EXPORT_H */
