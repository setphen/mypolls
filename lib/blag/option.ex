defmodule Blag.Option do
  use Ecto.Schema
  import Ecto.Changeset


  schema "options" do
    field :text, :string
    has_many :votes, Blag.Vote
    belongs_to :poll, Blag.Poll
    timestamps()
  end

end