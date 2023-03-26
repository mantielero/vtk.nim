
#ifndef VTKIOGDAL_EXPORT_H
#define VTKIOGDAL_EXPORT_H

#ifdef VTKIOGDAL_STATIC_DEFINE
#  define VTKIOGDAL_EXPORT
#  define VTKIOGDAL_NO_EXPORT
#else
#  ifndef VTKIOGDAL_EXPORT
#    ifdef IOGDAL_EXPORTS
        /* We are building this library */
#      define VTKIOGDAL_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKIOGDAL_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKIOGDAL_NO_EXPORT
#    define VTKIOGDAL_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKIOGDAL_DEPRECATED
#  define VTKIOGDAL_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKIOGDAL_DEPRECATED_EXPORT
#  define VTKIOGDAL_DEPRECATED_EXPORT VTKIOGDAL_EXPORT VTKIOGDAL_DEPRECATED
#endif

#ifndef VTKIOGDAL_DEPRECATED_NO_EXPORT
#  define VTKIOGDAL_DEPRECATED_NO_EXPORT VTKIOGDAL_NO_EXPORT VTKIOGDAL_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKIOGDAL_NO_DEPRECATED
#    define VTKIOGDAL_NO_DEPRECATED
#  endif
#endif

#endif /* VTKIOGDAL_EXPORT_H */
