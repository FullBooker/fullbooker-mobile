## Flutter-specific rules
-keep class io.flutter.** { *; }
-dontwarn io.flutter.embedding.**

## Google libraries
-keep class com.google.** { *; }
-dontwarn com.google.**

-keep class com.google.android.gms.auth.api.credentials.** { *; }
-keep class com.google.android.gms.auth.api.credentials.CredentialsApi { *; }
-keep class com.google.android.gms.auth.api.credentials.HintRequest$Builder { *; }
-keep class com.google.android.gms.auth.api.credentials.HintRequest { *; }
