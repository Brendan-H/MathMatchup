# This script is made to make testing the frontend easier. Since Postman doesn't support repetitive requests (like adding 30 players)
# on their free plan and you cant string multiple requests together, this automates all of that stuff in order to simulate a classroom
# environment with 30 other students while youre testing the frontend.
import random

import requests
import time


BASE_URL = "http://localhost:8080"

def create_game():
    game_data = {
        "difficulty": "easy",
        "gameType": "addition",
        "timer": 30
    }
    response = requests.post(f"{BASE_URL}/games", json=game_data)
    if response.status_code == 200:
        gamecode = response.json()["gameCode"]
        print(f"SUCCESS: Game created with code: {gamecode}")
        return gamecode
    else:
        print("ERROR: Failed to create game:", response.text)
        exit(1)

def add_test_players(gamecode):
    player_ids = []
    for i in range(30):  # simulates class size (+ 1 extra since this script is meant to be used for testing the frontend)
        # so it also tests the odd number team creation
        player_data = {
            "name": f"TestPlayer{i+1}"
        }
        response = requests.post(f"{BASE_URL}/players/create", json=player_data, params={"gameCode": gamecode})
        if response.status_code == 200:
            player_id = response.json()["player"]["id"]
            print(f"SUCCESS: Added player: TestPlayer{i+1} (ID: {player_id})")
            player_ids.append(player_id)
        else:
            print(f"ERROR: Failed to add TestPlayer{i+1}: {response.text}")
            exit(1)
    return player_ids

#Since this is a script to make testing the frontend easier, we wait for the tester to join the game on the flutter app
#and make the gamecode easily accessible
def wait_for_tester_to_join(gamecode, max_wait=30):
    print(f"Waiting for you to join game with gamecode {gamecode}. Press any key and enter to continue the script")
    for i in range(max_wait):
        time.sleep(1)
        if input() != "":
            return

def start_game(gamecode):
    response = requests.post(f"{BASE_URL}/games/start", params={"gameCode": gamecode})
    if response.status_code == 200:
        print(f"SUCCESS: Game with gamecode {gamecode} Started")
    else:
        print(f"ERROR: Failed to start game: {response.status_code}", response.text)

def submit_fake_player_points(player_ids, gamecode):
    time.sleep(5)
    for playerid in player_ids:
        points = random.randint(0,500)
        correct = random.randint(1,15)
        incorrect = random.randint(1,15)
        total = correct + incorrect
        averagetime = random.uniform(0.2,6.0)
        accuracy = (correct / total) * 100
        points_and_analytics = {
            "points": points,
            "correctAnswers": correct,
            "incorrectAnswers": incorrect,
            "totalQuestions": total,
            "averageTime": averagetime,
            "accuracy": accuracy
        }
        response = requests.post(f"{BASE_URL}/players/submit-points",
                                 json=points_and_analytics,
                                 params={"gameCode" : gamecode, "playerID" : playerid})
        if response.status_code == 200:
            print(f"SUCCESS: Points and analytics submitted successfully for player {playerid} to game {gamecode}")
        else:
            print("ERROR: Failed to submit points:", response.text)

def finish_game(gamecode):
    print(f"Waiting for you to finish game with gamecode {gamecode}. Press any key and enter to continue the script")
    for i in range(20):
        time.sleep(1)
        if input() != "":
            break
    response = requests.post(f"{BASE_URL}/games/finish", params={"gameCode" : gamecode})
    if response.status_code == 200:
        print(f"SUCCESS: Game with game code: {gamecode} finished successfully.")
    else:
        print("ERROR: Failed to finish game:", response.text)


if __name__ == "__main__":
    gamecode = create_game()
    player_ids = add_test_players(gamecode)
    wait_for_tester_to_join(gamecode)
    start_game(gamecode)
    submit_fake_player_points(player_ids, gamecode)
    finish_game(gamecode)