when defined(VTKFILTERSPARALLELVERDICT_STATIC_DEFINE):
else:
when not defined(VTKFILTERSPARALLELVERDICT_DEPRECATED):
  discard
when not defined(VTKFILTERSPARALLELVERDICT_DEPRECATED_EXPORT):
  const
    VTKFILTERSPARALLELVERDICT_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKFILTERSPARALLELVERDICT_DEPRECATED_NO_EXPORT):
  const
    VTKFILTERSPARALLELVERDICT_DEPRECATED_NO_EXPORT* = __attribute__(
        (__deprecated__))
when 0: