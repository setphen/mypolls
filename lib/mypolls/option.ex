defmodule MyPolls.Option do
  use Ecto.Schema
  import Ecto.Changeset


  schema "options" do
    field :text, :string
    has_many :votes, MyPolls.Vote
    belongs_to :poll, MyPolls.Poll
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:text])
  end

end
