defmodule LearningaiWeb.ContentController do
  use LearningaiWeb, :controller

  alias Learningai.Instructors
  alias Learningai.Instructors.Content
  alias Learningai.Instructors.Course
  alias Learningai.Repo

  plug LearningaiWeb.Plugs.RequireAuth when action in [:new, :create, :edit, :update, :delete ]
  plug :check_course_owner when action in [:update, :edit, :delete]

  def action(conn, _) do
    %{"course_id" => course_id} = conn.params
    course = Instructors.get_course!(course_id)
    args = [conn, conn.params, course]
    apply(__MODULE__, action_name(conn), args )
  end

  def index(conn, _params, course) do
    contents = Instructors.list_contents(course)
    render(conn, "index.html", contents: contents, course: course)
  end

  def new(conn, _params, course) do
    changeset = 
    %Content{c_id: course.id}
    |> Instructors.change_content
    render(conn, "new.html", changeset: changeset, course: course)
  end

  def create(conn, %{"content" => content_params}, course) do
    content_params =
    content_params
    |> Map.put("c_id", course.id)

    content_params = 
    case content_params["use_existing_file"] do
      "false" ->
        if datafile = content_params["data_file"] do
          #extension = Path.extname(datafile.filename)
          File.cp(datafile.path, "/Users/Ram/Downloads/learningai/#{course.name}-#{content_params["title"]}-user-#{conn.assigns.user.id}-#{datafile.filename}")
          content_params
          |> Map.put("data_file", "#{course.name}-#{content_params["title"]}-user-#{conn.assigns.user.id}-#{datafile.filename}")
          |> Map.put("data_file_name", datafile.filename)
        else
          content_params
        end
      "true" ->
        content_params
    end
    
    case Instructors.create_content(content_params) do
      {:ok, content} ->
        conn
        |> put_flash(:info, "Content created successfully.")
        |> redirect(to: course_content_path(conn, :show, course, content))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, course: course)
    end
  end

  def show(conn, %{"id" => id}, course) do
    content = Instructors.get_content!(course, id)
    render(conn, "show.html", content: content, course: course)
  end

  def edit(conn, %{"id" => id}, course) do
    content = Instructors.get_content!(course, id)
    changeset = Instructors.change_content(content)
    render(conn, "edit.html", content: content, changeset: changeset, course: course)
  end

  def update(conn, %{"id" => id, "content" => content_params}, course) do
    content = Instructors.get_content!(course, id)

    content_params = 
    case content_params["use_existing_file"] do
      "false" ->
        if datafile = content_params["data_file"] do
          #extension = Path.extname(datafile.filename)
          File.cp(datafile.path, "/Users/Ram/Downloads/learningai/#{course.name}-#{content_params["title"]}-user-#{conn.assigns.user.id}-#{datafile.filename}")
          content_params
          |> Map.put("data_file", "#{course.name}-#{content_params["title"]}-user-#{conn.assigns.user.id}-#{datafile.filename}")
          |> Map.put("data_file_name", datafile.filename)
        else
          content_params
        end
      "true" ->
        content_params
    end

    case Instructors.update_content(content, content_params) do
      {:ok, content} ->
        conn
        |> put_flash(:info, "Content updated successfully.")
        |> redirect(to: course_content_path(conn, :show, course, content))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", content: content, changeset: changeset, course: course)
    end
  end

  def delete(conn, %{"id" => id}, course) do
    content = Instructors.get_content!(course, id)
    {:ok, _content} = Instructors.delete_content(content)

    conn
    |> put_flash(:info, "Content deleted successfully.")
    |> redirect(to: course_content_path(conn, :index, course))
  end


  def check_course_owner(conn, _plugparams) do
    #This :params is courtesy "resource" controller helper. It pulls "id" out of the url and attach it to connect   
    # object under params.id property
    %{"course_id" => course_id} = conn.params
    #Fetch the user id for the course id specified in the url and see if it equals the current user id,
    #let connection through, else reject
    if Repo.get(Course, course_id).user_id == conn.assigns.user.id do
      conn
    else
      conn
      |> put_flash(:error, "You cannot modify  that")
      |> redirect(to: course_path(conn, :index))
      |> halt()

    end
  end
end
