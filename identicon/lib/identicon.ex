defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_odd_squares
    |> build_pixel_map
    |> draw_image
    |> save_image(input)
  end

  def save_image(image, input) do
    File.write("#{input}.png", image)
  end

  def draw_image(image) do
    avatar = :egd.create(250, 250)
    fill = :egd.color(image.color)

    Enum.each image.pixel_map, fn({start, stop}) ->
      :egd.filledRectangle(avatar, start, stop, fill)
    end

    :egd.render(avatar)
  end

  def build_pixel_map(image) do
    pixel_map = Enum.map image.grid, fn({_code, index}) ->
      horizontal = rem(index, 5) * 50
      vertical = div(index, 5) * 50

      top_left = { horizontal, vertical }
      bottom_right = { horizontal + 50, vertical + 50 }

      { top_left, bottom_right }
    end

    %Identicon.Image{image | pixel_map: pixel_map}
  end

  def filter_odd_squares(image) do
    grid = Enum.filter image.grid, fn({code, _index}) ->
      rem(code, 2) == 0
    end

     %Identicon.Image{image | grid: grid}
  end

  def build_grid(image) do
    grid =
      image.hex
      |> Enum.chunk(3)
      |> Enum.map(&mirror_row/1)
      |> List.flatten
      |> Enum.with_index

    %Identicon.Image{image | grid: grid}
  end

  def mirror_row(row) do
    [first, second | _tail ] = row
    row ++ [second, first]
  end

  def pick_color(image) do
    [red, green, blue | _tail ] = image.hex
    %Identicon.Image{image | color: { red, green, blue}}
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
