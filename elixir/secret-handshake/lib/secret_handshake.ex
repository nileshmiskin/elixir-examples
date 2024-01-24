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
    binary =
      Integer.to_string(code, 2)
      |> String.pad_leading(5, "0")
      |> String.reverse()
      |> String.to_charlist()

    actions = ["wink", "double blink", "close your eyes", "jump", :reverse]

    Enum.zip(binary, actions)
    |> Enum.reduce([], fn {bin, act}, acc -> get_actions(bin, act, acc) end)
    |> Enum.reverse()
  end

  defp get_actions(bin, act, acc) do
    cond do
      bin == ?0 ->
        acc

      bin == ?1 ->
        if act == :reverse do
          Enum.reverse(acc)
        else
          [act | acc]
        end
    end
  end
end
