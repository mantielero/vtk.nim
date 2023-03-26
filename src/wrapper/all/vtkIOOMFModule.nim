when defined(VTKIOOMF_STATIC_DEFINE):
else:
when not defined(VTKIOOMF_DEPRECATED):
  discard
when not defined(VTKIOOMF_DEPRECATED_EXPORT):
  const
    VTKIOOMF_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOOMF_DEPRECATED_NO_EXPORT):
  const
    VTKIOOMF_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: