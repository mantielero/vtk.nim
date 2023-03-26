
#ifndef VTKTESTINGIOSQL_EXPORT_H
#define VTKTESTINGIOSQL_EXPORT_H

#ifdef VTKTESTINGIOSQL_STATIC_DEFINE
#  define VTKTESTINGIOSQL_EXPORT
#  define VTKTESTINGIOSQL_NO_EXPORT
#else
#  ifndef VTKTESTINGIOSQL_EXPORT
#    ifdef TestingIOSQL_EXPORTS
        /* We are building this library */
#      define VTKTESTINGIOSQL_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define VTKTESTINGIOSQL_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef VTKTESTINGIOSQL_NO_EXPORT
#    define VTKTESTINGIOSQL_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef VTKTESTINGIOSQL_DEPRECATED
#  define VTKTESTINGIOSQL_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef VTKTESTINGIOSQL_DEPRECATED_EXPORT
#  define VTKTESTINGIOSQL_DEPRECATED_EXPORT VTKTESTINGIOSQL_EXPORT VTKTESTINGIOSQL_DEPRECATED
#endif

#ifndef VTKTESTINGIOSQL_DEPRECATED_NO_EXPORT
#  define VTKTESTINGIOSQL_DEPRECATED_NO_EXPORT VTKTESTINGIOSQL_NO_EXPORT VTKTESTINGIOSQL_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef VTKTESTINGIOSQL_NO_DEPRECATED
#    define VTKTESTINGIOSQL_NO_DEPRECATED
#  endif
#endif

#endif /* VTKTESTINGIOSQL_EXPORT_H */
