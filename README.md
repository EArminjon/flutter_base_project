# Flutter base app

Provide the base tools to develop a flutter app for production

## Dependencies

- **http**

  For HTTP(S) requests, basic  didn't need better in general
 
- **i18n_extension**

  The Easiest translation system, no code generator.

- **flutter_bloc**
 
  State management edited to make an architecture event to event

- **shared_preferences**
 
  Little storage like for theme preference, locale, settings

- **firebase_crashlytics**

  To report crash on Firebase (free)

- **firebase_analytics**

  To track / log on Firebase (free)

- **provider**
 
  Simple provider system to share resource.
  
- **flutter_launcher_icons**

  To generate the launcher app icons (see pubspec.yaml)
  
- **flutter_native_splash**

  To generate the splash screen (see pubspec.yaml)

## Firebase (Analytics, crashlytics...)

Change the [google-service.json](android/app/google-services.json) by yours.

##  Features

In this app, you can see how quickly manage :

- rooting
- storage
- theme
- translation
- phone settings importation
- api calls
- data sharing
- state management
- analytics

## What is in progress ?

Crashlytics seem to not send events to firebase, i'm working on that...  

(If you can help me : https://stackoverflow.com/questions/64090701/my-crashlytics-account-on-firebase-didnt-receive-event-is-my-config-right)
