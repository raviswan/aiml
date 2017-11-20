defmodule Learningai.Repo.Migrations.EditContentDatabaseFields do
  use Ecto.Migration

  def change do
    alter table(:contents) do
        remove :answer_box
        remove :num_choices
    end
  end
end
