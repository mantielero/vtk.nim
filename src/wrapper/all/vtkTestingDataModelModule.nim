when defined(VTKTESTINGDATAMODEL_STATIC_DEFINE):
else:
when not defined(VTKTESTINGDATAMODEL_DEPRECATED):
  discard
when not defined(VTKTESTINGDATAMODEL_DEPRECATED_EXPORT):
  const
    VTKTESTINGDATAMODEL_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKTESTINGDATAMODEL_DEPRECATED_NO_EXPORT):
  const
    VTKTESTINGDATAMODEL_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: