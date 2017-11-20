defmodule Learningai.Instructors.Content do
  use Ecto.Schema
  import Ecto.Changeset
  alias Learningai.Instructors.Content


  schema "contents" do
    field :answer, :string
    field :data_file, :string
    field :explanation, :string
    field :hint, :string
    field :is_multiple_choice, :boolean, default: false
    field :leadership_points, :integer
    field :objective, :string
    field :question, :string
    field :question_nature, :string
    field :solution_code, :string
    field :c_id, :id
    field :title, :string
    field :choice1, :string, default: nil
    field :choice2, :string, default: nil
    field :choice3, :string, default: nil
    field :choice4, :string, default: nil
    timestamps()
  end

  @doc false
  def changeset(%Content{} = content, attrs) do
    content
    |> cast(attrs, [:objective, :question, :question_nature, :leadership_points, :is_multiple_choice, :hint, :answer, :explanation, :solution_code, :data_file, :c_id, :title, :choice1, :choice2, :choice3, :choice4])
    |> foreign_key_constraint(:c_id)
    |> validate_required([:objective, :question, :question_nature, :leadership_points, :is_multiple_choice, :hint, :answer, :explanation, :solution_code, :data_file, :c_id, :title])
  end
end
