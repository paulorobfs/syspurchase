class ResumeImport

  attr_reader :qtdImportados, :qtdErro, :qtdTotalItens, :valorTotal

  def initialize(qtdImportados, qtdErro, qtdTotalItens, valorTotal)
    @qtdImportados = qtdImportados
    @qtdErro = qtdErro
    @qtdTotalItens = qtdTotalItens
    @valorTotal = valorTotal
  end

end