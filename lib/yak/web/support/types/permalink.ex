defmodule Yak.Type.Permalink do
  @behaviour Ecto.Type

  def type, do: :id

  def cast(binary) when is_binary(binary) do
    case Regex.run(~r/\-(\w+)$/, binary) do
      [_, hashid] ->
        {:ok, Yak.Hashids.decode!(hashid)}
      _ ->
        :error
    end
  end

  def cast(integer) when is_integer(integer) do
    {:ok, integer}
  end

  def cast(_), do: :error

  def dump(integer) when is_integer(integer) do
    {:ok, integer}
  end

  def load(integer) when is_integer(integer) do
    {:ok, integer}
  end

end
