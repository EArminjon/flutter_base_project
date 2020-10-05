# Flutter base app

https://github.com/EArminjon/flutter_base_project

Provide the base tools to develop a flutter app for production

/!\ For Android, I setup all requierments in android/  
/!\ For IOS, you need to look all packages Readme.md to see what edit in ios/  

## Dependencies


| Dependency                    | Description                                                       |
| ----------------------------- |-------------------------------------------------------------------|
| http                          | For HTTP(S) requests, basic  didn't need better in general        |
| i18n_extension                | The Easiest translation system, no code generator                 |
| flutter_bloc                  | State management edited to make an architecture event to event    |
| shared_preferences            | Little storage for stock theme preference, locale, settings       |
| flutter_secure_storage        | Storage for tokens or user's personal data like email.            |
| firebase_crashlytics          | To report crash on Firebase (free)                                |
| firebase_analytics            | Storage for tokens or user's personal data like email             |
| firebase_core                 | Mandatory to use Firebase plugins                                 |
| provider                      | Simple provider system to share resource.                         |
| flutter_launcher_icons        | To generate the launcher app icons (see pubspec.yaml)             |
| flutter_native_splash         | To generate the splash screen (see pubspec.yaml)                  |


## Firebase (Analytics, crashlytics...)

Change the [google-service.json](android/app/google-services.json) by yours.

##  Features

In this app, you can see how quickly manage :

- rooting
- storage (preference & secure)
- theme
- translation
- phone settings importation
- api calls
- data sharing
- state management
- analytics

## What is in progress ?

None
