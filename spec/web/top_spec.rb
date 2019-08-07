require_relative 'spec_helper'

describe '/' do
  it "should show title" do
    visit('/')
    page.find('h1').text.must_equal 'Todo'
  end

  it "can add todo" do
    visit('/')
    save_screenshot('/tmp/screenshot.png', full: true)
    page.fill_in('todo_content', with: '新しいTODO')
    page.fill_in('todo_deadline', with: Time.new(2019, 8, 1, 12))
    page.click_on('作成')

    page.find('.alert-success').text.must_equal 'Todoを作成しました'
    page.text.must_match '新しいTODO'
    page.text.must_match '2019-08-01 12:00'
  end
end
