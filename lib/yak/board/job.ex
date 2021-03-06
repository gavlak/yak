defmodule Yak.Board.Job do
  use Ecto.Schema

  @primary_key {:id, Yak.Type.Permalink, autogenerate: true}
  schema "board_jobs" do
    field :title, :string
    belongs_to :category, Yak.Board.Category

    field :location, :string
    field :description, :string
    field :description_formatted, :string
    field :instructions, :string

    field :company, :string
    field :logo, :string
    field :url, :string
    field :email, :string

    field :highlight, :boolean, default: false

    field :status, Yak.Type.Status, default: :created
    field :note, :string
    field :token, Ecto.UUID, autogenerate: true
    field :views, :integer, default: 0
    has_many :notifications, Yak.Board.Notification

    timestamps()
  end
end

defimpl Phoenix.Param, for: Yak.Board.Job do
  def to_param(%{id: id, title: title}) do
    "#{Yak.Naming.parameterize(title, extended: true)}-#{Yak.Hashids.encode(id)}"
  end
end
