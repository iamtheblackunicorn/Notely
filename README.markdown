<p align="center">
 <img src="https://github.com/iamtheblackunicorn/Notely/raw/main/assets/images/banner.png"/>
</p>

# Notely :crossed_swords:

*Manage your thoughts like a Viking.* :crossed_swords:

## About :books:

I was sick and tired of using shitty note-taking apps that require either logins or save a lot of data about me.
I wanted something simple that would allow me to write down quick notes without any complications. Notely is that app! ;)

## Building :hammer:

Make sure that you have the following programs installed:

- Flutter SDK
- Dart SDK
- Android Studio
- Android SDK
- Java JDK
- Xcode
- Make
- Git

After you have installed these, run this command to generate a keystore for the app.

```bash
keytool -genkey -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

After having done that, move the keystore to `android/app` and fill in the fields for the keystore password in the file `android/app/key.properties`.

Finally, run these commands:

```bash
$ flutter pub get
$ flutter build apk
```

You have now generated a release build of *Notely*.

## Download :pen:

- :crossed_swords: Release 1.0.0: [Download](https://github.com/iamtheblackunicorn/Notely/releases/download/v.1.0.0/Notely-1.0.0-Release.apk) (17.43 MB)

## Usage :pick:

Download the APK file from the section above and make sure you know how to install an APK downloaded from the internet.
The first screen is the homescreen. This will take you to either creating a new note or the info screen. On the "Notes" screen you have three icons
in the top-right corner. The first is a "back-button". This takes you back to the homescreen. The second saves what you currently have in the editing-window, and the third, creates a new note. If you press the "hamburger" in top-left, you can see and view all your saved notes. The info screen displays info about the app. Pretty self-explanatory.

## Extending the supported languages :book:

Notely is localized for German and English. To add a language, simply create a filed called `app_languagecode.arb` in `lib/l10n` where `languagecode` represents the languagecode for the language you want to add. If it were Spanish for example, you would create a file called `app_es.arb`.
Copy and past the contents from one of the other `*.arb` files and edit the strings accordingly.
Finally, add this line in the list `supportedLocales` in the file `lib/main.dart`.

```dart
const Locale('languagecode', ''),
```

`languagecode` represents the language you are translating for.

## Changelog :black_nib:

### Initial Release:

- upload to GitHub
- polishing of the logic
- minor fixes

## Note :scroll:

- *Notely* :crossed_swords: by Alexander Abraham :black_heart: a.k.a. *"The Black Unicorn" :unicorn:*
- licensed under the MIT license.
