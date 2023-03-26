
#ifndef VTKIOTRUCHAS_EXPORT_H
#define VTKIOTRUCHAS_EXPORT_H

#ifdef VTKIOTRUCHAS_STATIC_DEFINE
#  define VTKIOTRUCHAS_EXPORT
#  define VTKIOTRUCHAS_NO_EXPORT
#else
#  ifndef VTKIOTRUCHAS_EXPORT
#    ifdef IOTRUCHAS_EXPORTS
        /* We are building this library */
#      define VTKIOTRUCHAS_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOTRUCHAS_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOTRUCHAS_NO_EXPORT
#    define VTKIOTRUCHAS_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOTRUCHAS_DEPRECATED
#  define VTKIOTRUCHAS_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOTRUCHAS_DEPRECATED_EXPORT
#  define VTKIOTRUCHAS_DEPRECATED_EXPORT VTKIOTRUCHAS_EXPORT VTKIOTRUCHAS_DEPRECATED
#endif

#ifndef VTKIOTRUCHAS_DEPRECATED_NO_EXPORT
#  define VTKIOTRUCHAS_DEPRECATED_NO_EXPORT VTKIOTRUCHAS_NO_EXPORT VTKIOTRUCHAS_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOTRUCHAS_NO_DEPRECATED
#    define VTKIOTRUCHAS_NO_DEPRECATED
#  endif
#endif

#endif /* VTKIOTRUCHAS_EXPORT_H */
