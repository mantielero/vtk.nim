when defined(VTKTESTINGGENERICBRIDGE_STATIC_DEFINE):
else:
when not defined(VTKTESTINGGENERICBRIDGE_DEPRECATED):
  discard
when not defined(VTKTESTINGGENERICBRIDGE_DEPRECATED_EXPORT):
  const
    VTKTESTINGGENERICBRIDGE_DEPRECATED_EXPORT* = __attribute__((__deprecated__))
when not defined(VTKTESTINGGENERICBRIDGE_DEPRECATED_NO_EXPORT):
  const
    VTKTESTINGGENERICBRIDGE_DEPRECATED_NO_EXPORT* = __attribute__((__deprecated__))
when 0: