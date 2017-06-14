# StateMachine

iex> StateMachine.Sender.send(123)  
Request to send a packet received from application layer  
Sending a packet: 123 from pid {#PID<0.111.0>, #Reference<0.0.6.767>}  
Received a packet 123 from pid {#PID<0.110.0>, #Reference<0.0.6.775>}  
Current receiver state is now WAITING FOR CONNECTION  
Current sender state is now WAITING TO CONNECT  

:ok
