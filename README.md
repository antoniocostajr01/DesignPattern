📐 DesignPattern em Swift
Este repositório contém a implementação de um único padrão de projeto utilizando Swift.

🧩 Padrão(ões) Utilizado:
1. Singleton

Por que foi escolhido?
O padrão Singleton foi escolhido por ser um dos mais fundamentais e amplamente utilizados no desenvolvimento iOS e Swift. Ele se encaixa perfeitamente em cenários onde é crucial ter uma única instância de uma classe para gerenciar um recurso compartilhado ou um estado global.

Garante uma única instância global: Impede que múltiplas instâncias de uma classe sejam criadas, economizando recursos e evitando comportamentos inconsistentes.
Acesso global simplificado: Permite que qualquer parte do aplicativo acesse essa única instância de forma fácil e consistente.
Ideal para serviços compartilhados no app: É perfeitamente adequado para classes que gerenciam funcionalidades centrais e globais, como:
Gerenciadores de Log: Para registrar eventos e erros em um único fluxo.
Cache: Para armazenar dados temporários de forma centralizada.
Autenticação: Para gerenciar o estado de login do usuário.
Gerenciadores de Rede: Para lidar com requisições e respostas de forma unificada.
Banco de Dados: Para controlar o acesso a uma única instância do banco de dados.
Como foi implementado:

A implementação do Singleton em Swift é concisa e idiomática, aproveitando as características da linguagem para garantir segurança de thread e acesso fácil à instância compartilhada.

Swift
import Foundation

Logger Singleton
  1. Instância compartilhada (Singleton)

    // class Logger {

    // 'static let' garante que a instância seja criada apenas uma vez (thread-safe por padrão em Swift)
    static let shared = Logger()

    // 2. Construtor privado
    // Impede que outras partes do código criem novas instâncias de Logger
    private init() {
        print("Logger inicializado.")
        // Configurações iniciais do Logger, se houverem
    }

    // 3. Método de exemplo para registrar mensagens
    func log(_ message: String) {
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .medium)
        print("[\(timestamp)] \(message)")
        // Aqui você pode adicionar lógica para salvar em arquivo, enviar para um serviço de análise, etc.
    }

    // Outros métodos para diferentes níveis de log, como erro, aviso, debug, etc.
    func logError(_ error: Error) {
        print("[ERROR] \(error.localizedDescription)")
    }

    func logWarning(_ message: String) {
        print("[WARNING] \(message)")
    }
}

// MARK: - Exemplos de Uso

// Uso em qualquer parte do app
Logger.shared.log("Aplicação iniciada.")

// Outro exemplo de uso
let userName = "Alice"
Logger.shared.log("Usuário '\(userName)' logado com sucesso.")

// Tentativa de criar uma nova instância (resultará em erro de compilação, pois o init é privado)
// let anotherLogger = Logger() // Erro: 'init()' is inaccessible due to 'private' protection level
Explicação da Implementação:

static let shared = Logger(): Esta é a parte central da implementação do Singleton.
static: Garante que shared seja uma propriedade de tipo (associada à classe, não a uma instância).
let: Torna shared uma constante, significando que ela será inicializada uma única vez.
Em Swift, a inicialização de constantes globais e estáticas é garantidamente thread-safe. Isso significa que mesmo que múltiplos threads tentem acessar Logger.shared ao mesmo tempo, a instância será criada apenas uma vez e de forma segura.
private init(): Ao tornar o construtor (init) privado, impedimos que outras partes do código instanciem Logger diretamente usando Logger(). Isso reforça o controle de que a única maneira de obter uma instância de Logger é através da propriedade Logger.shared.
Métodos de Instância: A classe Logger pode conter quaisquer métodos e propriedades que você deseja que a única instância compartilhe e gerencie. No exemplo, log(_ message:) é um método simples para registrar mensagens.
Este design garante que você tenha um ponto de acesso global e controlado para a funcionalidade de log em seu aplicativo, seguindo as melhores práticas do padrão Singleton em Swift.
