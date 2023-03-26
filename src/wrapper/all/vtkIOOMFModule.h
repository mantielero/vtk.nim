
#ifndef VTKIOOMF_EXPORT_H
#define VTKIOOMF_EXPORT_H

#ifdef VTKIOOMF_STATIC_DEFINE
#  define VTKIOOMF_EXPORT
#  define VTKIOOMF_NO_EXPORT
#else
#  ifndef VTKIOOMF_EXPORT
#    ifdef IOOMF_EXPORTS
        /* We are building this library */
#      define VTKIOOMF_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOOMF_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOOMF_NO_EXPORT
#    define VTKIOOMF_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOOMF_DEPRECATED
#  define VTKIOOMF_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOOMF_DEPRECATED_EXPORT
#  define VTKIOOMF_DEPRECATED_EXPORT VTKIOOMF_EXPORT VTKIOOMF_DEPRECATED
#endif

#ifndef VTKIOOMF_DEPRECATED_NO_EXPORT
#  define VTKIOOMF_DEPRECATED_NO_EXPORT VTKIOOMF_NO_EXPORT VTKIOOMF_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOOMF_NO_DEPRECATED
#    define VTKIOOMF_NO_DEPRECATED
#  endif
#endif

#endif /* VTKIOOMF_EXPORT_H */
