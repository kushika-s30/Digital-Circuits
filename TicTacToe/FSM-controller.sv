// FSM controller to control how player and computer play the TIC TAC TOE GAME 
// The FSM is implemented based on the designed state diagram 
module fsm_controller(
     input clock,// clock of the circuit 
     input reset,// reset 
     play, // player plays 
     pc,// computer plays 
     illegal_move,// illegal move detected 
     no_space, // no_space detected 
     win, // winner detected 
     output reg computer_play, // enable computer to play 
     player_play // enable player to play 
     );
// FSM States 
parameter IDLE=2'b00;
parameter PLAYER=2'b01;
parameter COMPUTER=2'b10;
parameter GAME_DONE=2'b11;
reg[1:0] current_state, next_state;
// current state registers 
always @(posedge clock or posedge reset) 
begin 
 if(reset)
  current_state <= IDLE;
 else 
  current_state <= next_state;
end 
 // next state 
always @(*)
 begin
 case(current_state)
 IDLE: begin 
  if(reset==1'b0 && play == 1'b1)
   next_state <= PLAYER; // player to play 
  else 
   next_state <= IDLE;
  player_play <= 1'b0;
  computer_play <= 1'b0;
 end 
