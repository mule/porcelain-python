defmodule PorcelainPython do
  use Application
  alias Porcelain.Result

  def start(_, _) do
    %Result{out: output, status: status} = Porcelain.shell("python --version")

    IO.inspect status
    IO.inspect output

    %Result{out: output, status: status} = Porcelain.shell("python ./python_scripts/hello_python.py")
    
    IO.inspect status
    IO.inspect output
    
    {:ok, self()}
    
  end
end
