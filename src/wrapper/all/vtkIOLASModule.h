
#ifndef VTKIOLAS_EXPORT_H
#define VTKIOLAS_EXPORT_H

#ifdef VTKIOLAS_STATIC_DEFINE
#  define VTKIOLAS_EXPORT
#  define VTKIOLAS_NO_EXPORT
#else
#  ifndef VTKIOLAS_EXPORT
#    ifdef IOLAS_EXPORTS
        /* We are building this library */
#      define VTKIOLAS_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOLAS_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOLAS_NO_EXPORT
#    define VTKIOLAS_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOLAS_DEPRECATED
#  define VTKIOLAS_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOLAS_DEPRECATED_EXPORT
#  define VTKIOLAS_DEPRECATED_EXPORT VTKIOLAS_EXPORT VTKIOLAS_DEPRECATED
#endif

#ifndef VTKIOLAS_DEPRECATED_NO_EXPORT
#  define VTKIOLAS_DEPRECATED_NO_EXPORT VTKIOLAS_NO_EXPORT VTKIOLAS_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOLAS_NO_DEPRECATED
#    define VTKIOLAS_NO_DEPRECATED
#  endif
#endif

#endif /* VTKIOLAS_EXPORT_H */
