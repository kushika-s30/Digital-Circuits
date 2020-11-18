//Main module 
module tic_tac_toe(
     input clock, // clock of the game 
     input reset, // reset button to reset the game 
     input play, // play button to enable player to play 
     input pc, // pc button to enable computer to play 
     input [3:0] computer_position,player_position, // positions to play 
     
     output wire [1:0] pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9, // LED display for positions  
     output wire[1:0]who  // who the winner is (01: Player, 10: Computer)
     );
