defmodule Kadeilliancom.Repo.Migrations.CreateBlogs do
  use Ecto.Migration

  def change do
    create table(:blogs) do
      add :title, :string
      add :author, :string
      add :image_url, :text
      add :body, :text

      timestamps()
    end
  end
end
