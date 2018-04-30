defmodule Blag.Repo.Migrations.CreatePollsAndRelations do
  use Ecto.Migration

  def change do
    create table(:polls) do
      add :prompt, :string
      timestamps
    end

    create table(:options) do
      add :poll_id, references(:polls)
      add :text, :string
      timestamps
    end

    create table(:votes) do
      add :option_id, references(:options)
      #add a user id
      timestamps
    end

  end
end
