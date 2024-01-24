defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    []
    |> do_commands(0b00001 == Bitwise.band(code, 0b00001), "wink")
    |> do_commands(0b00010 == Bitwise.band(code, 0b00010), "double blink")
    |> do_commands(0b00100 == Bitwise.band(code, 0b00100), "close your eyes")
    |> do_commands(0b01000 == Bitwise.band(code, 0b01000), "jump")
    |> do_commands(0b10000 == Bitwise.band(code, 0b10000), &Enum.reverse/1)
    |> Enum.reverse()
  end

  defp do_commands(acc, do?, action)
  defp do_commands(acc, false, _), do: acc
  defp do_commands(acc, true, action) when is_binary(action), do: [action | acc]
  defp do_commands(acc, true, fun), do: fun.(acc)
end
