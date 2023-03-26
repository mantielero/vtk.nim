when defined(VTKIOOPENVDB_STATIC_DEFINE):
else:
when not defined(VTKIOOPENVDB_DEPRECATED):
  discard
when not defined(VTKIOOPENVDB_DEPRECATED_EXPORT):
  const
    VTKIOOPENVDB_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOOPENVDB_DEPRECATED_NO_EXPORT):
  const
    VTKIOOPENVDB_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: