require 'test_helper'
require 'util'

class ListAllTagsTest < SeatsioTestClient
  def test_list_all_tags
    chart1 = @seatsio.charts.create
    @seatsio.charts.add_tag(chart1.key, 'tag1')
    @seatsio.charts.add_tag(chart1.key, 'tag2')

    chart2 = @seatsio.charts.create
    @seatsio.charts.add_tag(chart2.key, 'tag3')

    tags = @seatsio.charts.list_all_tags

    assert_includes(tags, 'tag1')
    assert_includes(tags, 'tag2')
    assert_includes(tags, 'tag3')
  end
end
