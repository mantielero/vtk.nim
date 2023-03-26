when defined(VTKINFOVISLAYOUT_STATIC_DEFINE):
else:
when not defined(VTKINFOVISLAYOUT_DEPRECATED):
  discard
when not defined(VTKINFOVISLAYOUT_DEPRECATED_EXPORT):
  const
    VTKINFOVISLAYOUT_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKINFOVISLAYOUT_DEPRECATED_NO_EXPORT):
  const
    VTKINFOVISLAYOUT_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: