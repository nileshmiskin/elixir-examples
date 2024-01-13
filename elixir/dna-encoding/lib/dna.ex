defmodule DNA do
  @nucletide_to_code %{
    ?\s => 0b0000,
    ?A => 0b0001,
    ?C => 0b0010,
    ?G => 0b0100,
    ?T => 0b1000
  }
  @code_to_nucletide %{
    0b0000 => ?\s,
    0b0001 => ?A,
    0b0010 => ?C,
    0b0100 => ?G,
    0b1000 => ?T
  }
  def encode_nucleotide(code_point), do: @nucletide_to_code[code_point]

  def decode_nucleotide(encoded_code), do: @code_to_nucletide[encoded_code]

  def encode(dna), do: do_encode(dna, <<>>)
  defp do_encode([], acc), do: acc

  defp do_encode([head | tail], acc) do
    codepoint = encode_nucleotide(head)
    do_encode(tail, <<acc::bitstring, codepoint::4>>)
  end

  def decode(dna), do: do_decode(dna, [])
  defp do_decode(<<>>, acc), do: acc

  defp do_decode(<<head::4, tail::bitstring>>, acc) do
    do_decode(tail, acc ++ [decode_nucleotide(head)])
  end
end
