// Onboarding strings
// TODO(abiud): improve this copy
const String overview1Title = 'Find your favorite events and activities';
const String overview1Copy = 'Discover, book, and enjoy your favorite events';
const String overview2Title = 'Find events and activities events nearby';
const String overview2Copy = 'Your Go-To App for nearby Events and activities';
const String overview3Title = 'Post your events and activities';
const String overview3Copy =
    'Amplify Your Reach. Share your events and activities here';

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

const String continueString = 'Continue';
const String editString = 'Edit';
const String nextString = 'Next';

const String to = 'to';

/// USER SIDE STRINGS

// Login
const String letsGetStarted = 'Let’s get started!';
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

const String changePasswordString = 'Set New Password';
const String newPasswordLabel = 'New Password';
const String newPasswordHint = 'Enter you new Password';
const String confirmNewPasswordLabel = 'New Password';
const String confirmNewPasswordHint = 'Confirm you new Password';
const String setAndConfirmPassword = 'Set and confirm your new password';

// Login page
const String welcomeString = 'Welcome back!';
const String signInCopy = 'Sign in to your account';
const String phonNumberString = 'Phone Number';
const String passwordString = 'Password';
const String forgotPasswordString = 'Forgot password? ';
const String resetHereString = 'Reset here';
const String createAccount = 'Create Account';
const String signInWithGoogleString = 'Sign in with Google';
const String dontHaveAccountString = 'Dont have an account? ';
const String orString = 'OR';
const String loginPageCopy = 'Sign in with your email and password';

const String emailAddressHint = 'Enter your email address';
const String passwordHint = 'Enter your password';
const String credentialsPrompt =
    'Please enter an email and a password to sign in';

// Request OTP page
const String enterPhoneOrEmailString =
    'Please enter either your email or phone number';
const String enterPhoneOrEmailCopy =
    'Please enter your email or phone number to reset your password';
const String emailString = 'Email';
const String phoneNumberString = 'Phone Number';

const String goBackToString = 'Go back to ';
const String loginString = 'Sign In';

// Sign up page
const String signupPageCopy = 'Enter your details below to create your account';
const String firstNameString = 'First Name';
const String firstNameHint = 'Enter your first name';
const String lastNameString = 'Last Name';
const String lastNameHint = 'Enter your last name';
const String emailAddressString = 'Email Address';
const String confirmPasswordString = 'Confirm Password';
const String confirmPasswordHint = 'Confirm your password';
const String signUpWithGoogleString = 'Sign up with Google';
const String alreadyHaveAnAccountString = 'Already have an account? ';

// Verify OTP page
String otpSentCopy(String identifier) =>
    'Enter the OTP code sent to $identifier';
const String resendCodeInString = 'Resend code in ';
const String resentOTPString = 'Resend OTP';
const String useDifferentString = 'Use a different ';
const String emailOrPhoneString = 'email / phone number';
const String verifyOTPString = 'Verify OTP';
String debugOTPValue(String otp) => 'Debug OTP: $otp';

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
const String failedToCreatePricing =
    'Failed to create pricing data for activity';
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
const String totalChargeableSession = 'Total Chargeable (Per Session)';
const String totalChargeableTicket = 'Total Chargeable (Per Ticket)';
String serviceFee(double value) => 'Service Fee ($value%)';
const String activityPricePrompt = 'How much will the activity cost';
const String costPerSession = 'Cost per session';
const String pricePerPersonPerSession =
    'What is the price per person per session';
const String maxTicketsPerSession = 'Maximum number of tickets per session';
const String maxTicketsPerDayPass = 'Maximum number of tickets per day pass';
const String submitString = 'Submit';

const String selectCategoryPrompt = 'Please select a category for your event';

const String tellUsAboutProduct = 'Tell us about your product';
const String pickOneThatApplies =
    'Pick the one that best describes your product';

const String selectStartEndDate = 'Please select a start and end date';
const String startBeforeEndDate = 'Please ensure start date is before end date';

const String whenWillThisEventHappen = 'When will this event happen';
const String timeStart = 'What time will this event start?';
const String timeEnd = 'What time will this event end?';

const String selectCategoryError = 'Please select at least one category';
const String ensurePricesForCategories =
    "Ensure you've set both prices and amounts for all selected categories";
const String howMuchPerTicket =
    'How much will you charge for this event per ticket?';
const String selectCurrencyForEvent = 'Select a currency for this event';
const String selectTicketCategories = 'Select Ticket Categories';
const String pricePerTicketCategory = 'Price Per Ticket Category';
const String selectTicketCategoryPrompt = 'Please select a ticket category';
const String maxTicketsPerCategory = 'Maximum number of tickets per category';
const String pleaseSelectTicketCategory = 'Please select a ticket category';

// Event Summary
const String failedToLoadProductsError = 'Failed to load products';

const String activitiesString = 'Activities';

const String newProductString = 'New Product';

