# Flutter Course Projects

Welcome to the repository of my Flutter course projects! These projects were last updated two years ago, and now I will be updating them to the latest version of Flutter.

## Project Overview

This Flutter course projects was initiated two years ago and served as a comprehensive learning resource for Flutter development. It covered various topics, including:

- **UI Design**: Creating beautiful and responsive user interfaces.
- **State Management**: Implementing efficient state management solutions.
- **API Integration**: Connecting the app to external APIs.
- **Navigation**: Navigating between different screens.
- **Authentication**: Implementing user authentication features.
- **Testing**: Writing tests for different components of the app.

## How to Update

- On android/build.gradle update "compileSdkVersion" to 33.
- On andoid/gradle.properties update "org.gradle.jvmargs".
    org.gradle.jvmargs=-Xmx1536M --add-exports=java.base/sun.nio.ch=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.lang.reflect=ALL-UNNAMED --add-opens=java.base/java.io=ALL-UNNAMED --add-exports=jdk.unsupported/sun.misc=ALL-UNNAMED
- On andoid/gradle-wrapper.properties update "distributionUrl".
    distributionUrl=https\://services.gradle.org/distributions/gradle-7.6-all.zip
- On pubspec.yaml update environment to sdk: ">=3.0.0 <4.0.0".
- Perform "flutter clean".
- Perform "flutter pub upgrade".

## To check updated version of every project go to list of branch
