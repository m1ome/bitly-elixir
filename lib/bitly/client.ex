defmodule Bitly.Client do
  @moduledoc false

  use Tesla

  @type t :: Tesla.Client.t()

  @default_base_url "https://api-ssl.bitly.com/v4"

  @spec new(keyword) :: t()
  def new(attrs \\ []) do
    base_url = attrs[:base_url] || @default_base_url
    access_token = attrs[:access_token] || Application.get_env(:bitly, :access_token)

    Tesla.client([
      {Tesla.Middleware.Headers, [{"user-agent", "Bitly-Elixir"}]},
      {Tesla.Middleware.BaseUrl, base_url},
      {Tesla.Middleware.Query, [access_token: access_token]}
    ])
  end
end
