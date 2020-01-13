pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

def nyc_pigeon_organizer(data)
  data_by_name = {}

  a_of_names = []
  data[:color].each {|key, value| a_of_names << value}
  a_of_names.flatten!.uniq!.sort!

  hash_with_names_as_keys = a_of_names.to_h {|i| [i, {}]}

  pigeon_data_keys = {}
  data.each_key {|key| pigeon_data_keys[key] = []}

  hoh_names_and_traits = {}
  hash_with_names_as_keys.each_key {|key| hoh_names_and_traits[key] = pigeon_data_keys}

  # digs and iterates two levels down

  # pigeon_data_keys.each_key {|i| data[i][data[i].each{|k,l| puts "#{i} #{k} is #{l}"}]}

  # testlist = {}

  def populate_by_name(name, data)
    each_pigeon_hash = {}
    data.each do |i, k|
      # puts data[i]
      data[i].each do |key, value|
        if value.include?(name)
          if !each_pigeon_hash[name]
            each_pigeon_hash[name] = {}
          end
          if !each_pigeon_hash[name][i]
            each_pigeon_hash[name][i] = []
          end
          each_pigeon_hash[name][i] << key.to_s
        end
      end
    end
    each_pigeon_hash
  end
  # pp populate_by_name("Queenie", data)

  greff = a_of_names.map {|name| populate_by_name(name, data)}
  greff.each_with_object({}){|i,a| a}


  # final_hash = hash_with_names_as_keys.each_key do |key|
  #   if pigeon_data_keys.each_key {|i| data[i][data[i].each{|k,l| l.any?(key)}]}
  #     hash_with_names_as_keys[key] = true
  #   else
  #     key[pigeon_data_keys[i]] = false
  #   end
  # # if data.dig(pigeon_data_keys)
  # #   puts key
  # end

  # pp hoh_names_and_traits
  # pp final_hash
  # puts hash_with_names_as_keys
  # pp pigeon_data_keys
  # pp a_of_names
  # pp data_by_name
  # print hash_with_names_as_keys
end

nyc_pigeon_organizer(pigeon_data)
