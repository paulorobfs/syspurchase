class UploadController < ApplicationController
  def index
  end

  def processa_arquivo

    CSV.open("name", "r", { :col_sep => "\t" }).each do |row|
      puts row
    end

  end
end
