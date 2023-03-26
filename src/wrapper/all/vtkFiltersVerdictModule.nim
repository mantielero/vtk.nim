when defined(VTKFILTERSVERDICT_STATIC_DEFINE):
else:
when not defined(VTKFILTERSVERDICT_DEPRECATED):
  discard
when not defined(VTKFILTERSVERDICT_DEPRECATED_EXPORT):
  const
    VTKFILTERSVERDICT_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKFILTERSVERDICT_DEPRECATED_NO_EXPORT):
  const
    VTKFILTERSVERDICT_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: