when defined(VTKIOMOVIE_STATIC_DEFINE):
else:
when not defined(VTKIOMOVIE_DEPRECATED):
  discard
when not defined(VTKIOMOVIE_DEPRECATED_EXPORT):
  const
    VTKIOMOVIE_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOMOVIE_DEPRECATED_NO_EXPORT):
  const
    VTKIOMOVIE_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: