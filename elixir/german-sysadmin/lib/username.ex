defmodule Username do
  def sanitize(''), do: ''

  def sanitize([head | tail]) do
    sanitized =
      case head do
        ?ß -> 'ss'
        ?ä -> 'ae'
        ?ö -> 'oe'
        ?ü -> 'ue'
        letter when letter >= ?a and letter <= ?z -> [letter]
        ?_ -> '_'
        _ -> ''
      end

    sanitized ++ sanitize(tail)
  end
end
