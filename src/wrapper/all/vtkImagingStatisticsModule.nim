when defined(VTKIMAGINGSTATISTICS_STATIC_DEFINE):
else:
when not defined(VTKIMAGINGSTATISTICS_DEPRECATED):
  discard
when not defined(VTKIMAGINGSTATISTICS_DEPRECATED_EXPORT):
  const
    VTKIMAGINGSTATISTICS_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIMAGINGSTATISTICS_DEPRECATED_NO_EXPORT):
  const
    VTKIMAGINGSTATISTICS_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: