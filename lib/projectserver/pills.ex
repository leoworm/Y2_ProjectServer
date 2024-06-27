defmodule Projectserver.Pills do
  @moduledoc """
  The Pills context.
  """

  import Ecto.Query, warn: false
  alias Projectserver.Repo

  alias Projectserver.Pills.Pill

  @doc """
  Returns the list of pills.

  ## Examples

      iex> list_pills()
      [%Pill{}, ...]

  """
  def list_pills do
    Repo.all(Pill)
  end

  @doc """
  Gets a single pill.

  Raises `Ecto.NoResultsError` if the Pill does not exist.

  ## Examples

      iex> get_pill!(123)
      %Pill{}

      iex> get_pill!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pill!(id), do: Repo.get!(Pill, id)

  @doc """
  Creates a pill.

  ## Examples

      iex> create_pill(%{field: value})
      {:ok, %Pill{}}

      iex> create_pill(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pill(attrs \\ %{}) do
    %Pill{}
    |> Pill.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pill.

  ## Examples

      iex> update_pill(pill, %{field: new_value})
      {:ok, %Pill{}}

      iex> update_pill(pill, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pill(%Pill{} = pill, attrs) do
    pill
    |> Pill.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pill.

  ## Examples

      iex> delete_pill(pill)
      {:ok, %Pill{}}

      iex> delete_pill(pill)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pill(%Pill{} = pill) do
    Repo.delete(pill)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pill changes.

  ## Examples

      iex> change_pill(pill)
      %Ecto.Changeset{data: %Pill{}}

  """
  def change_pill(%Pill{} = pill, attrs \\ %{}) do
    Pill.changeset(pill, attrs)
  end
end
