
#ifndef VTKGEOVISGDAL_EXPORT_H
#define VTKGEOVISGDAL_EXPORT_H

#ifdef VTKGEOVISGDAL_STATIC_DEFINE
#  define VTKGEOVISGDAL_EXPORT
#  define VTKGEOVISGDAL_NO_EXPORT
#else
#  ifndef VTKGEOVISGDAL_EXPORT
#    ifdef GeovisGDAL_EXPORTS
        /* We are building this library */
#      define VTKGEOVISGDAL_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKGEOVISGDAL_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKGEOVISGDAL_NO_EXPORT
#    define VTKGEOVISGDAL_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKGEOVISGDAL_DEPRECATED
#  define VTKGEOVISGDAL_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKGEOVISGDAL_DEPRECATED_EXPORT
#  define VTKGEOVISGDAL_DEPRECATED_EXPORT VTKGEOVISGDAL_EXPORT VTKGEOVISGDAL_DEPRECATED
#endif

#ifndef VTKGEOVISGDAL_DEPRECATED_NO_EXPORT
#  define VTKGEOVISGDAL_DEPRECATED_NO_EXPORT VTKGEOVISGDAL_NO_EXPORT VTKGEOVISGDAL_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKGEOVISGDAL_NO_DEPRECATED
#    define VTKGEOVISGDAL_NO_DEPRECATED
#  endif
#endif

#endif /* VTKGEOVISGDAL_EXPORT_H */
