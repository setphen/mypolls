defmodule Blag.Vote do
  use Ecto.Schema
  import Ecto.Changeset


  schema "votes" do
    belongs_to :option, Blag.Option
    timestamps()
  end

end
