defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

    iex> RnaTranscription.to_rna(~c"ACTG")
    ~c"UGAC"
  """
  @dna_to_rna %{?A => ?U, ?T => ?A, ?C => ?G, ?G => ?C}
  @spec to_rna([char]) :: [char]
  def to_rna(dna), do: dna |> Enum.map(&@dna_to_rna[&1])
end
