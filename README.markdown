<p align="center">
 <img src="https://github.com/iamtheblackunicorn/Notely/raw/main/assets/images/notelyBanner.png" width=550/>
</p>

# Notely :scroll:

*Manage your thoughts like a Viking.* :crossed_swords:

## About

I was sick and tired of using shitty note-taking apps that require either logins or save a lot of data about me.
I wanted something simple that would allow me to write down quick notes without any complications.

## Building

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

## Download

Still to come.

## Usage

Download the APK file from the section above and make sure you know how to install an APK downloaded from the Internet.
The first screen is a the homescreen. This will take you to either creating a new note or the info screen.
Pretty self-explanatory.

## Extending the supported languages

Notely is localized for German and English. To add a language, simply create a filed called `app_languagecode.arb` in `lib/l10n` where `languagecode` represents the languagecode for the language you want to add. If it were Spanish for example, you would create a file called `app_es.arb`.
Copy and past the contents from one of the other `*.arb` files and edit the strings accordingly.
Finally, add this line in the list `supportedLocales`.

```dart
const Locale('languagecode', ''),
```

`languagecode` represents the language you are translating for.

## Note :scroll:

- *Notely* by Alexander Abraham :black_heart: a.k.a. *"The Black Unicorn" :unicorn:*
- licensed under the MIT license.
