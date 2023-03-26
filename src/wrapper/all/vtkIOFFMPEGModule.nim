when defined(VTKIOFFMPEG_STATIC_DEFINE):
else:
when not defined(VTKIOFFMPEG_DEPRECATED):
  discard
when not defined(VTKIOFFMPEG_DEPRECATED_EXPORT):
  const
    VTKIOFFMPEG_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOFFMPEG_DEPRECATED_NO_EXPORT):
  const
    VTKIOFFMPEG_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: