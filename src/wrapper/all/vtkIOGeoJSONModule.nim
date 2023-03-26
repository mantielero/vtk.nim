when defined(VTKIOGEOJSON_STATIC_DEFINE):
else:
when not defined(VTKIOGEOJSON_DEPRECATED):
  discard
when not defined(VTKIOGEOJSON_DEPRECATED_EXPORT):
  const
    VTKIOGEOJSON_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOGEOJSON_DEPRECATED_NO_EXPORT):
  const
    VTKIOGEOJSON_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: