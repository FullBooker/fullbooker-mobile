# CHANGELOG

- feat: scaffold new profile items
  - add new profile items
  - setup switching to hosting banner
  - add legal and change password page

## 0.0.200

- feat: link product details page to api

## 0.0.199

- feat: scaffold product details page
  - create product details page
  - add new product carousel widget with dummy images
  - add mock product response
  - fix secondary button text color
  - setup product details page router

## 0.0.198

- feat: improve event details formatting
  - add new product card to be a gesturedetector

## 0.0.197

- feat: add current product state variable

## 0.0.196

- feat: wire up permission checks in location selection page
  - add location zero state image

## 0.0.195

- feat: Google map enhancements
  - improve location selection page UI
  - defaults to a constant location of no permissions have been set
  - extract all UI logic into handler class

## 0.0.194

- feat: add location selection page
  - implement location search
  - implement location selection on a map
  - make the search autocomplete api results more relevant

## 0.0.193

- feat: fix homepage appbar
  - fix appbar on home page
  - add previous navigation for product pages

## 0.0.192

- feat: collect a phone number during creation of an account

## 0.0.191

- fix(signout): record signin method for optimized signout

## 0.0.190

- feat: show products in the home page
  - link products page to API
  - show products in the home page

## 0.0.189

- feat: scaffold some products in the product page

## 0.0.188

- feat: scaffold new product card

## 0.0.187

- feat: scaffold product summary page

## 0.0.186

- feat: fetch the profile from backend when getting to the profile page

## 0.0.185

- feat: scaffold product preview page
  - extract the full name from the same profile view model
  - match the home page to the design
  - add profile endpoints
  - setup fetch profile action
  - fix profile scaffolding

## 0.0.184

- feat: scaffold add ticket price page

## 0.0.183

- feat: scaffold product pricing page

## 0.0.182

- feat: scaffold product photos page
  - add image prompt svg
  - add mock network images

## 0.0.181

- feat: scaffold product date and time

## 0.0.180

- feat: scaffold location page

## 0.0.179

- feat: scaffold basic details page

## 0.0.178

- feat: fix CI deployment

## 0.0.177

- feat: link the product setup pages

## 0.0.176

- feat: finalize scaffolding the product setup summary page

## 0.0.175

- feat: scaffold product category page

## 0.0.174

- feat: scaffold product type page

## 0.0.173

- feat: setup deployment to Google Play Store
  - setup deployment to dev and prod based on the branch

## 0.0.172

- feat: setup custom appbar on the home page

## 0.0.171

- feat: make all login endpoints unauthenticated in custom client

## 0.0.170

- feat: finalize custom client fixes
  - add refresh token logic (flagged until API is available)
  - pass authorization token based on whether a request is authenticated or not
  - make login endpoint unauthenticated

## 0.0.169

- feat: cleanup app client
  - add refresh token to the custom client
  - setup refresh token endpoint
  - add refresh token logic to custom client
  - remove unused variables to auth credentials object
  - add token expiry checks

## 0.0.168

- feat: setup product endpoints on AppConfig

## 0.0.167

- feat: setup host state in app state middleware

## 0.0.166

- feat: setup host app state

## 0.0.165

- feat: add custom app onboarding events

## 0.0.164

- feat: resume app scaffolding
  - remove all instances of elevated button and replace with a button component
  - remove error state widget
  - update app TODOs

## 0.0.163

