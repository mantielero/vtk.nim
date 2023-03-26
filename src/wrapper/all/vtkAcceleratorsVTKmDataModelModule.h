
#ifndef VTKACCELERATORSVTKMDATAMODEL_EXPORT_H
#define VTKACCELERATORSVTKMDATAMODEL_EXPORT_H

#ifdef VTKACCELERATORSVTKMDATAMODEL_STATIC_DEFINE
#  define VTKACCELERATORSVTKMDATAMODEL_EXPORT
#  define VTKACCELERATORSVTKMDATAMODEL_NO_EXPORT
#else
#  ifndef VTKACCELERATORSVTKMDATAMODEL_EXPORT
#    ifdef AcceleratorsVTKmDataModel_EXPORTS
        /* We are building this library */
#      define VTKACCELERATORSVTKMDATAMODEL_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKACCELERATORSVTKMDATAMODEL_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKACCELERATORSVTKMDATAMODEL_NO_EXPORT
#    define VTKACCELERATORSVTKMDATAMODEL_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKACCELERATORSVTKMDATAMODEL_DEPRECATED
#  define VTKACCELERATORSVTKMDATAMODEL_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKACCELERATORSVTKMDATAMODEL_DEPRECATED_EXPORT
#  define VTKACCELERATORSVTKMDATAMODEL_DEPRECATED_EXPORT VTKACCELERATORSVTKMDATAMODEL_EXPORT VTKACCELERATORSVTKMDATAMODEL_DEPRECATED
#endif

#ifndef VTKACCELERATORSVTKMDATAMODEL_DEPRECATED_NO_EXPORT
#  define VTKACCELERATORSVTKMDATAMODEL_DEPRECATED_NO_EXPORT VTKACCELERATORSVTKMDATAMODEL_NO_EXPORT VTKACCELERATORSVTKMDATAMODEL_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKACCELERATORSVTKMDATAMODEL_NO_DEPRECATED
#    define VTKACCELERATORSVTKMDATAMODEL_NO_DEPRECATED
#  endif
#endif

#endif /* VTKACCELERATORSVTKMDATAMODEL_EXPORT_H */