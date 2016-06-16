#
# The MIT License (MIT)
#
# Copyright (c) 2014-2015 Undead Labs, LLC
#

defmodule Consul.Response do
  @type t :: HTTPoison.Response.t

  @spec consul_index(t) :: integer | nil
  def consul_index(%{headers: headers}) do
    headers
    |> Enum.into(%{})
    |> extract_index
  end

  defp extract_index(%{"X-Consul-Index" => index}), do: index
  defp extract_index(_), do: nil
end
