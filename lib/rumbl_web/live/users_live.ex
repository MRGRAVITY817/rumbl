defmodule RumblWeb.UsersLive do
  alias Rumbl.Accounts
  use RumblWeb, :live_view

  def mount(_params, _session, socket) do
    users = Accounts.list_users()

    socket =
      assign(socket, users: users, selected_user: nil)

    # should return this tuple
    {:ok, socket}
  end

  # handle /users/:id
  def handle_params(%{"id" => id}, _uri, socket) do
    user = Accounts.get_user(id)

    {:noreply, assign(socket, selected_user: user)}
  end

  # handle /users
  def handle_params(_params, _uri, socket) do
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <%= if @selected_user do %>
      <.user user={@selected_user} socket={@socket} />
    <% else %>
      <h1 class="text-xl mb-4">Listing users</h1>
      <table>
        <%= for user <- @users do %>
          <tr>
            <td>
              <.link href={~p"/users/#{user.id}"}>
                <b><%= first_name(user) %></b> (<%= user.id %>)
              </.link>
            </td>
          </tr>
        <% end %>
      </table>
    <% end %>
    """
  end

  attr :user, :map, required: true
  attr :socket, :map, required: true

  def user(assigns) do
    ~H"""
    <h1 class="text-xl mb-4">Showing User</h1>
    <p>
      <b><%= first_name(@user) %></b> (<%= @user.id %>)
    </p>
    """
  end

  defp first_name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
