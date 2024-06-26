# MathMatchup

Players join the game and are separated into teams. The only catch is that they don't know their teammate.
They then have to answer questions to get points, which get added together with their partner's points at the end.
Teammates are revealed and the partnership with the most points wins!

The teacher's screen is meant to be projected to the class throughout the game.

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
5 (optional) If you want, you can skip running the frontend and simply visit [The MathMatchup Website](https://mathmatchup.brendanharan.com) and it will work with your locally running backend

## Running MathMatchup Flutter frontend

1. Install the Flutter framework
2. Run ```flutter pub get```
3. and ```dart run build_runner watch -d```
4. then ```flutter run``` or ```flutter build app --release``` to compile an apk for installation on android or ```flutter build web``` to compile for deployment to the web