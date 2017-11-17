defmodule Learningai.Repo.Migrations.CreateContents do
  use Ecto.Migration

  def change do
    create table(:contents) do
      add :objective, :text
      add :question, :text
      add :question_nature, :string
      add :leadership_points, :integer
      add :is_multiple_choice, :boolean, default: false, null: false
      add :num_choices, :integer
      add :answer_box, :text
      add :hint, :text
      add :answer, :string
      add :explanation, :text
      add :solution_code, :text
      add :data_file, :string
      add :c_id, references(:courses, on_delete: :nothing)

      timestamps()
    end

    create index(:contents, [:c_id])
  end
end
