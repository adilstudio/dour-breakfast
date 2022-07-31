class PagesController < ApplicationController

  def home
  end

  def test
    @result = `python test_teh_phase4.py`
    @result = @result.gsub('}', '}|')
    @arrayres = @result.split '|'

    plines = @arrayres[0].gsub(']]', ']]]').gsub('{', '').gsub('}', '').gsub(':', ',').gsub('[[', '[').split ']], '
    cpt = 0
    plines_array=[]
    plines.each do |f|
      f = f.gsub('[', '').gsub(']', '').gsub("'", '')
      #add to the array
      plines_array[cpt] = f.split ', '
      cpt = cpt + 1
    end


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

    villes = ["Lille", "Paris", "Rennes", "Bordeaux", "Grenoble", "Lyon", "Marseilles", "Nice"]

    Joueur.delete_all
    Equipe.delete_all

    for a in 1..8 do
      Equipe.new(id: "#{a}", nom: "Equipe_#{+a.to_s}", ville: "#{villes[a-1]}").save
    end

    cptp = 0
    cpte = 1
    plines_array.each do |c|
      cpt = 0
      c.each do |d|
        if cpt != 0
          if cpt.modulo(2) != 0
            cptp = cptp + 1
            #puts "Joueur.new(id: #{cptp}, nom: #{d}, poste: #{c[cpt+1]}, equipes_id: #{cpte}).save"
            Joueur.new(id: cptp, nom: d, poste: c[cpt+1], equipes_id: cpte).save
          end
        end
        cpt = cpt + 1
      end
      cpte = cpte + 1
    end

  end


end
