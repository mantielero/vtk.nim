when defined(VTKIMAGINGCOLOR_STATIC_DEFINE):
else:
when not defined(VTKIMAGINGCOLOR_DEPRECATED):
  discard
when not defined(VTKIMAGINGCOLOR_DEPRECATED_EXPORT):
  const
    VTKIMAGINGCOLOR_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIMAGINGCOLOR_DEPRECATED_NO_EXPORT):
  const
    VTKIMAGINGCOLOR_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: