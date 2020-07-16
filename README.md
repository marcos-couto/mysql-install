----
----
# Instalando o MySQL no Linux usando o repositório MySQL Yum
## Versões:
---
- MySQL 8.0 Community Server
- Linux Fedora 32
---
O repositório MySQL Yum para Fedora fornece pacotes RPM para instalar o servidor MySQL, cliente, MySQL Workbench, MySQL Utilities, MySQL Router, MySQL Router, MySQL Shell, Connector / ODBC, Connector / Python e assim por diante ( consulte Instalando produtos e componentes adicionais do MySQL com o Yum para obter detalhes).

### Antes de começar:
---
1) As instruções a seguir assumem que o MySQL ainda não está instalado no seu sistema usando um pacote RPM distribuído por terceiros; 

2) Siga as etapas abaixo para instalar a versão GA ( General Availability ) mais recente do MySQL com o repositório MySQL Yum:


----

## Procedimento:
---

## 1. Adicionando o repositório MySQL Yum
Primeiro, adicione o repositório MySQL Yum à lista de repositórios do seu sistema. Esta é uma operação única, que pode ser executada instalando um RPM fornecido pelo MySQL. Siga esses passos:

a) Vá para a página de Download do MySQL Yum Repository:

 'https://dev.mysql.com/downloads/repo/yum/' 
 
b) Selecione e faça o download do release package para sua plataforma.
   a) Fedora 32 (Architecture Independent), RPM Package 
   (mysql80-community-release-fc32-1.noarch.rpm)
   b) Escolhendo a seguinte opção:

               No thanks, just start my download.

c) Instale o release package baixado com o seguinte comando, substituindo platform-and-version-specific-package-name  pelo nome do pacote RPM baixado:


### Para o Fedora 32:

`$> sudo dnf install mysql80-community-release-fc32-{version-number}.noarch.rpm`

O comando de instalação adiciona o repositório MySQL Yum à lista de repositórios do seu sistema e baixa a chave GnuPG para verificar a integridade dos pacotes de software. 

Você pode verificar se o repositório MySQL Yum foi adicionado com sucesso pelo seguinte comando :

`$> dnf repolist enabled | grep "mysql.*-community.*`
Nota
Depois que o repositório MySQL Yum estiver ativado em seu sistema, qualquer atualização em todo o sistema pelo comando dnf update  atualizará os pacotes MySQL em seu sistema e também substituirá quaisquer pacotes nativos de terceiros, se Yum encontra substituições para eles no repositório MySQL Yum; consulte  “Atualizando o MySQL com o repositório MySQL Yum” e, para uma discussão sobre alguns possíveis efeitos disso em seu sistema, consulte Atualizando as bibliotecas de clientes compartilhados.


## 2. Selecionando uma Release 
Ao usar o repositório MySQL Yum, o release GA mais recente (atualmente MySQL 8.0) é selecionada para instalação por padrão. 

Dentro do repositório MySQL Yum, diferentes séries de versões do MySQL Community Server são hospedadas em diferentes sub-repositórios. O sub-repositório da série GA mais recente (atualmente MySQL 8.0) é ativado por padrão, e os sub-repositórios de todas as outras séries (por exemplo, a série MySQL 8.0) são desativados por padrão. Use este comando para ver todos os sub-repositórios no repositório MySQL Yum e ver quais deles estão habilitados ou desabilitados (para sistemas habilitados para dnf, substitua yum no comando por dnf):

`$> dnf repolist all | grep mysql`
Para instalar a versão mais recente do release GA mais recente, nenhuma configuração é necessária. 

## 3. Instalando o MySQL
Instale o MySQL pelo seguinte comando (para sistemas habilitados para dnf, substitua yum no comando por dnf):

 `$> sudo dnf install mysql-community-server`

Isso instala o pacote para o servidor MySQL (mysql-community-server) e também os pacotes para os componentes necessários para executar o servidor, incluindo pacotes para o cliente (mysql-community-client), as mensagens de erro comuns e os conjuntos de caracteres para cliente e servidor (mysql-community-common) e as bibliotecas de clientes compartilhadas (mysql-community-libs).

## 4. Iniciando o servidor MySQL
Inicie o servidor MySQL com o seguinte comando:
##### IMPORTANTE
##### Leia as observações no item Teste pós Instalação.

 `$> sudo service mysqld start `    
 
    ou
    
 `$> sudo systemctl start mysqld ` 

Você pode verificar o status do servidor MySQL com o seguinte comando:

 `$> sudo service mysqld status `    
 
    ou
    
 `$> sudo systemctl status mysqld `

## 5. Alterando a senha do usuário root:
Na inicialização inicial do servidor, acontece o seguinte, uma vez que o diretório de dados do servidor está vazio:
O servidor é inicializado.
O certificado SSL e os arquivos de chave são gerados no diretório de dados.
validate_password é instalado e ativado.
Uma conta de superuser 'root' @ 'localhost é criada. Uma senha para o superusuário é definida e armazenada no error log file. Para revisá-lo, use o seguinte comando:

`$> sudo grep 'temporary password' /var/log/mysqld.log`

Altere a senha root assim que possível, efetuando login com a senha temporária gerada e defina uma senha personalizada para a conta do superuser:

```
$> mysql -uroot -p

mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass4!';
```
### Nota

validate_password é instalado por padrão. A política de senha padrão implementada por validate_password exige que as senhas contenham pelo menos:
- uma letra maiúscula;
- uma letra minúscula;
- um dígito e um caractere especial;
- e que o comprimento total da senha seja de pelo menos 8 caracteres.
##### Final do procedimento de instalação.




---
# Teste pós Instalação:
---
### Observações:

#### Init System
Para executar e gerenciar seu processo mysqld, você estará usando o init system interno do seu sistema operacional. Versões recentes do Linux tendem a usar systemd (que usa o comando systemctl), enquanto versões mais antigas do Linux tendem a usar o System V init (que usa o comando service).

Se você não tiver certeza de qual init system sua plataforma usa, execute o seguinte comando:

`$ ls -l /proc/1/exe`

O sistema deverá retornar qual init system está instalado.
Para este procedimento iremos utilizar o systemd.

## 1.
Para iniciar o processo mysqld use o seguinte comando:

`$ sudo systemctl start mysqld`

## 2.
Verifique se o MySQL foi iniciado com êxito:

`$ sudo systemctl status mysqld`

## 3.
Opcionalmente, você pode garantir que o MySQL inicialize quando o seu sistema for reinicializado, use o seguinte comando:

 ` $ sudo systemctl enable mysqld`

## 4.
Conforme necessário, você pode parar o processo mysqld através o seguinte comando:

 `$ sudo systemctl stop mysqld`

## 5.
Caso necessário, você pode reiniciar processo mysqld através o seguinte comando:
`$ sudo systemctl restart mysqld`

Você pode acompanhar o estado do processo em busca de erros ou mensagens importantes, observando a saída no arquivo:

/var/log/mysqld.log file.

---
---



