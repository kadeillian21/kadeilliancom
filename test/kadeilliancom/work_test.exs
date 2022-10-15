defmodule Kadeilliancom.WorkTest do
  use Kadeilliancom.DataCase

  alias Kadeilliancom.Work

  describe "blogs" do
    alias Kadeilliancom.Work.Blog

    import Kadeilliancom.WorkFixtures

    @invalid_attrs %{author: nil, body: nil, image_url: nil, title: nil}

    test "list_blogs/0 returns all blogs" do
      blog = blog_fixture()
      assert Work.list_blogs() == [blog]
    end

    test "get_blog!/1 returns the blog with given id" do
      blog = blog_fixture()
      assert Work.get_blog!(blog.id) == blog
    end

    test "create_blog/1 with valid data creates a blog" do
      valid_attrs = %{author: "some author", body: "some body", image_url: "some image_url", title: "some title"}

      assert {:ok, %Blog{} = blog} = Work.create_blog(valid_attrs)
      assert blog.author == "some author"
      assert blog.body == "some body"
      assert blog.image_url == "some image_url"
      assert blog.title == "some title"
    end

    test "create_blog/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Work.create_blog(@invalid_attrs)
    end

    test "update_blog/2 with valid data updates the blog" do
      blog = blog_fixture()
      update_attrs = %{author: "some updated author", body: "some updated body", image_url: "some updated image_url", title: "some updated title"}

      assert {:ok, %Blog{} = blog} = Work.update_blog(blog, update_attrs)
      assert blog.author == "some updated author"
      assert blog.body == "some updated body"
      assert blog.image_url == "some updated image_url"
      assert blog.title == "some updated title"
    end

    test "update_blog/2 with invalid data returns error changeset" do
      blog = blog_fixture()
      assert {:error, %Ecto.Changeset{}} = Work.update_blog(blog, @invalid_attrs)
      assert blog == Work.get_blog!(blog.id)
    end

    test "delete_blog/1 deletes the blog" do
      blog = blog_fixture()
      assert {:ok, %Blog{}} = Work.delete_blog(blog)
      assert_raise Ecto.NoResultsError, fn -> Work.get_blog!(blog.id) end
    end

    test "change_blog/1 returns a blog changeset" do
      blog = blog_fixture()
      assert %Ecto.Changeset{} = Work.change_blog(blog)
    end
  end
end
