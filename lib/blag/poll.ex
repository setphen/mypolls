defmodule Blag.Poll do
  use Ecto.Schema
  import Ecto.Changeset


  schema "polls" do
    field :prompt, :string
    has_many :options, Blag.Option
    timestamps()
  end

end
