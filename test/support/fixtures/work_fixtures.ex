defmodule Kadeilliancom.WorkFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Kadeilliancom.Work` context.
  """

  @doc """
  Generate a blog.
  """
  def blog_fixture(attrs \\ %{}) do
    {:ok, blog} =
      attrs
      |> Enum.into(%{
        author: "some author",
        body: "some body",
        image_url: "some image_url",
        title: "some title"
      })
      |> Kadeilliancom.Work.create_blog()

    blog
  end
end