// Image selection page
const String selectImagesAlert = 'Please select at least 2 images';
const String selectVideosAlert = 'Please select at least 2 videos';
const String uploadPhotosOfActivity = 'Upload photos of the activity';
const String uploadVideosOfActivity = 'Upload videos of the activity';
const String replaceString = 'Replace';
const String selectImageCopy = 'Tap below to select image';
const String selectVideoCopy = 'Tap below to select video';
const String browseString = 'Browse';

const String selectLocationPrompt = 'Please select a location';

const String selectLocationWithinKenya =
    'Please select a location within Kenya';

const String nameCannotBeEmpty = 'Name cannot be empty';
const String provideAnyOtherDetails = 'Provide any other details about this';

// Entities

const String trackingNumber = 'Tracking Number';
const String productName = 'Product Name';
const String priceString = 'Price';
const String statusString = 'Status';
const String nextActionsString = 'Next Actions';

const String activeString = 'Active';
const String disabledString = 'Disabled';

// Hosting bottom nav
const String switchToHostingString = 'Switch to Hosting';
const String searchString = 'Search';
const String profileString = 'Profile';
const String homeString = 'Home';
const String productsString = 'Products';

const String yesString = 'Yes';
const String noString = 'No';

const String noDataFound = 'No data found';
const String tryAgain = 'Try Again';

const String hoursString = 'Hours';
const String minutesString = 'Minutes';

const String logoutString = 'Logout';
const String buyATicketString = 'Buy A Ticket';

const String searchForActivitiesString = 'Search for activities and events';

const String activityLengthString = 'How long is the activity';

// Client error strings

const String slowInternet =
    'Looks like you have a slow internet connection. Please check your '
    'connection and try again';

const String userWithThatEmailExists =
    'Sorry, a user with that email address already exists';
const String userNotFound =
    'Sorry, we could not find a user with those details. Please confirm that '
    'the credentials you provided are correct';
const String wrongLoginCredentials = 'Your username or password do not match.';
const String passwordHasExpired = 'Your password has expired';

const String defaultUserFriendlyMessage = 'Sorry, an '
    ' error occurred, please try again or get help from our '
    'help center.';

// Product zero state
const String noProducts = 'No products added';
const String noProductsCopy =
    'Start building your catalog by adding your first product. Make it easy for customers to browse and purchase.';
const String createProductString = 'Create Product';

const String noName = 'No name';

const String madeByString = 'Made by Fullbooker';

String copyright() =>
    '© ${DateTime.now().year} Fullbooker. All rights reserved';

String appVersionFormat(String version) => 'Version: $version';

const String comingSoonTitle = 'Coming soon';
const String comingSoonCopy =
    'We\'re working on something great. Check back soon for updates!';

const String signInCancelled =
    'Sign-in canceled. Please select an account to continue.';
const String signInFailed = 'Sign-in failed. Please try again.';
const String createAccountFailedString =
    'Something went wrong while creating your account. Please try again later';
const String fillInAllFields = 'Please fill in all required fields to continue';

const String monthlySubscriptionPrompt = 'Is there a monthly subscription';
const String monthlySubscriptionString = 'Monthly Subscription';
const String pricePerPersonSub =
    'What is the price per person per subscription';

const String chargesSummary = 'Charges Summary';

const String confirmationNumber = 'Confirmation Number:';

// Request OTP page
const String resetYourPassword = 'Reset your password';
const String requestOTPCopy = 'Enter the email address linked to your account';
const String resetEmailPrompt =
    'Please enter an email address linked to your account';
const String errorSendingOTP =
    'Sorry, there was an error sending an OTP. Please try again later';
const String errorVerifyingOTP =
    'Sorry, there was an error verifying your OTP. Please try again later';
const String otpEmptyPrompt = 'Please enter a 4 digit OTP';

const String invalidOTP =
    'The code you entered is invalid. Please check and try again';

// Set new password strings
const String setPasswordPrompt =
    'Please enter and confirm your new password to continue';

const String errorChangingPassword =
    'Sorry, there was an error changing your password. Please try again later';

const String accountCreated = 'Account created';
const String accountCreatedCopy =
    'Your account has been created successfully. Welcome to Fullbooker';

const String passwordUpdated = 'Password Updated';
const String passwordUpdatedCopy = 'Sign in with your new password to continue';

// Setup product type page

const String setupProductType = 'Setup Product Type';
const String categoryStep1 = '1 of 2';
const String productType = 'Product type';
const String productTypeCopy =
    'Select the type of the product you want to create';

const String eventsName = 'Events';
const String eventDescription =
    'Music concerts, trade shows, seminars, product launches';
const String activities = 'Activities';
const String activitiesCopy = 'Gyms, hiking';

const String cancelString = 'Cancel';
const String previousString = 'Previous';

// Setup product category page
const String categoryStep2 = '2 of 2';
const String setupProductCategory = 'Setup Product Category';
const String productCategory = 'Product category';
const String productCategoryCopy = 'Select the product\'s category';
const String searchProductCopy = 'Search product categories...';
String showingResultsFor(String searchParam) =>
    'Showing results for “$searchParam”';

