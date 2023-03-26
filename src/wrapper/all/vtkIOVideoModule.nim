when defined(VTKIOVIDEO_STATIC_DEFINE):
else:
when not defined(VTKIOVIDEO_DEPRECATED):
  discard
when not defined(VTKIOVIDEO_DEPRECATED_EXPORT):
  const
    VTKIOVIDEO_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOVIDEO_DEPRECATED_NO_EXPORT):
  const
    VTKIOVIDEO_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: