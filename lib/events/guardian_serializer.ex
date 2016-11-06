defmodule Events.GuardianSerializer do
  @behaviour Guardian.Serializer

  def for_token("admin"), do: { :ok, "admin" }
  def for_token(_), do: { :error, "Unknown resource type" }

  def from_token("admin"), do: { :ok, "admin"}
  def from_token(_), do: { :error, "Unknown resource type" }
end
