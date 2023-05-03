# ait_flutter_template

A new Flutter project.

## Getting Started
Please use these command in command line to get started:
1. `dart pub global activate melos` -> to install melos in system, make sure melos commannd can be run from command line after doing this, if not, add Pub/Cache/bin (not sure where, depends on OS and installation) to PATH env
2. `melos bootstrap` -> to run flutter pub get for all available packages
3. copy `.env.example` in root project to `.env` in root project, edit according to development environment
4. `melos env` -> generate .env dart code based on .env files
5. `flutter run` -> to run the app
