 def read_notes() do
    case File.read("note.txt") do
    {:ok, content} ->  IO.puts("Your notes:\n#{content}")
    {:error, reason} -> IO.puts("Error reading file: #{reason}")
    end
    end

    Notes.read_notes()