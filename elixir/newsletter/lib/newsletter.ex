defmodule Newsletter do
  def read_emails(path) do
    with {:ok, contents} <- File.read(path) do
      String.split(contents)
    end
  end

  def open_log(path), do: File.open!(path, [:write])

  def log_sent_email(pid, email), do: IO.puts(pid, email)

  def close_log(pid), do: File.close(pid)

  defp send_email_and_log(send_fun, email, log_file) do
    with :ok <- send_fun.(email) do
      log_sent_email(log_file, email)
    end
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    with log_file <- open_log(log_path),
         emails <- read_emails(emails_path) do
      emails
      |> Enum.each(&send_email_and_log(send_fun, &1, log_file))

      close_log(log_file)
    end
  end
end
