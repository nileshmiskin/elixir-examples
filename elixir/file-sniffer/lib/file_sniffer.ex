defmodule FileSniffer do
  @extention_to_media_type %{
    "exe" => "application/octet-stream",
    "bmp" => "image/bmp",
    "png" => "image/png",
    "jpg" => "image/jpg",
    "gif" => "image/gif"
  }

  def type_from_extension(extension), do: @extention_to_media_type[extension]

  def type_from_binary(<<0x7F, 0x45, 0x4C, 0x46, _body::binary>>), do: "application/octet-stream"
  def type_from_binary(<<0x42, 0x4D, _body::binary>>), do: "image/bmp"

  def type_from_binary(<<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _body::binary>>),
    do: "image/png"

  def type_from_binary(<<0xFF, 0xD8, 0xFF, _body::binary>>), do: "image/jpg"
  def type_from_binary(<<0x47, 0x49, 0x46, _body::binary>>), do: "image/gif"
  def type_from_binary(_file_binary), do: nil

  def verify(file_binary, extension) do
    type = type_from_binary(file_binary)

    if type != nil and type_from_extension(extension) == type do
      {:ok, type}
    else
      {:error, "Warning, file format and file extension do not match."}
    end
  end
end
