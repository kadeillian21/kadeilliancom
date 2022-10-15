defmodule Kadeilliancom.Work.Blog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blogs" do
    field :author, :string
    field :body, :string
    field :image_url, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:title, :author, :image_url, :body])
    |> validate_required([:title, :author, :image_url, :body])
  end
end
