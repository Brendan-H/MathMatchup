# Roadmap

## Planned Features

 ### Comprehensive Backend Integration Testing
 - GameController - DONE
 - PlayerController - DONE
 - UserController - DONE

 ### Game analytics
 - Track how many questions each student answers
 - Track how many questions each student answers correctly
 - Track how many questions each student answers incorrectly
 - Graph the student vs class average for correct divided by incorrect

Steps for game analytics:

F is done on frontend, B is done on backend, A is done on both

- is something in progress, | is something completed

| A: Game ends
| F: Player data is finalized, with necessary computations like percent correct computed and stored so as to not have to waste money on server time
| F -> B: Player data is sent to backend
| B: Player data is stored in database
| B: Class data is updated with player data
| B : Full class data (like average percent correct) is computed and stored
| B: Necessary player data for graphing is aggregated in game data table
| B -> F: Class data is sent to teacher frontend. Leaderboard is still displayed on teacher's screen since it will be mirrored to the class
| F: Once teacher is done mirroring, they can click a button to display class data
| F: frontend displays class data in a horizontal bar graph (similar to the one used at https://waf.cs.illinois.edu/discovery/grade_disparity_between_sections_at_uiuc/#findCourse)

Data to be stored: 

- Player data: Total right, total wrong, average time spent on questions, percent correct, name, game id

- Game data: Game id, class average percent correct, class average time spent on questions, standard deviation for both

This will effectively give the teacher a way to see how well the class is doing as a whole and how well each student is doing individually in an intuitive way.

### School Admin Website for License Management

In progress but put on back burner for now since analytics are more useful (and interesting for me to implement)

### UI Overhaul