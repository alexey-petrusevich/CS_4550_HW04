defmodule Practice.Calc do
  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end

  def calc(expr) do
    # This should handle +,-,*,/ with order of operations,
    # but doesn't need to handle parens.
    # TODO: implement evaluation of expression
    expr
    |> String.split(~r/\s+/)
    |> hd
    |> parse_float
    |> :math.sqrt()

    # Hint:
    # expr
    # |> split
    # |> tag_tokens  (e.g. [+, 1] => [{:op, "+"}, {:num, 1.0}]
    # |> convert to postfix
    # |> reverse to prefix
    # |> evaluate as a stack calculator using pattern matching
  end

  # idea for getPrimes() was taken from here:
  # https://www.geeksforgeeks.org/print-all-prime-factors-of-a-given-number/
  def factor(number) do
    getPrimes(number, [])
  end

  def getPrimes(number, factors) do
    if (rem(number, 2) == 0) do
      getPrimes(div(number, 2), [2 | factors])
    else
      doOddPrimes(number, factors, 3)
    end
  end

  def doOddPrimes(number, factors, i) do
    if (i <= :math.sqrt(number)) do
      if (rem(number, i) == 0) do
        doOddPrimes(div(number, i), [i | factors], i)
      else
        doOddPrimes(number, factors, i + 2)
      end
    else
      [number | factors]
    end
  end

  def palindrome(word) do
    if String.reverse(word) == word do
      "is a palindrome!"
    else
      "is not a palindrome!"
    end
  end

end
