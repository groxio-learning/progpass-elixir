defmodule Mix.Tasks.Count do
  use Mix.Task
  @moduledoc """
  Count the word lengths from the command line aguments. Usage: 
  
  mix count word1 word2 word3
  """
  @shortdoc "Count the word lengths for command line arguments."
  @impl Mix.Task  
  def run([]) do
    Mix.shell().info("Usage:\n mix count list of words")
  end
  def run(words) do
    counts = 
      words
      |> Enum.map(&{&1, String.length(&1)})
      |> Enum.map(fn {word, count} -> 
        "#{word}: #{count} characters"
      end)
    
    message = Enum.join(counts, "\n")
    Mix.shell().info(message)
  end
end