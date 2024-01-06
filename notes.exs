defmodule Notes do
  def make_notes(content) do
    case File.write("note.txt", content) do
      :ok ->
        IO.puts("Note saved!")
      {:error, reason} ->
        IO.puts("Error writing file: #{reason}")
    end
  end

  def read_notes() do
    case File.read("note.txt") do
      {:ok, content} ->  IO.puts("Your notes:\n#{content}")
      {:error, reason} -> IO.puts("Error reading file: #{reason}")
    end
  end
end

IO.puts("Choose an option:")
IO.puts("1. Make a note")
IO.puts("2. Read a note")

choice = IO.gets("") |> String.trim()

case choice do
  "1" ->
    IO.puts("Enter your note:")
    note_content = IO.gets("") |> String.trim()
    Notes.make_notes(note_content)

  "2" -> Notes.read_notes()
  _ -> IO.puts("Invalid option")
end
