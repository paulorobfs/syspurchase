module ProcessaArquivos

  require 'csv'

  def self.processa(caminho_arquivo)
    begin
      @file = File.open(caminho_arquivo,'r')
    rescue => exception
      raise "Failed to load file#{exception}"
    end
    @total_importacoes = 0
    @importadas = 0
    @falhas = 0
    @valorTotal = 0
    CSV.foreach(
        @file,
        {
            headers: get_header(@file),
            col_sep: "\t"
        }) do |row| #Start loop
      next if row.empty?
      if row[:purchaser_name].blank? or row[:item_description].blank?
        puts "Arquivo no formato invalido"
        break
      end
      next if row[:purchaser_name].include?'purchaser name'
        @total_importacoes += 1
        Purchase.transaction do
          begin
            merchant = Merchant.find_or_create_by!(name: row[:merchant_name], address: row[:merchant_address])
            iten = Iten.find_or_create_by!(merchant_id: merchant.id, description: row[:item_description], price: row[:item_price])
            user = User.new(admin: false, name: row[:purchaser_name], email: create_temp_email(row[:purchaser_name]))
            user.save(validate: false)
            count_p = row[:purchase_count].blank? ? 1 : row[:purchase_count].to_i
            purchase = Purchase.create!(user_id: user.id, iten_id: iten.id, price: iten.price * count_p, count: count_p)
            @valorTotal = @valorTotal + purchase.price
            @importadas += 1
          rescue ActiveRecord::Rollback
            @falhas += 1
            next
          end
        end
    end #End Loop

    ResumeImport.new(@importadas, @falhas, @total_importacoes, @valorTotal)

  end

  def self.get_header(file)
    file.first.gsub(' ','_').gsub("\n",'').split("\t").map(&:to_sym)
  end

  def self.create_temp_email(name)
    "#{name.parameterize}_#{DateTime.current.strftime('%Y%m%d_%H%M%S%N')}@mailtest.com"
  end

end