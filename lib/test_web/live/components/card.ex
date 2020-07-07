defmodule Card do
  use TestWeb, :live_component

  def render(assigns) do
    ~L"""
      <div phx-click="change-assign" phx-target="<%= @myself %>">
        <p>Hello world <%= @value %></p>
      </div>
    """
  end

  def handle_event("change-assign", _, socket) do
    socket = assign(socket, value: !socket.assigns.value)
    send self(), :catch_event
    {:noreply, socket}
  end
  def update(assigns, socket) do
    {:ok, assign(socket, id: assigns.id, value: true)}
  end
end