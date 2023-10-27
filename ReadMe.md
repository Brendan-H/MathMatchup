# MathMatchup

 WIP - Not yet done! Progress will be resumed before the end of the year.

 - Frontend is built using dart + flutter. Analytics/crashlytics are done using Firebase, state management using Riverpod, and internationalization using the intl package. Spanish translations will be released once the app is finished.
 - Backend is the Spring framework, programmed in Java with a Postgres database.

Players join the game and are separated into teams. The only catch is that they don't know their teammate.
They then have to answer questions to get points, which get added together with their partner's points at the end.
Finally, teammates are revealed and the partnership with the most points wins!

## Running MathMatchup spring backend
1. Install Java 17 and PostgreSQL
2. Create a Postgres database
3. Modify application.properties with database details
4. Run the app

## Running MathMatchup flutter frontend

1. Run ```flutter pub get```
2. and ```dart run build_runner watch -d```
2. then ```flutter run```
