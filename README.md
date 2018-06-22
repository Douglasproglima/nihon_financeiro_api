# API Gestão Financeira Pessoal no Japão
=======================

API do projeto de gestão financeira pessoal para brasileiros residentes no Japão.

Principais recursos utilizados nesse projeto:

- [Devise](https://github.com/plataformatec/devise) with default modules.
- [AdminLTE](https://almsaeedstudio.com/) (v.2.3.7) theme included for the admin panel.
- [SendGrid](https://github.com/stephenb/sendgrid) gem for mailing.
- Continuous testing with [Guard](https://github.com/guard/guard).
- Puma server.
- PostgreSQL database.

----------------------------
API - Backend Ruby on Rails
-------------

- REST(Representational State Transfer)
- Verbos HTTP: GET, POST, PUT e DELETE
- URI(Uniform Resource Identifier)
	* URL(Uniform Resource Locator)
	* URN(Uniform Resource Name)
	
Exemplo de Requisição:
-------------
	GET    -> http://www.nihon_financeiro.com/contas_receber/21
	POST   -> http://www.nihon_financeiro.com/contas_receber
    PUT    -> http://www.nihon_financeiro.com/contas_receber/21
    DELETE -> http://www.nihon_financeiro.com/contas_receber/21

----------------------------
Este projeto foi desenvolvido por [Douglas Lima](https://github.com/douglasproglima). Ele segue seu código de conduta e diretrizes de contribuição.