const String kidsString = 'Kids';
const String safari = 'Safari';
const String gym = 'Gym ';
const String concert = 'Concert';
const String wineAndDine = 'Wine & Dine';
const String hiking = 'hiking';

// Product Preview
const String setupEvent = 'Setup Event';
const String whatYouNeed = 'What you’ll need';
const String whatYouNeedCopy = '5 easy steps. Here’s what you will need';

const String beginString = 'Begin';
const String productCategoryAndType = 'Product category and type';
const String changeString = 'Change';

const String basicDetails = 'Basic details';
const String basicDetailsCopy = 'Describe your product';
const String location = 'Location';
const String locationCopy = 'Tell us where your event will be located';
const String dateAndTime = 'Date & time';
const String dateAndTimeCopy = 'When the event will happen';
const String media = 'Media';
const String mediaCopy = 'Photos of your event';
const String pricing = 'Pricing';
const String pricingCopy = 'Setup product price';
const String review = 'Review and submit';
const String reviewCopy = 'Final tweaks before submitting for review';

// Basic details
const String productBasicDetails = 'Basic details';
const String productBasicDetailsCopy =
    'Let’s describe your event. Enter a catchy name and description of your event';
const String nameYourProduct = 'Name your product';
const String productDescription = 'Description';
const String productDescriptionCopy = 'Describe your product';

// Location page
const String searchLocation = 'Search Locations...';
const String kicc = 'KICC';
const String nairobi = 'Nairobi';

const String dateString = 'Date';
const String selectDateHint = 'Select date';
const String starting = 'Starting';
const String ending = 'Ends on';
const String atString = 'at';
const String chooseTime = 'Choose time';

// Photos page
const String photos = 'Photos';
const String photosCopy = 'Add at least 6 high quality photos of your event';
const String addPhoto = 'Add Photo';

// Pricing page
const String addPricingErrorMsg = 'Add at least one pricing option to continue';

const String earlyBird = 'Early Bird';
const String standard = 'Standard';
const String vip = 'VIP';
const String vvip = 'VVIP';

String discountValue(double value) => '$value% discount';
String maxAllowedTickets(int value) => '$value tickets allocated';
String priceValue(double value) => 'KES ${value.toStringAsFixed(0)}';
const String addPrice = 'Add Price';

// Add ticket price page

const String addTicketPrice = 'Add ticket price';
const String setupTickerPrice = 'Set your ticket price';
const String setupTickerPriceCopy = 'Customize your ticket pricing';

String serviceFeeDisclaimer(double percentage) =>
    'We charge a ${percentage.toInt()}% service fee on each sale';

const String priceHint = 'Enter an amount';

String maximumTickets(String ticketType) =>
    'Maximum number of $ticketType tickets';
const String maxTicketsHint = 'Enter a number';

const String discountLabel = 'Discount(optional)';
const String discountHint = 'Enter discount';

// Review and submit page
const String reviewAndSubmit = 'Review and submit';

const String testProductDescription =
    'Experience the unforgettable journey of Taylor  Swift’s Eras Tour, a celebration of her music, artistry,  and storytelling...';

const String testEventName = 'Music Concert, Eras tour Taylor swift ';
const String testLocation = 'George Padmore Road';
const String testDate = '22 Feb 2025';
const String testTime = '2 - 5 PM';
String photosAdded(int number) => '$number photos added';

const String enterPhone = 'Enter phone number';

const String setEventLocation = 'Set your event’s location';
const String locationZeroStateCopy =
    'Make it easy for guests to find you by selecting your exact spot';
const String pickLocation = 'Pick Location';
const String enableLocation = 'Enable Location';
const String openSettings = 'Open Settings';

const String locationPermsTitle = 'We Need Your Location';
const String locationPermsCopy =
    'We need your location to pin your event and help guests find it';

const String viewString = 'View';

const String bookings = 'Bookings';
const String payments = 'Payments';

const String deactivateProduct = 'Deactivate Product';

const String publishedString = 'Published';
const String draftString = 'Draft';

const String switchToHosting = 'Switch To Hosting';
const String switchToHostingCopy =
    'Switch to hosting to setup your products, view your earnings, and more';

const String legal = 'Legal';
const String legalCopy = 'Terms and conditions, opt-out';

const String changePassword = 'Change Password';
const String changePasswordCopy = 'Update your password';

const String noCategoriesFound = 'No categories found';
const String noCategoriesFoundCopy =
    'Try again later or adjust your filters to see more options.';

const String completeSetup = 'Complete Setup';

const String createProductError =
    'Please provide a name, description and a subcategory to continue';

const String addLocationError =
    'Please provide a location for your event to continue';

const String selectCurrencyHint = 'Choose currency';

const String pricingBreakdown = 'Pricing breakdown';

const String serviceFeeLabel = 'Service fee (KES 150 + 7%)';
const String yourBuyers = 'Your Buyers Pay';
const String yourRevenue = 'Your Revenue';

const String iWantBuyersToPay = 'I want my buyers to pay the service fee';

const String productInReview = 'Product in review';
const String productInReviewCopy =
    'Your product is in review and will be live within 48 hours';
