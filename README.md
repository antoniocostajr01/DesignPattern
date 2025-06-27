# 🍞 Bakery CLI App

Um aplicativo de linha de comando (CLI) para gerenciamento de pedidos de uma padaria. Com ele, empregados registram novos pedidos e gerentes acessam relatórios de vendas e históricos de clientes.

---

## 📦 Funcionalidades

- Registrar novo pedido com nome do cliente, itens e valor
- Listar pedidos do dia
- Calcular o total de vendas
- Consultar histórico de pedidos de um cliente

---

## 🧠 Padrões de Projeto Utilizados

- 🧱 **Singleton**: `ManagerOrder` e `System` mantêm estados globais únicos.

```
class ManagerOrder {
    static let shared = ManagerOrder() // instância única
    private init() {}                  // impede múltiplas instâncias
}

class System {
    static let shared = System()       // instância única
    private init() {}
    var role: Role = .Employee
```


- 🕶️  **Proxy**: `ClientHistoryProxy` adia o carregamento do histórico real do cliente.
```
class ClientHistoryProxy: ClientHistory {
    private var realHistory: RealClientHistory?

    func showHistory() {
        if realHistory == nil {
            realHistory = RealClientHistory(client: client) // carrega sob demanda
        }
        realHistory?.showHistory()
    }
}

//Exemplo de uso:
let proxy = ClientHistoryProxy(client: client)
proxy.showHistory()
```



- 🧩 **Command**: cada ação do menu é encapsulada em um objeto independente, permitindo separação clara entre menu e lógica de execução.

```
protocol Command {
    func execute()
}

class MakeOrderCommand: Command {
    func execute() {
        makeOrder() // encapsula a ação
    }
}


//Exemplo de uso no meu principal
let invoker = MenuInvoker()
invoker.register(option: "1", command: MakeOrderCommand())
invoker.register(option: "2", command: ShowOrderCommand())

invoker.execute(option: option)

```



---

## 🛠️ Tecnologias

- Swift (CLI)
- Paradigma Orientado a Objetos
- Padrões de Design Clássicos

---

## ▶️ Como rodar

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/bakery-cli.git
   cd bakery-cli
