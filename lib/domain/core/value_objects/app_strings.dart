// Exception strings
const String youWereLoggedOutString = 'You were logged out';
const String permissionDeniedString =
    'Permission denied: you do not have the permissions to perform that action';
const String notFoundString =
    "Could not find what you're looking for, please try again";
const String serverError = 'Server error';

const String genericErrorString =
    'Oops! Something went wrong on our end, please try again';

// Shared
const String okThanksString = 'Ok, Thanks';
const String homeString = 'Home';
const String continueString = 'Continue';

/// USER SIDE STRINGS
///

// Login
const String verifyNumberString =
    'Please verify that the number you entered is correct';
const String weCouldNotVerifyOTPString =
    'We could not verify that OTP, please try again';
const String passwordTooCommonString =
    'Please verify that your password is not too common';

// Change password
const String passwordChangedTitle = 'Password reset successfully';
const String passwordChangedCopy = 'You have reset your password successfully';

const String enterNewPasswordTitle = 'Please enter a new password below';
const String enterNewPasswordString = 'Enter New Password';
const String reEnterNewPasswordString = 'Re-enter New Password';
const String changePasswordString = 'Change Password';

// Login page
const String welcomeString = 'Welcome';
const String signInCopy = 'Sign in to your account';
const String phonNumberString = 'Phone Number';
const String passwordString = 'Password';
const String forgotPasswordString = 'Forgot password? ';
const String resetHereString = 'Reset here';
const String signInString = 'Sign In';
const String signUpString = 'Sign Up';
const String signInWithGoogleString = 'Sign in with Google';
const String dontHaveAccountString = 'Dont have an account? ';
const String orString = 'Or';

// Request OTP page
const String enterPhoneOrEmailString =
    'Please enter either your email or phone number';
const String enterPhoneOrEmailCopy =
    'Please enter your email or phone number to reset your password';
const String emailString = 'Email';
const String phoneNumberString = 'Phone Number';

const String goBackToString = 'Go back to ';
const String loginString = 'Login';

// Sign up page
const String firstNameString = 'First Name';
const String lastNameString = 'Last Name';
const String emailAddressString = 'Email Address';
const String confirmPasswordString = 'Confirm Password';
const String signUpWithGoogleString = 'Sign up with Google';
const String alreadyHaveAnAccountString = 'Already have an account? ';

// Verify OTP page
String otpSentCopy(String phone) => 'An OTP code has been sent to $phone';
const String resendCodeInString = 'Resend code in ';
const String resentOTPString = 'Resend OTP code';
const String useDifferentString = 'Use a different ';
const String emailOrPhoneString = 'email / phone number';

// Consumer landing page
const String popularNowString = 'Popular Now';
const String nearYouString = 'Near You';
const String recommendedString = 'Recommended For You';

// Consumer landing page
const String locationServicesDisabled = 'Location services are disabled.';
const String locationServicesDenied = 'Location permissions are denied';
const String locationServicesPermanentlyDenied =
    'Location permissions are permanently denied, we cannot request permissions';
const String backHomeString = 'Back Home';
const String mapString = 'Map';
const String viewMapString = 'View Map';
const String eventDetailsString = 'Event Details';

// Payment confirmation page
const String thankYouForPayment = 'Thank you for your payment';
const String downloadString = 'Download ';
const String yourTicketBelow = 'your ticket below ';
const String orCheckEmailText = 'or check your email at ';
const String downloadTicket = 'Download ticket';

// Payment summary page
const String confirmPaymentString = 'Confirm Payment';
const String summaryString = 'Summary';
const String ticketDetailsString = 'Ticket Details';
const String nameString = 'Name';
const String dateAndTimeString = 'Date & Time';
const String noOfTickets = 'No. of tickets';
const String totalHours = 'Total Hours';
const String grandTotal = 'Grand Total';
const String promoCode = 'Enter your promo code here';

// Other widgets
const String ticketPriceString = 'Ticket Price';
const String totalString = 'Total';
const String proceedToCheckoutString = 'Proceed to checkout';
const String selectDateString = 'Select Date';
const String buyTicketString = 'Buy Ticket';

const String seeAllString = 'See All';

// MPESA Checkout

