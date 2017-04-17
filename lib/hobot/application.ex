defmodule Hobot.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: Hobot.Worker.start_link(arg1, arg2, arg3)
      # worker(Hobot.Worker, [arg1, arg2, arg3]),
      supervisor(Registry, [:duplicate, Hobot.Broker, [partitions: System.schedulers_online()]], [id: :broker]),
      supervisor(Registry, [:unique, Hobot.Filter, [partitions: System.schedulers_online()]], [id: :filter]),
      supervisor(Task.Supervisor, [[name: Hobot.TaskSupervisor]])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hobot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
