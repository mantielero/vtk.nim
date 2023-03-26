when defined(VTKWEBGLEXPORTER_STATIC_DEFINE):
else:
when not defined(VTKWEBGLEXPORTER_DEPRECATED):
  discard
when not defined(VTKWEBGLEXPORTER_DEPRECATED_EXPORT):
  const
    VTKWEBGLEXPORTER_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKWEBGLEXPORTER_DEPRECATED_NO_EXPORT):
  const
    VTKWEBGLEXPORTER_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: