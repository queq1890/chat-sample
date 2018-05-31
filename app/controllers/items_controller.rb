class ItemsController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'

  before_action :jsonson, only: :show

  def index
    uri = URI.parse('https://api.openbd.jp/v1/get?isbn=978-4-7808-0204-7')
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)

    result = result.to_a

    @item = Item.new
    @item.isbn = result[0]["onix"]["RecordReference"]
  end

  def show
    @item = Item.new
    @item.name = @result[0]["onix"]["DescriptiveDetail"]["TitleDetail"]["TitleElement"]["TitleText"]["content"]
  end

  private

  def jsonson
    uri = URI.parse('https://api.openbd.jp/v1/get?isbn=' + params[:id].to_s)
    @uri = uri
    json = Net::HTTP.get(uri)
    @result = JSON.parse(json)

    @result = @result.to_a
  end
end
