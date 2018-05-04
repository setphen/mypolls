defmodule MyPolls.Repo.Migrations.AddPetsFieldToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :number_of_pets, :integer
    end
  end
end
