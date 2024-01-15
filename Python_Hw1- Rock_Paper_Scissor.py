import random
rock_scissors_paper = ['rock','scissors','paper']
def rock_scissors_paper_game():
  player_score = 0
  draw_score = 0
  com_score = 0  
  print("Welcome to our Pao-Ying-Chub game. Let's have some fun together. If you want to quit, you can type 'q'.")
  while True:
    player = input("Choose your choice. Please select rock, scissors, or paper.")
    if player == "q":
      ## print final score
      print(f"player_score: {player_score}")
      print(f"draw_score: {draw_score}")
      print(f"com_score: {com_score}")
      print('Thank you for playing with me. See you again!')
      break
    com = random.choice(rock_scissors_paper)
    if com == 'rock' and player == 'scissors': 
      print("I choose rock. You lose!") 
      com_score = com_score + 1
    elif com == 'rock' and player == 'paper': 
      print("I choose rock. You win!") 
      player_score = player_score + 1
    elif com == 'scissors' and player == 'rock':
      print("I choose scissors. You win!") 
      player_score = player_score + 1
    elif com == 'scissors' and player == 'paper':
      print("I choose scissors. You lose!") 
      com_score = com_score + 1
    elif com == 'paper' and player == 'rock':
      print("I choose paper. You lose!") 
      com_score = com_score + 1
    elif com == 'paper' and player == 'scissors':
      print("I choose paper. You win!") 
      player_score = player_score + 1
    elif com == 'rock' and player == 'rock':
      print("I choose rock. Draw!") 
      draw_score = draw_score + 1 
    elif com == 'scissors' and player == 'scissors':
      print("I choose scissors. Draw!") 
      draw_score = draw_score + 1 
    elif com == 'paper' and player == 'paper':
      print("I choose paper. Draw!") 
      draw_score = draw_score + 1 

rock_scissors_paper_game()
