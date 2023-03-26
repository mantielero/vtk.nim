when defined(VTKIOADIOS2_STATIC_DEFINE):
else:
when not defined(VTKIOADIOS2_DEPRECATED):
  discard
when not defined(VTKIOADIOS2_DEPRECATED_EXPORT):
  const
    VTKIOADIOS2_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOADIOS2_DEPRECATED_NO_EXPORT):
  const
    VTKIOADIOS2_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: