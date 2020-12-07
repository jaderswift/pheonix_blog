defmodule Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :content, :string
    field :name, :string
    belongs_to :post, Blog.Post, foreign_key: :post_id

    timestamps()
  end

  @required_fields ~w(name content post_id)
  @optional_fields ~w()

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:name, :content])
    |> validate_required([:name, :content])
  end
end
