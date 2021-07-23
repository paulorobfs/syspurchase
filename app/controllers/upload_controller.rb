class UploadController < ApplicationController
  def index
  end

  def processa_arquivo

    file = params[:file]

    if file.blank?
      redirect_to upload_index_path, alert: "Por favor anexar arquivo."
      return
    end

    resume = ProcessaArquivos.processa(file)
    puts resume
    #qtdImportados, qtdErro, qtdTotalItens, valorTotal

    redirect_to upload_index_path, notice: "Resumo: Importados: #{resume.qtdImportados}, Importações com erro: #{resume.qtdErro}, num total de #{resume.qtdTotalItens} itens. Valor total de compras: #{resume.valorTotal}"
  end
end
