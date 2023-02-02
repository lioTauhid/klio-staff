const double fontVeryBig = 26.0;
const double fontBig = 22.0;

const double fontMediumExtra = 20.0;
const fontMedium = 18.0;

const double fontSmall = 16.0;
const double fontVerySmall = 14.0;

const double dialogPadding = 20.0;

const String baseUrl = "https://app.klio.digital/api/";
// const String baseUrl = "https://blog.amirulhaque.xyz/api/";
late String token;
late String loginType;
bool darkMode = false;

const Map<String, dynamic> orderTypes = {
  'Dine In': 'assets/dine-in.png',
  'Takeway': 'assets/takeway.png',
  'Delivery': 'assets/delivery.png',
  'Reservation': 'assets/table.png',
  'Online': 'assets/takeway.png'
};
const List<String> discType = ['In Flat Amount', 'In percentage'];
const List<String> paymentType = ['Cash', 'Card', 'No Payment'];
const List<String> loginTypes = ['Login as Staff', 'Login as chef'];
