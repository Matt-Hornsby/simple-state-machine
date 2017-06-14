defmodule StateMachine.Receiver do
  use GenServer

  def start_link do
    IO.puts "Starting receiver"
    GenServer.start_link(__MODULE__, :ok, name: :receiver)
  end

  def receive(message) do
    GenServer.call(:receiver, {:receive, message})
  end

  def init(:ok) do
    {:ok, :waiting_for_connection}
  end

  def handle_call({:receive, message}, from, :waiting_for_connection) do
    IO.puts("Received a packet #{message} from pid #{inspect from}")
    IO.puts("Current receiver state is now WAITING FOR CONNECTION")
    {:reply, :ok, :waiting_for_connection}
  end

end
