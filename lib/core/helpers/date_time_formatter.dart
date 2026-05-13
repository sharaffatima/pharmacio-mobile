String formatTransactionDate(String isoDate) {
  try {
    final dt = DateTime.parse(isoDate).toLocal();
    return '${dt.year}-${_pad(dt.month)}-${_pad(dt.day)} '
        '${_pad(dt.hour)}:${_pad(dt.minute)}';
  } catch (_) {
    return isoDate;
  }
}

String _pad(int n) => n.toString().padLeft(2, '0');
