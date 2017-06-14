defmodule StateMachine.Application do
  use Application

  def start(_,_) do
    StateMachine.Supervisor.start_link
  end
end
