defmodule Username do
  def sanitize([]), do: []

  def sanitize([head | tail]) do
    cleaned =
      case head do
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        ?ß -> ~c"ss"
        ?_ -> ~c"_"
        x when x >= ?a and x <= ?z -> [x]
        _ -> ~c""
      end

    cleaned ++ sanitize(tail)
  end
end
