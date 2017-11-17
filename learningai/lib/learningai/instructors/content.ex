defmodule Learningai.Instructors.Content do
  use Ecto.Schema
  import Ecto.Changeset
  alias Learningai.Instructors.Content


  schema "contents" do
    field :answer, :string
    field :answer_box, :string
    field :data_file, :string
    field :explanation, :string
    field :hint, :string
    field :is_multiple_choice, :boolean, default: false
    field :leadership_points, :integer
    field :num_choices, :integer
    field :objective, :string
    field :question, :string
    field :question_nature, :string
    field :solution_code, :string
    field :c_id, :id
    timestamps()
  end

  @doc false
  def changeset(%Content{} = content, attrs) do
    content
    |> cast(attrs, [:objective, :question, :question_nature, :leadership_points, :is_multiple_choice, :num_choices, :answer_box, :hint, :answer, :explanation, :solution_code, :data_file, :c_id])
    |> validate_required([:objective, :question, :question_nature, :leadership_points, :is_multiple_choice, :num_choices, :answer_box, :hint, :answer, :explanation, :solution_code, :data_file, :c_id])
  end
end
