defmodule Notes do
  def make_note(content) do
    case File.write("note.txt", content) do
      :ok ->
        IO.puts("Note saved!")
      {:error, reason} ->
        IO.puts("Error writing file: #{reason}")
    end
  end

  def read_notes do
    case File.read("note.txt") do
      {:ok, content} -> IO.puts("Your notes:\n#{content}")
      {:error, reason} -> IO.puts("Error reading file: #{reason}")
    end
  end

  def edit_note do
    IO.puts("Enter the new content for your note:")
    new_content = IO.gets("") |> String.trim()

    case File.write("note.txt", new_content) do
      :ok ->
        IO.puts("Note edited successfully!")
      {:error, reason} ->
        IO.puts("Error editing note: #{reason}")
    end
  end

  def delete_note do
    case File.rm("note.txt") do
      :ok ->
        IO.puts("Note deleted successfully!")
      {:error, reason} ->
        IO.puts("Error deleting note: #{reason}")
    end
  end
end

IO.puts("Choose an option:")
IO.puts("1. Make a note")
IO.puts("2. Read notes")
IO.puts("3. Edit a note")
IO.puts("4. Delete a note")

choice = IO.gets("") |> String.trim()

case choice do
  "1" ->
    IO.puts("Enter your note:")
    note_content = IO.gets("") |> String.trim()
    Notes.make_note(note_content)

  "2" -> Notes.read_notes()
  "3" -> Notes.edit_note()
  "4" -> Notes.delete_note()
  _ -> IO.puts("Invalid option")
end
