defmodule Rumbl.Accounts do
  @moduledoc """
  The Accounts context
  """
  alias Rumbl.Accounts.User

  def list_users do
    [
      %User{id: "1", name: "Hoon", username: "hoonweedev"},
      %User{id: "2", name: "Eunbee", username: "fiona917"},
      %User{id: "3", name: "Jay", username: "jaywee626"}
    ]
  end

  def get_user(id) do
    list_users()
    |> Enum.find(&(&1.id == id))
  end

  def get_user_by(params) do
    Enum.find(list_users(), fn map ->
      Enum.all?(params, fn {key, val} ->
        Map.get(map, key) == val
      end)
    end)
  end
end
