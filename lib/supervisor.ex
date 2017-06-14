defmodule StateMachine.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, nil, name: :statemachine_supervisor)
  end

  def init(_) do
    processes = [
      worker(StateMachine.Receiver, []),
      worker(StateMachine.Sender, [])
    ]
    supervise(processes, strategy: :one_for_one)
  end
end
