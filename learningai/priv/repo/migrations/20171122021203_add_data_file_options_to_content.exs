defmodule Learningai.Repo.Migrations.AddDataFileOptionsToContent do
  use Ecto.Migration

  def change do
    alter table(:contents) do
        add :use_existing_file, :boolean, default: true
    end

  end
end
