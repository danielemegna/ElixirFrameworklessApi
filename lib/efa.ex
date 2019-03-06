defmodule Efa do
  require Record

  Record.defrecord :httpd, Record.extract(:mod, from_lib: "inets/include/httpd.hrl")

  def unquote(:do)(data) do
    IO.puts '=============================='
    IO.inspect(httpd(data, :request_uri))
    IO.inspect(data)
    IO.puts '=============================='

    {:proceed, [response: {200, 'I am healthy'}]}
  end

end
