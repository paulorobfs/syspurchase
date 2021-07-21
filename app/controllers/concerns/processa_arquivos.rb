module ProcessaArquivos

  require 'csv'

  def self.processa(caminho_arquivo)
    file = File.open( caminho_arquivo )
    CSV.foreach( file, { headers: get_header(file), :col_sep => "\t" } ) do |linha|
      next if linha.empty? or linha[:purchaser_name].include?'purchaser name'
      puts "name: #{linha[:purchaser_name]} item: #{linha[:item_description]} price: #{linha[:item_price]} count: #{linha[:purchase_count]}"

    end
  end

  def self.get_header(file)
    file.first.gsub(' ','_').gsub("\n",'').split("\t").map(&:to_sym)
  end

end