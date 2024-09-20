# MathMatchup

[Jump to "Running MathMatchup" Section](#running-mathmatchup-spring-backend)

[Go to MathMatchup Website](https://mathmatchup.brendanharan.com)

[Go to MathMatchup App Hosted on Web](https://mathmatchupapp.brendanharan.com)

Players join the game and are automatically separated into teams of 2 or, if needed, 3. The only catch is that they don't know their teammate.
They then have to answer questions to get points, which get added together with their partner's points at the end.
Teammates are revealed and the partnership with the most points wins!

Technologies: Dart + Flutter, Java + Spring, PostgreSQL

## Repository Navigation

[MathMatchupBackend](/MathMatchupBackend/) - Directory that stores the Spring backend to the app and website

[math_matchup](/math_matchup/) - Directory that stores the MathMatchup Flutter app

[math_matchup_website](/math_matchup_website/) - Directory that stores the MathMatchup Flutter website (no longer updated, rewritten with Next.js)

[nextjs_website](/nextjs_website/) - Directory that stores the brand-new MathMatchup website, written with Typescript using Next.js

## Why rewrite the website?

It is always hard to throw away code, but I made the decision to completely rewrite the website for MathMatchup. The original website was written in Flutter, which, while familiar to me (something that sped up development), is not a great choice for a mostly static website because it has slow initial loading times and no SEO. Using Next.js solves both of these problems well (and gave me something new to learn), so it was an obvious choice.  

## App Features

- Fully supported internationalization with numbers and languages (currently English and Spanish)
- Responsive screen sizing tailored to phones and tablets
- Efficient state management using Riverpod for a predictable and scalable architecture 
- Dynamic theming with light and dark modes, instantly changeable without restating the app
- Custom splash screen with app logo and HARAN branding
- Comprehensive error handling with user-friendly alert dialogs and behind-the-scenes error logging using Firebase Analytics
- Optimized API calls reduce the number of database writes necessary by generating as much as possible, like all math questions, on the client side
- Endless customizations allow teachers to tailor nearly every aspect of games, ranging from the timer to the difficulty of questions (Easy, Medium, Hard, and Impossible)
- Real time updates for players in game, including scoring, leaderboards, and other players

## Backend Features

- CRUD operations for admin and teacher profiles (students don't need a profile to play)
- Bulk user creation from CSV files
- Integration with Firebase for secure user authentication
- Role-based authorization to ensure users can only access what they are supposed to
- Request logging for debugging and monitoring
- JPA and Hibernate for ORM and database operations
- Easily extendable service, controller, and repository layers
- RESTful API endpoints for user, team, player, and game operations

## Screenshots

### Homescreen
<img src="https://github.com/Brendan-H/MathMatchup/blob/master/math_matchup/Screenshots/mathmatchup_homescreen.png" width="250"><img src="https://github.com/Brendan-H/MathMatchup/blob/master/math_matchup/Screenshots/spanish_darkmode_homescreen.png" width="250">
### Teacher View Before/During Game
<img src="https://github.com/Brendan-H/MathMatchup/blob/master/math_matchup/Screenshots/game_settings_page.png" width="250"><img src="https://github.com/Brendan-H/MathMatchup/blob/master/math_matchup/Screenshots/teacher_game_page.png" width="250"><img src="https://github.com/Brendan-H/MathMatchup/blob/master/math_matchup/Screenshots/teacher_timer.png" width="250">
### Student View During Game
<img src="https://github.com/Brendan-H/MathMatchup/blob/master/math_matchup/Screenshots/game_page.png" width="250"><img src="https://github.com/Brendan-H/MathMatchup/blob/master/math_matchup/Screenshots/correct_answer.png" width="250"><img src="https://github.com/Brendan-H/MathMatchup/blob/master/math_matchup/Screenshots/incorrect_answer.png" width="250">
### Teacher View After The Game
<img src="https://github.com/Brendan-H/MathMatchup/blob/master/math_matchup/Screenshots/teammate_reveal_countdown.png" width="250"><img src="https://github.com/Brendan-H/MathMatchup/blob/master/math_matchup/Screenshots/leaderboard.png" width="250">



## Running MathMatchup Spring backend
1. Install Java 17 and PostgreSQL 16.3
2. Create a Postgres database (```psql``` then ```CREATE database database_name;```)
3. Modify application.properties (```MathMatchupBackend/src/main/resources/application.properties```) with database details
4. Run the Spring backend
5. (optional) If you want, you can skip running the frontend and simply visit [The MathMatchup Website](https://mathmatchupapp.brendanharan.com) and it will work with your locally running backend

## Running MathMatchup Flutter frontend

1. Install the [Flutter](https://flutter.dev) framework
2. Run ```flutter pub get```
3. and ```dart run build_runner watch -d```
4. then ```flutter run``` or ```flutter build app --release``` to compile an apk for installation on android or ```flutter build web``` to compile for deployment to the web

## Running MathMatchup Website

1. Install the [Flutter](https://flutter.dev) framework
2. Run ```flutter pub get```
3. then ```flutter run -d chrome``` or ```flutter build web``` to compile for deployment to the web

## Other Notes
- CSV format for bulk user upload: email, last name, first name (ex. john.doe@school.edu, doe, john)
- Note that the MathMatchup app is meant for smaller screen sizes and may not look right when viewed on a computer
- The teacher's screen is meant to be projected to the class throughout the game.
- The team with 3 players (if there is an odd number of students playing) will have their total points multiplied by 2/3 to make the game even