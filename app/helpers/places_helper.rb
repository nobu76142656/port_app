module PlacesHelper
  def random_send
    rand = rand(124250)
  end

  # def test_read()
  #   pattern = Regexp.new("二銭銅貨")
  #   filename = "app/helpers/nisendouka.txt"
  #   count = 0
  #   File.open(filename) do |file|
  #     file.each_line do |line|
  #       if pattern =~ line
  #         line.scan(pattern) do |s|
  #           count += 1
  #         end
  #         # print line
  #       end
  #     end
  #   end
  # end
end
