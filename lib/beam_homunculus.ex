defmodule BeamHomunculus do
  @moduledoc """
  A bot framework for ErlangVM(beam)
  """

  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: BeamHomunculus.Worker.start_link(arg1, arg2, arg3)
      # worker(BeamHomunculus.Worker, [arg1, arg2, arg3]),
      supervisor(BeamHomunculus.BotSupervisor, [], restart: :transient)
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :simple_one_for_one, name: BeamHomunculus.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
