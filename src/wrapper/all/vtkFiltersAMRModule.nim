when defined(VTKFILTERSAMR_STATIC_DEFINE):
else:
when not defined(VTKFILTERSAMR_DEPRECATED):
  discard
when not defined(VTKFILTERSAMR_DEPRECATED_EXPORT):
  const
    VTKFILTERSAMR_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKFILTERSAMR_DEPRECATED_NO_EXPORT):
  const
    VTKFILTERSAMR_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: