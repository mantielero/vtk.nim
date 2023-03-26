when defined(VTKPARALLELMPI4PY_STATIC_DEFINE):
else:
when not defined(VTKPARALLELMPI4PY_DEPRECATED):
  discard
when not defined(VTKPARALLELMPI4PY_DEPRECATED_EXPORT):
  const
    VTKPARALLELMPI4PY_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKPARALLELMPI4PY_DEPRECATED_NO_EXPORT):
  const
    VTKPARALLELMPI4PY_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: