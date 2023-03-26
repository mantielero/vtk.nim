when defined(VTKIOMINC_STATIC_DEFINE):
else:
when not defined(VTKIOMINC_DEPRECATED):
  discard
when not defined(VTKIOMINC_DEPRECATED_EXPORT):
  const
    VTKIOMINC_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOMINC_DEPRECATED_NO_EXPORT):
  const
    VTKIOMINC_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: