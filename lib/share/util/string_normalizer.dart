class StringNormalizer {
  static String normalizeString(String term) {
    return term.replaceAll(RegExp('[ÁáÀàÂâÃãÄä]'), 'a')
    .replaceAll(RegExp('[ÉéÈèÊêË]'), 'e')
    .replaceAll(RegExp('[ÍíÌìÎîÏï]'), 'i')
    .replaceAll(RegExp('[ÓóÒòÔôÕõÖö]'), 'o')
    .replaceAll(RegExp('[ÚúÙùÛûÜü]'), 'u')
    .replaceAll(RegExp('[Ññ]'), 'n')
    .replaceAll(RegExp('[Çç]'), 'c').toLowerCase();
  }
}