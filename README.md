## Integração ViaCEP

Este projeto implementa uma integração com a API ViaCEP para atualizar endereços de contas no Salesforce com base no CEP informado.

## Funcionalidades Implementadas

Método invocável consultaCep para integração com a API ViaCEP.
Método atualizaAccount para consulta do CEP, atualização dos dados da conta e gravação no Salesforce.
Utilização de chamadas assíncronas (@future) para chamadas de serviço externo.
Parseamento da resposta JSON da API ViaCEP para atualização dos dados da conta.

## Como Utilizar

Para utilizar essa integração, siga os passos abaixo:

Certifique-se de que a classe IntegracaoViaCEP e a classe ViaCepJson estão corretamente implementadas no Salesforce.
Utilize o método consultaCep para acionar a integração e passar os IDs das contas que deseja atualizar.
A classe irá realizar a consulta do CEP para cada conta, atualizar os dados de endereço com base na resposta da API ViaCEP e salvar no Salesforce.
Contribuindo
Contribuições são bem-vindas! Se você encontrar algum problema ou tiver sugestões de melhorias, sinta-se à vontade para abrir uma issue ou enviar um pull request.

## Autores

Ingrid de Falchi
