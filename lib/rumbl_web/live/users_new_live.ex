defmodule RumblWeb.UsersNewLive do
  alias Rumbl.Accounts.User
  alias Rumbl.Accounts
  use RumblWeb, :live_view

  def mount(_params, _session, socket) do
    changeset = Accounts.change_registration(%User{}, %{})
    form = to_form(changeset, as: "user")

    socket = assign(socket, form: form)

    {:ok, socket}
  end

  def handle_event("create_user", %{"user" => user_params}, socket) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        info = "#{user.name} created!"
        {:noreply, socket |> put_flash(:info, info) |> redirect(to: ~p"/users")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset, as: "user"))}
    end
  end
end
