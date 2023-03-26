when defined(VTKIMAGINGFOURIER_STATIC_DEFINE):
else:
when not defined(VTKIMAGINGFOURIER_DEPRECATED):
  discard
when not defined(VTKIMAGINGFOURIER_DEPRECATED_EXPORT):
  const
    VTKIMAGINGFOURIER_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIMAGINGFOURIER_DEPRECATED_NO_EXPORT):
  const
    VTKIMAGINGFOURIER_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: