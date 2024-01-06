rock_scissors_paper <- c("rock","scissors","paper" )
player_score <- 0
draw_score <- 0
com_score <- 0
rock_scissors_paper_game <- function(){
  print("Welcome to our Pao-Ying-Chub game. Let's have some fun together. If you want to quit, you can type 'q'. Please select rock, scissors, or paper.")
  while(TRUE) {
    player <- readLines("stdin", n=1)
    com <- sample(rock_scissors_paper, 1)
    if (player == "q") {
      print(paste("player_score:", player_score))
      print(paste("draw_score:", draw_score))
      print(paste("com_score:", com_score))
      print("Thank you for playing with me. See you again!")
      break
    } else if (com == "rock" & player == "scissors") {
      print("I choose rock. You lose!") 
      com_score <- com_score + 1
    } else if (com == "rock" & player == "paper") {
      print("I choose rock. You win!") 
      player_score <- player_score + 1
    } else if (com == "scissors" & player == "rock") {
      print("I choose scissors. You win!") 
      player_score <- player_score + 1
    } else if (com == "scissors" & player == "paper") {
      print("I choose scissors. You lose!") 
      com_score <- com_score + 1
    } else if (com == "paper" & player == "rock") {
      print("I choose paper. You lose!") 
      com_score <- com_score + 1
    } else if (com == "paper" & player == "scissors") {
      print("I choose paper. You win!") 
      player_score <- player_score + 1
    } else if (com =="rock" & player == "rock") {
      print("I choose rock. Draw!") 
      draw_score <- draw_score + 1 
    } else if (com == "scissors" & player == "scissors") {
      print("I choose scissors. Draw!") 
      draw_score <- draw_score + 1 
    } else if (com == "paper" & player == "paper") {
      print("I choose paper. Draw!") 
      draw_score <- draw_score + 1 
    }
  }
}
rock_scissors_paper_game()
