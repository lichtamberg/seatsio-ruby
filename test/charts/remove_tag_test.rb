require "test_helper"
require "util"

class RemoveTagTest < SeatsioTestClient
  def test_remove_tag
    chart = @seatsio.charts.create
    @seatsio.charts.add_tag(chart.key, "tag1")
    @seatsio.charts.add_tag(chart.key, "tag2")

    @seatsio.charts.remove_tag(chart.key, "tag2")

    retrieved_chart = @seatsio.charts.retrieve(chart.key)

    assert_equal(['tag1'], retrieved_chart.tags)
  end
end
