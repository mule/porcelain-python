defmodule PythonMessenger do
  alias Porcelain.Process, as: Proc
  alias Porcelain.Result

  def test_messages do
    proc = %Proc{pid: pid} =
      Porcelain.spawn_shell("python -u ./python_scripts/reply_to_elixir.py",
        in: :receive, out: {:send, self()})

    Proc.send_input(proc, "Greetings from Elixir\n")

    data = receive do
      {^pid, :data, :out, data} -> data
    end

    IO.inspect data

    Proc.send_input(proc, "Elixir: I heard you said \"#{data}\"\n")

    data = receive do
      {^pid, :data, :out, data} -> data
    end

    IO.inspect data

    Proc.send_input(proc, "Please quit\n")

    data = receive do
      {^pid, :data, :out, data} -> data
    end

    IO.inspect data
  end
end
