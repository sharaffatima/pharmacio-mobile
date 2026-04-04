class AppLinkUrl {
  static const String baseUrl = "http://10.0.2.2:8000/api/v1";
  static const String login = "/auth/login/";
  static const String register = "/auth/register/";
  static const String logout = "/auth/logout/";
  static const String me = "/auth/me/";
  static const String changePassword = "/auth/change-password/";

  // Inventory
  static const String inventory = "/inventory/";

  // Offers
  static const String offersUpload = "/offers/upload/";
  static const String offersUploads = "/offers/uploads/";

  // Proposals
  static const String availableOffers = "/available-offers/";
  static const String purchaseProposals = "/purchase-proposals/";
  static const String compareOffers = "/purchase-proposals/compare/";
  static const String generateProposal = "/purchase-proposals/generate/";

  // Sales
  static const String recordSale = "/sales/";
}
