when defined(VTKPARALLELMPI_STATIC_DEFINE):
else:
when not defined(VTKPARALLELMPI_DEPRECATED):
  discard
when not defined(VTKPARALLELMPI_DEPRECATED_EXPORT):
  const
    VTKPARALLELMPI_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKPARALLELMPI_DEPRECATED_NO_EXPORT):
  const
    VTKPARALLELMPI_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: