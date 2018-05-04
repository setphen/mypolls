defmodule Blag.Vote do
  use Ecto.Schema
  import Ecto.Changeset


  schema "votes" do
    belongs_to :option, Blag.Option
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    IO.inspect params
    struct
    |> cast(params, [:option_id])
    |> cast_assoc(:option)
  end

end
