defmodule EfaApplication do
  use Application

  def start(_type, _args) do
    EfaSupervisor.start_link(name: EfaSupervisor)
  end

end
