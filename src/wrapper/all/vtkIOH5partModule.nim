when defined(VTKIOH5PART_STATIC_DEFINE):
else:
when not defined(VTKIOH5PART_DEPRECATED):
  discard
when not defined(VTKIOH5PART_DEPRECATED_EXPORT):
  const
    VTKIOH5PART_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKIOH5PART_DEPRECATED_NO_EXPORT):
  const
    VTKIOH5PART_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: