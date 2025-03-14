# fullbooker

Your favorite events await!

## Getting Started

### Proposed folder structure

```sh
lib/
│── core/
│   ├── common/
│   │   ├── constants.dart
│   │   ├── theme.dart
│   │   ├── app_router.dart
│   ├── errors/
│   │   ├── failure.dart       # Custom failure classes
│   │   ├── sentry_service.dart # Sentry error reporting integration
│   ├── use_cases/
│   ├── network/
│   ├── services/
│   │   ├── google_sign_in_service.dart # Google authentication
│   │   ├── storage_service.dart        # Local storage helper
│
│── shared/
│   ├── widgets/
│   │   ├── button.dart
│   │   ├── text_field.dart
│   │   ├── event_card.dart
│   ├── pages/
│   │   ├── login_page.dart
│   │   ├── signup_page.dart
│   │   ├── onboarding_page.dart
│   ├── components/
│   │   ├── loading_indicator.dart
│   │   ├── error_dialog.dart
│
│── store/                     # AsyncRedux state management setup
│   ├── app_state.dart         # Root state of the application
│   ├── actions/               # AsyncRedux actions
│   │   ├── login_action.dart
│   │   ├── event_action.dart
│   ├── reducers/              # Reducers for managing state changes
│   │   ├── app_reducer.dart
│
│── features/
│   ├── consumer/
│   │   ├── presentation/
│   │   ├── application/
│   │   ├── domain/
│   │   ├── infrastructure/
│   ├── host/
│   │   ├── presentation/
│   │   ├── application/
│   │   ├── domain/
│   │   ├── infrastructure/
│   ├── event/
│   │   ├── presentation/
│   │   ├── application/
│   │   ├── domain/
│   │   ├── infrastructure/
│
│── database/                  # Local database integration with sqflite
│   ├── app_database.dart      # Database instance setup
│   ├── dao/                   # Data Access Objects (DAOs)
│   │   ├── event_dao.dart
│   │   ├── user_dao.dart
│   ├── migrations/            # Database migrations
│
│── localization/
│   ├── en.json
│   ├── sw.json
│
│── config/
│   ├── env.dart
│
│── main.dart
```
