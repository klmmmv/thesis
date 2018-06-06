defmodule MyProcess do
  def loop() do
    receive do
      :hello ->
        IO.puts "Hello world"
        loop()
      after 30000 ->
        IO.puts "Please send something"
        loop()
    end
  end
end
