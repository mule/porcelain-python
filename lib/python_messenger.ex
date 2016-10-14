defmodule PythonMessenger do
  alias Porcelain.Process, as: Proc
  alias Porcelain.Result

  def test_messages do
    proc = %Proc{pid: pid} =
      Porcelain.spawn_shell("python ./python_sripts/reply_to_elixir.py",
        in: :receive, out: {:send, self()})
    
  receive do
    {^pid, :data, :out, data} -> IO.inspect data 
  end

  receive do
    {^pid, :result, %Result{status: status}} -> IO.inspect status
  end
  end

end
