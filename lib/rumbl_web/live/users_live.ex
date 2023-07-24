defmodule RumblWeb.UsersLive do
  alias Rumbl.Accounts
  use RumblWeb, :live_view

  def mount(_params, _session, socket) do
    users = Accounts.list_users()

    socket =
      assign(socket, users: users)

    # should return this tuple
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
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
    """
  end

  defp first_name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