- feat: add password autofill (#38)

## 0.0.162

- Merge branch 'main' into add-password-autofill

## 0.0.161

- feat: move all login pages to presentation folder (#37)

## 0.0.160

- feat: add TextInput.finishAutofillContext() to gracefully complete Autofill context

## 0.0.159

- feat: add email and password autofill
  - setup password autofill in login page and forgot pin page
  - cleanup navigation after logout in logout action
  - remove logout from products page

## 0.0.158

- feat: propagate field level responses from the backend

## 0.0.157

- feat: propagate errors from the backend onto the UI
  - remove processHTTPResponse function
  - add middleware to handle missing response codes
  - enhance error parsing in custom client
  - apply error propagation from backend across all actions

## 0.0.156

- feat: fix app name to start with a capital F

## 0.0.155

- feat: remove unnecessary scopes during google sign in

## 0.0.154

- feat: move all login pages to presentation folder

## 0.0.153

- feat: restore code shrinking and build optimization (#36)
  - add sample release note starters
  - reduce app bundle size
  - enable code shrinking in build.gradle file
  - show debug OTP only in dev mode

## 0.0.152

- feat: restore code shrinking and build optimization
  - add sample release note starters
  - reduce app bundle size
  - enable code shrinking in build.gradle file
  - show debug OTP only in dev mode

## 0.0.151

- feat: scaffold password reset (#35)
  - cleanup create account page
  - scaffold request OTP page
  - create request otp action
  - update onboarding state with otp value
  - update verify otp page route config
  - add debug print to print otp to console in dev mode
  - remove old pin input package that caused issues
  - add new pin_code_text_field package
  - wrap new OTP workflows
  - fix pin input code text field ui
  - finalize verify OTP page scaffolding
  - fix otp verification logic
  - add set new password action
  - add new password view model values to onboarding state
  - fix error handling in all actions when a 400 is returned from the
  - server
  - add new missing endpoints in app config
  - improve custom text input UI

## 0.0.150

- fix: apply onboarding bug fixes

## 0.0.149

- feat: pply onboarding fixes
  - use correct email address and password when changing the password
  - add a debug OTP widget to show the debug otp
  - setup reset password show/hide bools in onboarding state
  - use correct email address when verifying otp

## 0.0.148

- feat: scaffold set new password page
  - add set new password action
  - add new password view model values to onboarding state
  - fix error handling in all actions when a 400 is returned from the server
  - add new missing endpoints in app config
  - improve custom text input UI

## 0.0.147

- feat: fix otp verification logic

## 0.0.146

- feat: finalize verify OTP page scaffolding

## 0.0.145

- feat: fix pin input code text field ui

## 0.0.144

- feat: scaffold pin verification page
  - remove old pin input package that caused issues
  - add new pin_code_text_field package
  - wrap new OTP workflows

## 0.0.143

- feat: finalize reset otp page scaffold
  - create request otp action
  - update onboarding state with otp value
  - update verify otp page route config
  - add debug print to print otp to console in dev mode

## 0.0.142

- feat: scaffold reset password pages
  - cleanup create account page
  - scaffold request OTP page

## 0.0.141

- feat: app fixes (#34)

## 0.0.140

- feat: setup Firebase Crashlytics on the app

## 0.0.139

- feat: setup Firebase analytics

## 0.0.138

- feat: fix app colors

## 0.0.137

- feat: finalize textStyle fixes for the whole app

## 0.0.136

- feat: unify app spaces
  - apply consistent spacing for all app widgets

## 0.0.135

- feat: cleanup text widgets

## 0.0.134

- feat: cleanup all app colors

## 0.0.133

- feat: generate changelog (#32)

## 0.0.132

- feat: generate product changelog
  - run deployment scripts on main branch as well

## 0.0.131

- feat: setup Google Play Store Deployment
  - setup play store deployment
  - Setup GPlay service account
  - Link GPlay service account to Gcloud

## 0.0.130

- feat: deploy the whole app on ubuntu latest

## 0.0.129

- feat: use github run_number instead of run_id for build number

## 0.0.128

- feat: setup Android CI/CD
  - add environment secrets
  - setup android deployment script

## 0.0.127

- feat: remove env from code base

## 0.0.126

- feat: setup tests on CI

## 0.0.125

- feat: update CI deployment docs

## 0.0.124

- feat: finalize create account workflow
  - sign in and navigate a user to the home page once their account is created

## 0.0.123

- feat: extract endpoints dynamically from app config

## 0.0.122

- feat: wire up create account action
  - finalize create account page scaffolding
  - add create account variables to onboarding state
  - update create account strings

## 0.0.121

- feat: scaffold create account page
  - add navigator key in app bootstrap
  - add create account view model
  - improve create account page UX
  - remove old components from create account page
  - mark items for later deletion

## 0.0.120

- feat: implement show/hide password functionality

## 0.0.119

- feat: add google signout when logging out of the app
  - disable logout from products page
  - add show password bool to show/hide password
  - -

## 0.0.118

- feat: improve app fonts and styling

## 0.0.117

- feat: fix sign in with google

## 0.0.116

- feat: add sign in with Google functionality

## 0.0.115

- feat: add a good homepage zero state
  - add copyright in profile page
  - add app version in login page

## 0.0.114

- feat: implement profile page

## 0.0.113

- feat: add custom appbar and notification bell

## 0.0.112

- feat: setup hosting side pages
  - setup product page
  - setup profile page scaffold
  - setup home page
  - update bottom nav items
  - update bottom nav to navigate correctly

## 0.0.111

- feat: update local deployment script to capture env

## 0.0.110

- feat: finalize login/logout workflow on the app

## 0.0.109

- feat: fix app loading in login page

## 0.0.108

- feat: finalize login/logout workflow happy cases

## 0.0.107

- feat: implement bottom navigation bar

## 0.0.106

- feat: fix home page navigation after successful login

## 0.0.105

- feat: navigate to home page after successful sign in
  - update hosting and user home pages
  - update app router configs
  - comment out unneccessary code for now

## 0.0.104

- feat: finalize login logic
  - add custom headers to custom client
  - update auth state to match API spec
  - update user state
  - add url resource host to api base URL
  - reduce prefix and suffix icon size

## 0.0.103

- feat: setup onboarding state to app DB

## 0.0.102

- feat: add error dialog for handling login errors

## 0.0.101

- fix: app fixes
  - fix app snackbars
  - improve app validator copy
  - finalize login validation checks in login page
  - update app router with latest configs

## 0.0.100

- feat: add sensible default values to onboarding state

## 0.0.99

- finalize custom client architecture setup on app

## 0.0.98

- feat: setup custom app client in app
  - setup app wrapper base
  - setup app wrapper widget
  - setup correct widget order from ap_bootstrap
  - modify custom client for usability

## 0.0.97

- feat: create custom API client interface and implement it

## 0.0.96

- feat: scaffold login page
  - add new sign in icon svgs
  - add high res app icon svg
  - finalize login page scaffolding
  - fix divider with text widget

## 0.0.95

- feat: implement iOS launch screen
  - change ios launch image to contain the full logo image

## 0.0.94

- feat: setup app icon and launch image for iOS

## 0.0.93

- feat: add custom components
  - add spacing options
  - add custom types
  - add custom text input component

## 0.0.92

- feat: add custom client
  - create login action
  - implement simple login logic in the sign in action
  - reconstruct dev API calls
  - add API response error strings
  - add process http response methods

## 0.0.91

- feat: add custom client

## 0.0.90

- feat: add login view model
  - add login view model
  - create a sample dev deploy to Google play store
  - add new onboarding state
  - add login view model to link login page to state
  - rename old widgets flagged for removal

## 0.0.89

- feat: cleanup onboarding overview page
  - rewrite onboarding overview page
  - cleanup onboarding images from figma
  - remove unused overview images
  - fix .env file loading
  - route user to overview page if they are not signed in
  - cleanup app routes
  - cleanup onboarding copy
  - rename old buttons to be replaced with new ones
  - add many todos for things to be removed

## 0.0.88

- feat: finalize app string extraction

## 0.0.87

- refactor: extract bottom nav strings

## 0.0.86

- feat: finalize string extraction

## 0.0.85

- refactor: extract more app strings

## 0.0.84

- refactor: extract more app strings

## 0.0.83

- feat: extract activity date selection strings

## 0.0.82

- feat: extract all endpoints into one place

## 0.0.81

- feat: extract all user side strings into one file

## 0.0.80

- feat: extract app strings part 1

## 0.0.79

- feat: extract widget strings

## 0.0.78

- refactor: landing page strings

## 0.0.77

- refactor: extract verify OTP page strings

## 0.0.76

- refactor: extract custom blue color

## 0.0.75

- refactor: extract sign up page strings

## 0.0.74

- refactor: extract sign in and change password strings

## 0.0.73

- chore: extract shared strings

## 0.0.72

- chore: extract exception strings

## 0.0.71

- refactor: extract asset image paths into constants

## 0.0.70

- feat: setup firebase analytics for app

## 0.0.69

- feat: setup app theme and finalize appbootstratp
  - add new flutter_dotenv and get_it packages
  - create new app_bootstrap file to handle bootstrapping
  - rename my app widget
  - create a custom stte observer
  - add appconfig class to handle app configuration
  - create new app theme
  - rename login controller
  - add new constants and enums

## 0.0.68

- feat: setup database architecture using sqflite
  - add new sqflite package
  - add database architecture
  - setup db migrations
  - create state db persistor architecture
  - add new bottom nav state

## 0.0.67

- feat: add user state

## 0.0.66

- feat: setup the basics of state management
  - setup app state
  - setup auth state
  - setup code generation
  - update app constants

## 0.0.65

- feat: change app logo to new version
  - change android app logo
  - change ios app logo

## 0.0.64

- feat: update google-services.json file to latest version

## 0.0.63

- feat: setup app router in my app widget

## 0.0.62

- feat: finalize router implementation

## 0.0.61

- feat: finalize all app routing transition to auto_route

## 0.0.60

- feat: setup all other pages to routes

## 0.0.59

- feat: setup shared landing page route

## 0.0.58

- feat: setup app router
  - add auto_route package
  - setup initial app route
  - add codegen step to makefile
  - setup consumer landing page as a route

## 0.0.57

- feat: upgrade packages to latest versions

## 0.0.56

- feat: organize code base according to DDD standards

## 0.0.55

- feat: add suggested folder structure

## 0.0.54

- feat: finalize page renaming properly

## 0.0.53

- refactor: rename host pages correctly

## 0.0.52

- refactor: refactor app colors part 1

## 0.0.51

- refactor: finalize code hygiene fixes

## 0.0.50

- feat: rename pages properly

## 0.0.49

- feat: rename all widgets properly in lib/features/consumer/widgets folder

## 0.0.48

- refactor: extract all regexps into one file

## 0.0.47

- refactor: reorganize app folders to the relevant places
  - reorganize folders
  - cleaup main file
  - extract widgets to their own file

## 0.0.46

- refactor: extract enums into one file

## 0.0.45

- feat: refactor landing page

## 0.0.44

- feat: finalize all linting fixes for the whole app

## 0.0.43

- feat: add linting fixes to all other remaining files

## 0.0.42

- feat: add linting fixes to all other remaining files

## 0.0.41

- feat: apply linting fixes to lib/shared/widgets folder

## 0.0.40

- feat: add linting fixes to lib/shared/pages folder

## 0.0.39

- feat: apply linting fixes to lib/features/host/pages folder

## 0.0.38

- feat: add linting errors to lib/features/host folder

## 0.0.37

- feat: apply linting fixes to utils file in consumer folder

## 0.0.36

- feat: apply linting fixes to lib/features/consumer/widgets folder

## 0.0.35

- feat: apply linting fixes to lib/features/consumer/pages folder

## 0.0.34

- feat: apply linting fixes to lib/features.auth folder

## 0.0.33

- feat: add linting fixes to lib/features/auth/controllers folder

## 0.0.32

- feat: apply linting issues to lib/core folder

## 0.0.31

- feat: add aggressive linter to app code base

## 0.0.30

- feat: remove private debug_key.properties file from source control

## 0.0.29

- feat: fix code linting issues
  - remove app keystore files from source control (debug.keystore, fullbooker.jks)
  - update gitignore
  - fix code linting errors
  - fix code rebase issues

## 0.0.28

- fix: fix host integrations

## 0.0.27

- fix; google sso related feedback

## 0.0.26

- feat: fix code shrinking erors
  - update local deploy version
  - add firebase analytics to settings.gradle
  - set sourcesets, desugaring in app/build.gradle
  - upgrade build dependencies
  - upgrade gradle from 8.3 to 8.4-all
  - Breaking change: code shrinking has been disabled since it is causing build issues

## 0.0.25

- feat: google sso

## 0.0.24

- feat: intro gallery page

## 0.0.23

- fix: expand allowed phone number formats

## 0.0.22

- Merge pull request #21 from FullBooker/setup-local-deployment
  - feat: Setup local deployment

## 0.0.21

- feat: add documentation and code cleanups

## 0.0.20

- feat: finalize manual deployment
  - add release notes v1
  - add deployment documentation
  - add local deploy script to help with deployment commands
  - setup firebase BOM and firebase analytics for the app
  - upgrade kitlin to v2.1.10
  - fix build issues in gradle file
  - add google services.json to build
  - Breaking change: the app has only been configured to use the SHA1 for the release key. Sign in with Google might fail

## 0.0.19

- feat: setup local deployment
  - fix build.gradel file issues
  - add proguard rules

## 0.0.18

- Merge pull request #20 from FullBooker:phone-number-validation
  - fix: expand allowed phone number formats

## 0.0.17

- fix: expand allowed phone number formats

## 0.0.16

- feat: cleanup test folder
  - set coverage threshold to 0.7%
  - remove unused tests
  - add coverage checker file
  - add test for get initials function
  - setup test folders properly

## 0.0.15

- feat: setup unit and widget tests
  - exclude coverage folder from git
  - setup make file to run tests
  - remove unused code in test folder

## 0.0.14

- fix: fixes error reporting & improves error messaging

## 0.0.13

- feat: reactive designs for payment details and ticket confirmation pages

## 0.0.12

- feat: cleanup event details page

## 0.0.11

- feat: fix button component UI
  - use raw material button for button component
  - add util function to get user initials
  - fix host details card UI

## 0.0.10

- feat: fix home page card glitches
  - improve button component layout
  - enable launch.json file to be shared
  - reorganize pubspec packages
  - fix iOS location permission declarations
  - add google font package
  - use open sans font across the app
  - fix pricing formatting
  - improve event card UI
  - add uniform spacing in event section
  - add shared app loading components

## 0.0.9

- feat: setup iOS build configs
  - set minimum deployment target to iOS 14 in Podfile
  - update info.plist file with display name
  - fix app display names string
  - fix app launch image
  - Breaking change: the lauch screen for iOS needs to conform to the design

## 0.0.8

- chore: upgrade to Flutter 3.27.4

## 0.0.7

- feat: consumer flows design conformity

## 0.0.6

- Merge pull request #1 from FullBooker/consumer-flows
  - feat: consumer flows

## 0.0.5

- feat: consumer flows

## 0.0.4

- feat: event flows v1

## 0.0.3

- feat: password management

## 0.0.2

- initial commit

## 0.0.1
