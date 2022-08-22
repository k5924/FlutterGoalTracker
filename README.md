<br/>
<p align="center">
  <h3 align="center">Flutter Goal Tracker</h3>

  <p align="center">
    A simple budget tracking app built with the Flutter UI framework, Dart programming language, firebase and unsplash API.
    <br/>
    <br/>
  </p>
</p>



## Table Of Contents

* [About the Project](#about-the-project)
* [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Installation](#installation)
* [Demonstration](#demonstration)

## About The Project

This is a simple budget tracking app built with Flutter to load add, view, update and delete different budgeting goals.

Features:

* Uses Firebase for backend
* Uses Unsplash API for images for goals

You can use this app and connect to my firebase database but if you want to use this app with your own database, remove the firebase_options.dart and generated_plugin_registrant.dart and replace them with your own build by running the flutterfire cli utility.

If you use your own instance, you will have to set up unsplashes API keys in firebase remote config like I have done with your api keys named access_key and secret_key in remote config.

## Built With



* [Flutter](https://flutter.dev/)
* [Dart](https://dart.dev/)
* [Firebase](https://firebase.google.com/)
* [Unsplash](https://unsplash.com/developers)

## Getting Started

To get a local copy up and running follow these simple example steps.

### Installation

1. Clone the repo

```sh
git clone git@github.com:k5924/FlutterGoalTracker.git
```

3. CD into the repositories location in terminal

```sh
cd flutter_goal_tracker
```

4. List all devices that flutter apps can run on

```sh
flutter devices
```

5. Run the app on your device by specifying its name from the previous command

```sh
flutter run -d device_name
```

## Demonstration

[Here is a link to a playlist documenting the whole process of me building the application](https://youtube.com/playlist?list=PLnvYMKNt9C8g8zSkXfCAhDago3wAZ4vqs)

