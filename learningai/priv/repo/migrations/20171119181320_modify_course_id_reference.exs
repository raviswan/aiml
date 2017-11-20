defmodule Learningai.Repo.Migrations.ModifyCourseIdReference do
  use Ecto.Migration

  def up do
    execute "ALTER TABLE contents DROP CONSTRAINT contents_c_id_fkey"

    alter table(:contents) do
      modify :c_id, references(:courses, on_delete: :nothing)
    end
  end

  def down do
    execute "ALTER TABLE contents DROP CONSTRAINT contents_c_id_fkey"

    alter table(:contents) do
      modify :c_id, references(:courses, on_delete: :delete_all)
    end
  end
  def change do

  end
  
end