String checkoutSentToString(String phone) => 'MPESA Checkout sent to $phone';
const String paymentAlert = 'Payment Alert';
const String followInstructions = 'Follow the instructions below:';
const String paymentInstructions = 'Instructions to Pay:';
const String checkPopup = 'Check on a payment pop-up on your phone.';
const String inputMpesaPIN = 'Input your MPESA PIN and click OK.';
const String mpesaConfirmation =
    'An MPESA confirmation SMS will be sent to you.';

const String mpesaNo = 'M-Pesa Mobile No';
const String completePayment = 'Complete payment';

const String cardHolderName = 'Cardholder Name';
const String cardNumber = 'Card Number';
const String expiryDate = 'Expiry Date (MM/YY)';
const String cvvString = 'CVV';

const String billingAddress = 'Billing Address (Optional)';
const String selectPaymentMethod = 'Select a payment method';

String hostedByString(String hostName) => 'Hosted by $hostName';

const String addAtLeastOneTicket = 'Please add at least one ticket';
const String selectADateString = 'Please set a date';
const String useBulkBookingString =
    'Please use bulk booking if you need more than 3 tickets';

const String ticketsString = 'Tickets';

String totalReviewCount(int reviews) => '$reviews Reviews';

const String lessThan3Tickets = '3 tickets or less ?';
const String moreThan3Tickets = 'More than 3 tickets?';

const String singleTickets = 'Single Tickets';
const String bulkBooking = 'Bulk Booking';

const String thisFieldIsRequired = 'This field is required';
const String selectPricingTierPrompt =
    'Please select a pricing tier for this ticket';
const String selectNumberOfTicketsPrompt = 'Select number of tickets';

String ticketNumber(int number) => 'Ticket $number';
const String quantityString = 'Quantity';
const String idNumber = 'ID/ Passport Number';
const String addMoreTicketsString = 'Add More Tickets';
const String saveString = 'Save';
const String pricingTier = 'Pricing Tier';

const String ticketSummaryString = 'Tickets Summary';

const String deleteString = 'Delete';

const String ticketsWillAppearString = 'Tickets will appear here when added';

/// HOST SIDE STRINGS
///

// activity selection page
const String activityLengthPrompt = 'Please set how long the activity is';
const String startEndTimePrompt =
    'Please set both start and end time for at least one day of the week';
const String dayStartEndTimePrompt =
    "Please set both the start and end times for the days you've selected";
const String availabilityCreationError =
    'Failed to create availability for activity';
const String activityTimeString = 'When does this activity happen?';
const String openWeekDays = 'Select the days of the week that you are open';

const String startTimeString = 'Start time';
const String endTimeString = 'Start time';

const String closedTimeOfYearString =
    'Choose the specific days of the year when '
    'your activity will  remain closed (Optional)';
const String activityNotOpen = 'Activity Not Open On';

// Activity day pass page

const String selectCurrencyPrompt =
    'Please set the currency, price and maximum booking amount for the activity';
const String dayPassPrompt = 'Is there a day pass for your product';
const String selectCurrencyPromptForActivity =
    'Select a currency for this activity';
const String dayPassString = 'Day Pass';
const String pricePerPerson = 'What is the price per person per day pass';
const String currencySelectGeneralPrompt = 'Please select a currency';
const String dayPassMaxTickets = 'Maximum number of tickets per day pass';
const String totalChargeable = 'Total Chargeable (Per Session)';
String serviceFee(double value) => 'Service Fee ($value%)';
const String activityPricePrompt = 'How much will the activity cost';
const String costPerSession = 'Cost per session';
const String pricePerPersonPerSession =
    'What is the price per person per session';
const String maxTicketsPerSession = 'Maximum number of tickets per session';
const String publish = 'Publish';

const String selectCategoryPrompt = 'Please select a category for your event';

const String tellUsAboutProduct = 'Tell us about your product';
const String pickOneThatApplies =
    'Pick the one that best describes your product';

const String selectStartEndDate = 'Please select a start and end date';
const String startBeforeEndDate = 'Please ensure start date is before end date';

const String whenWillThisEventHappen = 'When will this event happen';
const String timeStart = 'What time will this event start?';
const String timeEnd = 'What time will this event end?';


