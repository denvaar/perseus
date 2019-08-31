defmodule Perseus.Article do

  defmodule Article do
    @enforce_keys [:id, :title, :content,
      :date_published, :slug]
    defstruct @enforce_keys
  end

  @typedoc """
  Map representing an article from the database
  """
  @type saved_article :: %Article{
    id: pos_integer(),
    title: String.t,
    content: String.t,
    date_published: String.t | nil,
    slug: String.t
  }

  @typedoc """
  Map of fields for an article
  """
  @type article_params :: %{required(:title) => String.t,
                            required(:content) => String.t,
                            optional(:slug) => slug}

  @typedoc """
  Error messages that may happen when working with an article
  """
  @type errors :: {:error, map()}

  @typedoc """
  A URL friendly string
  """
  @type slug :: String.t

  @callback create_article(article_params) ::
    {:ok, %{slug: slug}}
    | errors

  @callback update_article(slug, article_params) ::
    {:ok, %{slug: slug}}
    | errors
    | :not_found

  @callback get_article(slug) :: saved_article | nil

  @callback list_articles() :: list(saved_article)

  @callback delete_article(slug) :: :ok | :not_found
  @callback delete_article(pos_integer()) :: :ok | :not_found
end
