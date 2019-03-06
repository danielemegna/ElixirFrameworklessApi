defmodule EfaSupervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    Supervisor.init([efa_api()], strategy: :rest_for_one)
  end

  defp efa_api() do
		options = [
			server_name: 'Efa', 
			server_root: '/tmp',
			document_root: '/tmp', 
			port: 3000, 
			modules: [Efa]
		]
		args = [:httpd, options]
		worker(:inets, args, function: :start)
  end

end
