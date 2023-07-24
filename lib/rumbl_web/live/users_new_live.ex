defmodule RumblWeb.UsersNewLive do
  alias Rumbl.Accounts.User
  alias Rumbl.Accounts
  use RumblWeb, :live_view

  def mount(_params, _session, socket) do
    changeset = Accounts.change_user(%User{})

    socket = assign(socket, changeset: changeset)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""

    """
  end
end
