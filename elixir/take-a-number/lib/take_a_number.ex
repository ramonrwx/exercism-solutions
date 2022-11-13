defmodule TakeANumber do
  def start() do
    spawn(fn -> machine(0) end)
  end

  def machine(state) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, state)
        machine(state)
      {:take_a_number, sender_pid} ->
        state = state + 1
        send(sender_pid, state)
        machine(state)
      :stop -> nil
      _ -> machine(state)
    end
  end
end
