when defined(VTKFILTERSPARALLELSTATISTICS_STATIC_DEFINE):
else:
when not defined(VTKFILTERSPARALLELSTATISTICS_DEPRECATED):
  discard
when not defined(VTKFILTERSPARALLELSTATISTICS_DEPRECATED_EXPORT):
  const
    VTKFILTERSPARALLELSTATISTICS_DEPRECATED_EXPORT* = __attribute__(
        (__deprecated__))
when not defined(VTKFILTERSPARALLELSTATISTICS_DEPRECATED_NO_EXPORT):
  const
    VTKFILTERSPARALLELSTATISTICS_DEPRECATED_NO_EXPORT* = __attribute__(
        (__deprecated__))
when 0: