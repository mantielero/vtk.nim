when defined(VTKIMAGINGCORE_STATIC_DEFINE):
else:
when not defined(VTKIMAGINGCORE_DEPRECATED):
  discard
when not defined(VTKIMAGINGCORE_DEPRECATED_EXPORT):
  const
    VTKIMAGINGCORE_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIMAGINGCORE_DEPRECATED_NO_EXPORT):
  const
    VTKIMAGINGCORE_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: