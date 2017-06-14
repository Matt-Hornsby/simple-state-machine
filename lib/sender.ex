defmodule StateMachine.Sender do
  use GenServer

  def start_link do
    IO.puts "Starting sender"
    GenServer.start_link(__MODULE__, :ok, name: :sender)
  end

  def send(message) do
    GenServer.call(:sender, {:send, message})
  end

  def init(:ok) do
    {:ok, :waiting_to_connect}
  end

  def handle_call({:send, message}, from, :waiting_to_connect) do
    IO.puts("Request to send a packet received from application layer")
    IO.puts("Sending a packet: #{message} from pid #{inspect from}")
    StateMachine.Receiver.receive(message)
    IO.puts("Current sender state is now WAITING TO CONNECT")
    {:reply, :ok, :waiting_to_connect}
  end

end
