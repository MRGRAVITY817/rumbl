defmodule RumblWeb.UsersNewLive do
  alias Rumbl.Accounts.User
  alias Rumbl.Accounts
  use RumblWeb, :live_view

  def mount(_params, _session, socket) do
    changeset = Accounts.change_user(%User{})
    form = to_form(changeset, as: "user")

    socket = assign(socket, form: form)

    {:ok, socket}
  end
end
