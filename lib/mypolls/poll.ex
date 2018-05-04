defmodule MyPolls.Poll do
  use Ecto.Schema
  import Ecto.Changeset


  schema "polls" do
    field :prompt, :string
    has_many :options, MyPolls.Option, on_delete: :delete_all
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:prompt])
    |> cast_assoc(:options, required: true)
  end

end
