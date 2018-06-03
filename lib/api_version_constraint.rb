class ApiVersionConstraint

  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    #Versão default ou versão que o usuário específicou
    @default || req.headers['Accept'].includes?("application/vnd.nihon_finanaceiro.v#{@version}")
  end

end