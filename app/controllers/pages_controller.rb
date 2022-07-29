class PagesController < ApplicationController

  def home
  end

  def test
    @result = `python test_teh_phase4.py`
    @result = @result.gsub('}', '}|')
    @arrayres = @result.split '|'

    #@players = JSON.parse(@arrayres[0]).with_indifferent_access

    #@players = JSON.parse(@arrayres[0].to_json, object_class: OpenStruct)
    @playerskg = JSON.parse(@arrayres[3].gsub("\n","").gsub(" ", "").gsub('"', '').to_json)
    @playerskg= @playerskg.gsub("{","").gsub("}","")
    @thepkg=@playerskg.split(",")

    @playerskp = JSON.parse(@arrayres[4].gsub("\n","").gsub(" ", "").gsub('"', '').to_json)
    @playerskp= @playerskp.gsub("{","").gsub("}","")
    @thepkp=@playerskp.split(",")

    @playerp = JSON.parse(@arrayres[5].gsub("\n","").gsub(" ", "").gsub('"', '').to_json)
    @playerp= @playerp.gsub("{","").gsub("}","")
    @thep=@playerp.split(",")

    @rank_info = @arrayres[6].gsub('),', '|').gsub('(', '').gsub('[', '').gsub(']', '').gsub(')', '').gsub(' ', '').gsub('/n', '')
    @therank=@rank_info.split("|")

    @prem_info = @arrayres[6].split(')')
    @prem_info = @prem_info[0].gsub('(', '').gsub('[', '').gsub('/n', '')
    @premier = @prem_info.split(',')

  end


end
