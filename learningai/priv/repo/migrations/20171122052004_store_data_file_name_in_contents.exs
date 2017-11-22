defmodule Learningai.Repo.Migrations.StoreDataFileNameInContents do
  use Ecto.Migration

  def change do
    alter table(:contents) do
        add :data_file_name, :text, default: nil
    end

  end
end
