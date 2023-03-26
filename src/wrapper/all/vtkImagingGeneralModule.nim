when defined(VTKIMAGINGGENERAL_STATIC_DEFINE):
else:
when not defined(VTKIMAGINGGENERAL_DEPRECATED):
  discard
when not defined(VTKIMAGINGGENERAL_DEPRECATED_EXPORT):
  const
    VTKIMAGINGGENERAL_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIMAGINGGENERAL_DEPRECATED_NO_EXPORT):
  const
    VTKIMAGINGGENERAL_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: