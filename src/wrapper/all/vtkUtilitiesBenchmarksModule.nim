when defined(VTKUTILITIESBENCHMARKS_STATIC_DEFINE):
else:
when not defined(VTKUTILITIESBENCHMARKS_DEPRECATED):
  discard
when not defined(VTKUTILITIESBENCHMARKS_DEPRECATED_EXPORT):
  const
    VTKUTILITIESBENCHMARKS_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKUTILITIESBENCHMARKS_DEPRECATED_NO_EXPORT):
  const
    VTKUTILITIESBENCHMARKS_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: