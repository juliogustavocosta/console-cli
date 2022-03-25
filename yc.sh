#!/bin/bash

export YC_PROTOCOL="https"
export YC_BAAS_ADDR="api.ycodify.com"

for entry in $(~/.ycvars);
do export $entry;
done;

bold=$(tput bold)
normal=$(tput sgr0)

echo ""
echo "${bold}yc${normal} script, v0.1."

case "$1" in
  "manual")
    echo ""
    echo "======================="
    echo "${bold}I. Objetos YC${normal}"
    echo "Estes são os ${bold}objeto${normal}s tratados pela plataforma ycodify. Todos os comandos atuam sobre um desses objetos:"
    echo ""
    echo " 1. ${bold}schema${normal}: unidade de abstração que especifica um sistema, ou domínio de negócio de uma aplicação. Este objeto é o primeiro a ser criado para especificar o domínio de uma aplicação para que essa use os serviços de backend;"
    echo ""
    echo " 2. ${bold}entity${normal}: um substantivo ou um verbo do domínio da aplicação que especifica um conceito do domínio de negócios;"
    echo ""
    echo " 3. ${bold}attribute${normal}: uma qualidade de uma \"entity\";"
    echo ""
    echo " 4. ${bold}relationship${normal}: objeto que especifica um relacionamento entre \"entity\"s. É criado como um atributo especial em uma \"entity\";"
    echo ""
    echo " 5. ${bold}account${normal}: representa uma conta de usuário na plataforma ycodify."
    echo ""
    echo ""
    echo "======================================="
    echo "${bold}II. A respeito dos exemplos usados mais a seguir${normal}"
    echo "Os exemplos usados mais adiante usam esse pequeno modelo de dados para efeito de auxílio à compreensão:"
    echo ""
    echo "schema ${bold}library${normal} {"
    echo "  entity ${bold}book${normal} {"
    echo "    ${bold}title${normal}"
    echo "    ${bold}author${normal}"
    echo "  }"
    echo "  entity ${bold}copy${normal} {"
    echo "    ${bold}from${normal} ("
    echo "      book"
    echo "    )"
    echo "    ${bold}identifier${normal}"
    echo "  }"
    echo "}"
    echo ""
    echo ""
    echo "============================="
    echo "${bold}III. Os argumentos para o script 'yc'${normal}"
    echo "Os argumentos para o comando yc são todos baseados em um dos objetos listados no ponto I."
    echo ""
    echo "-----------------------------------"
    echo "${bold}1${normal}. sobre o comando ${bold}yc create${normal} 'object':"
    echo ""
    echo "1.1. ${bold}schema${normal}: criar um novo schema de dados para uma aplicação."
    echo "     uso: yc create ${bold}schema${normal} 'substituir por-schema-name'"
    echo "     exemplo: yc create ${bold}schema${normal} library"
    echo ""
    echo "1.2. ${bold}entity${normal}: criar uma entidade associando-a a um schema."
    echo "     uso: yc create ${bold}entity${normal} 'substituir por-schema-name' 'substituir por-entity-name'"
    echo "     exemplo: yc create ${bold}entity${normal} library book"
   #echo "1.2.1. "
   #echo "     exemplo: yc create ${bold}entity${normal} library book '"_concurrencyControl":true'"
    echo ""
    echo "1.3. ${bold}attribute${normal}: criar um atributo associando-o a uma entidade."
    echo "     uso: yc create ${bold}attribute${normal} 'substituir por-schema-name' 'substituir por-entity-name' 'substituir por-attribute-name'"
    echo "     exemplo: yc create ${bold}attribute${normal} library book title"
    echo "     nota: por padrão esse atributo é criando como sendo do tipo String com comprimento 64 (para customizar o objeto attribute: https://api.ycodify.com/documentation)"
   #echo "1.3.1. "
   #echo "     exemplo: yc create ${bold}attribute${normal} library book author '"isNullable":false'"
    echo ""
    echo "1.4. ${bold}relationship${normal}: criar um relacionamento entre entidades e associá-lo a uma entidade."
    echo "     uso: yc create ${bold}relationship${normal} 'substituir por-schema-name' 'substituir por-entity-name' 'substituir por-relationship-name' 'substituir por-entity-name'"
    echo "     exemplo: yc create ${bold}relationship${normal} library copy from book"
    echo "     nota: a entidade 'copy' tem um atributo cujo nome é 'from'. este atributo referencia uma instância da entidade 'book' (para customização de um objeto ${bold}relationship${normal}: https://api.ycodify.com/documentation)"
    echo ""
    echo "1.5. ${bold}account${normal}: criar uma nova conta na plataforma yc."
    echo "     uso: yc create ${bold}account${normal} 'substituir por username' 'substituir por password' 'substituir por email'"
    echo "     exemplo: yc create ${bold}account${normal} acme 12345 acme@email.com"
    echo ""
    echo ""
    echo "---------------------------------"
    echo "${bold}2${normal}. sobre o comando ${bold}yc read${normal} 'object':"
    echo ""
    echo "2.1. ${bold}schema${normal}: apresenta um schema."
    echo "     uso: yc read ${bold}schema${normal} 'substituir por-schema-name'"
    echo "     exemplo: yc read ${bold}schema${normal} library"
    echo ""
    echo "2.2. ${bold}entity${normal}: apresentar uma entidade em um schema."
    echo "     uso: yc read ${bold}entity${normal} 'substituir por-schema-name' 'substituir por-entity-name'"
    echo "     exemplo: yc read ${bold}entity${normal} library book"
    echo ""
    echo "2.3. ${bold}attribute${normal}: apresentar um atributo em uma entidade."
    echo "     uso: yc read ${bold}attribute${normal}'substituir por-schema-name' 'substituir por-entity-name' 'substituir por-attribute-name'"
    echo "     exemplo: yc read ${bold}attribute${normal} library book title"
    echo ""
    echo "2.4. ${bold}relationship${normal}: apresentar um relacionamento em uma entidade."
    echo "     uso: yc read ${bold}relationship${normal} 'substituir por-schema-name' 'substituir por-entity-name' 'substituir por-relationship-name'"
    echo "     exemplo: yc read ${bold}relationship${normal} library copy book"
    echo ""
    echo ""
    echo "-------------------------------------"
    echo "${bold}3${normal}. sobre o comando ${bold}yc read-all${normal} 'object':"
    echo ""
    echo "3.1. ${bold}entity${normal}: read all entities into a schema."
    echo "     uso: yc read-all ${bold}entity${normal} 'substituir por-schema-name'"
    echo "     exemplo: yc read-all ${bold}entity${normal} library"
    echo ""
    echo ""
    echo "-----------------------------------"
    echo "${bold}4${normal}. sobre o comando ${bold}yc update${normal} 'object':"
    echo ""
    echo "4.1. ${bold}entity${normal}: atualizar definições de uma entidade em um schema."
    echo "     uso: yc update ${bold}entity${normal} 'substituir por-schema-name' 'substituir por-entity-name' 'metadata' (sobre 'metadata': https://api.ycodify.com/documentation)"
    echo "     exemplo: yc update ${bold}entity${normal} library book \"_concurrencyControl\":true (isso permite o controle de concorrência para acessar instâncias de uma entidade)"
    echo ""
    echo "4.2. ${bold}attribute${normal}: atualizar as definições de um atributo em uma entidade."
    echo "     uso: yc update ${bold}attribute${normal}'substituir por-schema-name' 'substituir por-entity-name' 'substituir por-attribute-name' 'metadata' (sobre 'metadata': https://api.ycodify.com/documentation)"
    echo "     exemplo: yc update ${bold}attribute${normal} library book title \"isUnique\":true (isso torna os valores desse atributo únicos em seu espaço de valor)"
    echo ""
    echo "4.3. ${bold}relationship${normal}: atualizar as definições de um relacionamento em uma entidade."
    echo "     uso: yc update ${bold}relationship${normal} 'substituir por-schema-name' 'substituir por-entity-name' 'substituir por-relationship-name' 'metadata' (sobre 'metadata': https://api.ycodify.com/documentation)"
    echo "     exemplo: yc update ${bold}relationship${normal} library copy \"isNullable\":true (isso permite que existam cópias de livros sem fazer referência a livros)"
    echo ""
    echo ""
    echo "-----------------------------------"
    echo "${bold}5${normal}. sobre o comando ${bold}yc delete${normal} 'object':"
    echo ""
    echo "5.1. ${bold}schema${normal}: remoção de um schema."
    echo "     uso: yc delete ${bold}schema${normal} 'substituir por-schema-name'"
    echo "     exemplo: yc delete schema${normal} library"
    echo ""
    echo "5.2. ${bold}entity${normal}: remoção de uma entidade em um schema."
    echo "     uso: yc delete ${bold}entity${normal} 'substituir por-schema-name' 'substituir por-entity-name'"
    echo "     exemplo: yc delete ${bold}entity${normal} library book"
    echo "     nota: a exclusão não será realizada se a entidade for referenciada por outra no esquema"
    echo ""
    echo "5.3. ${bold}attribute${normal}: remoção de um atributo em uma entidade."
    echo "     uso: yc delete ${bold}attribute${normal}'substituir por-schema-name' 'substituir por-entity-name' 'substituir por-attribute-name'"
    echo "     exemplo: yc delete ${bold}attribute${normal} library book author"
    echo ""
    echo "5.4. ${bold}relationship${normal}: remoção de um relacionamento        em uma entidade."
    echo "     uso: yc delete ${bold}relationship${normal} 'substituir por-schema-name' 'substituir por-entity-name' 'substituir por-relationship-name'"
    echo "     exemplo: yc delete ${bold}relationship${normal} library copy book"
    echo ""
    echo ""
    echo "----------------------------------"
    echo "${bold}6${normal}. sobre o comando ${bold}yc login${normal} 'object':"
    echo ""
    echo "6.1. ${bold}account${normal}: get a auth token to an account."
    echo "     uso: yc login ${bold}account${normal} 'username' 'password'"
    echo "     exemplo: yc login ${bold}account${normal} 'acme' '123456'"
    echo ""
    echo ""
    echo "-----------------------------------"
    echo "${bold}7${normal}. sobre o comando ${bold}yc enable${normal} 'object':"
    echo ""
    echo "7.1. ${bold}schema${normal}: deploy a schema."
    echo "     uso: yc enable ${bold}schema${normal} 'substituir por-schema-name'"
    echo "     exemplo: yc enable ${bold}schema${normal} library"
    echo ""
    echo ""
    echo "------------------------------------"
    echo "${bold}8${normal}. sobre o comando ${bold}yc disable${normal} 'object':"
    echo ""
    echo "8.1. ${bold}schema${normal}: undeploy a schema."
    echo "     uso: yc disable ${bold}schema${normal} 'substituir por-schema-name'"
    echo "     exemplo: yc disable ${bold}schema${normal} library"
    echo ""
    echo ""
    echo "--------------------------------------------------"
    echo "${bold}10${normal}. sobre o comando ${bold}yc create-admin-account${normal} 'object':"
    echo ""
    echo "10.1. ${bold}schema${normal}: 'undeploy' a schema."
    echo "      uso: yc create-admin-account ${bold}schema${normal} 'substituir por-schema-name'"
    echo "      exemplo: yc create-admin-account ${bold}schema${normal} library"
    echo "      nota: guarde para posterior recuperação o nome de usuário e senha retornados por esse comando."
  ;;
  "set")
    case "$2" in
      "sandbox")
        export YC_PROTOCOL="https"
        export YC_BAAS_ADDR="api.ycodify.com"
      ;;
      "production")
        export YC_PROTOCOL="https"
        export YC_BAAS_ADDR="api.ycodify.com"
      ;;
    esac;
  ;;
  "create")
    case "$2" in
      "account")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/account-mngr/account"
        curl -i -X POST -H 'Content-Type: application/json' --data '{"username":"'"$3"'","password":"'"$4"'","email":"'"$5"'"}' ${url}
      ;;
      "schema")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema"
        curl -i -X POST -H "Authorization: Bearer $YC_CLIENT_TOKEN" -H "Content-Type: application/json" --data '{"name":"'"$3"'"}' ${url}
      ;;
      "entity")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema/$3/entity"
        if [[ $4 =~ ['"'] ]]; then
            curl -i -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $YC_CLIENT_TOKEN" --data '{"name":"'"$4"'",'"$5"'}' ${url}
        else
            curl -i -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $YC_CLIENT_TOKEN" --data '{"name":"'"$4"'"}' ${url}
        fi
      ;;
      "attribute")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema/$3/entity/$4/attribute"
        if [[ $6 =~ ['"'] ]]; then
            curl -i -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $YC_CLIENT_TOKEN" --data '{"name":"'"$5"'",'"$6"'}' ${url}
        else
            curl -i -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $YC_CLIENT_TOKEN" --data '{"name":"'"$5"'"}' ${url}
        fi
      ;;
      "relationship")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema/$3/entity/$4/association"
            curl -i -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $YC_CLIENT_TOKEN" --data '{"name":"'"$5"'",'"$6"'}' ${url}
      ;;
      *)
        echo "Opção de comando desconhecido"
      ;;
    esac;
  ;;
  "read")
    case "$2" in
      "account")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/account-mngr/account/username/$YC_CLIENT"
        tmp_ycprofile=$(curl -i -X GET -H "Authorization: Bearer $YC_CLIENT_TOKEN" ${url})
        echo "#!/bin/bash" > ~/.ycprofile
        echo "echo \"YC_CLIENT_PROFILE=$tmp_ycprofile\"" >> ~/.ycprofile 
        chmod +x ~/.ycprofile
        echo ""
        echo $tmp_ycprofile
      ;;
      "schema")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema"
        curl -i -X GET -H "Authorization: Bearer $YC_CLIENT_TOKEN" ${url}
      ;;
      "entity")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema/$3/entity/$4"
        curl -i -X GET -H "Authorization: Bearer $YC_CLIENT_TOKEN" ${url}
      ;;
      "attribute")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema/$3/entity/$4/attribute/$5"
        curl -i -X GET -H "Authorization: Bearer $YC_CLIENT_TOKEN" ${url}
      ;;
      "relationship")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema/$3/entity/$4/association/$5"
        curl -i -X GET -H "Authorization: Bearer $YC_CLIENT_TOKEN" ${url}
      ;;
      *)
        echo "Opção de comando desconhecido"
      ;;
    esac;
  ;;
  "read-all")
    case "$2" in
      "account")
        
      ;;
      "schema")
        
      ;;
      "entity")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema/$3"
        curl -i -X GET -H "Authorization: Bearer $YC_CLIENT_TOKEN" ${url}
      ;;
      *)
        echo "Opção de comando desconhecido"
      ;;
    esac;
  ;;
  "update")
    case "$2" in
      "account")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/account-mngr/account/username/$YC_CLIENT/version/$3"
        curl -i -X PUT -H 'Content-Type: application/json' -H "Authorization: Bearer $YC_CLIENT_TOKEN" --data "$4" ${url}
      ;;
      "schema")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema/$3"
        curl -i -X PUT -H "Authorization: Bearer $YC_CLIENT_TOKEN" -H "Content-Type: application/json" --data "$4" ${url}
      ;;
      "entity")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema/$3/entity/$4"
        #curl -i -X PUT -H "Content-Type: application/json" -H "Authorization: Bearer $YC_CLIENT_TOKEN" --data "$5" ${url}
        if [[ $5 =~ ['"'] ]]; then
            curl -i -X PUT -H "Content-Type: application/json" -H "Authorization: Bearer $YC_CLIENT_TOKEN" --data '{"_classDef":{'$5'}}' ${url}
        else
            curl -i -X PUT -H "Content-Type: application/json" -H "Authorization: Bearer $YC_CLIENT_TOKEN" --data $5 ${url}
        fi
      ;;
      "attribute")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema/$3/entity/$4/attribute/$5"
        curl -i -X PUT -H "Content-Type: application/json" -H "Authorization: Bearer $YC_CLIENT_TOKEN" --data "$6" ${url}
      ;;
      "relationship")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema/$3/entity/$4/association/$5"
        curl -i -X PUT -H "Content-Type: application/json" -H "Authorization: Bearer $YC_CLIENT_TOKEN" --data "$6" ${url}
      ;;
      *)
        echo "Opção de comando desconhecido"
      ;;
    esac;
  ;;
  "delete")
    case "$2" in
      "account")
        
      ;;
      "schema")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema/$3"
        curl -i -X DELETE -H "Authorization: Bearer $YC_CLIENT_TOKEN" ${url}
      ;;
      "entity")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema/$3/entity/$4"
        curl -i -X DELETE -H "Authorization: Bearer $YC_CLIENT_TOKEN" ${url}
      ;;
      "attribute")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema/$3/entity/$4/attribute/$5"
        curl -i -X DELETE -H "Authorization: Bearer $YC_CLIENT_TOKEN" ${url}
      ;;
      "relationship")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema/$3/entity/$4/association/$5/type/$6"
        curl -i -X DELETE -H "Authorization: Bearer $YC_CLIENT_TOKEN" ${url}
      ;;
      *)
        echo "Opção de comando desconhecido"
      ;;
    esac;
  ;;
  "login")
    case $2 in
      "account")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/security/oauth/token"
        response=$(curl -X POST -u "frontend:13579" -d "username=$3&password=$4&grant_type=password" ${url})
        access_token=$(echo $response | jq '.access_token')
        echo "#!/bin/bash" > ~/.ycvars
        echo "echo \"YC_CLIENT_TOKEN=$access_token\"" >> ~/.ycvars
        echo "echo \"YC_CLIENT=$3\"" >> ~/.ycvars
        chmod +x ~/.ycvars
        echo ""
        RED="\033[0;31m"
        NC="\033[0m"
        printf "${RED}Atenção, cuidado! Esse é o token de acesso para a conta informada${NC}: $access_token"
      ;;
      *)
        echo "Opção de comando desconhecido"
      ;;
    esac
  ;;
  "info")
    case $2 in
      "account")
        echo "logged account info: $YC_CLIENT_PROFILE"
      ;;
      *)
        echo "Opção de comando desconhecido"
      ;;
    esac
  ;;
  "enable")
    case $2 in
      "schema")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema/$3"
        curl -i -X PUT -H "Authorization: Bearer $YC_CLIENT_TOKEN" -H "Content-Type: application/json" --data '{"status":2}' ${url}
      ;;
      *)
        echo "Opção de comando desconhecido"
      ;;
    esac
  ;;
  "disable")
    case $2 in
      "schema")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema/$3"
        curl -i -X PUT -H "Authorization: Bearer $YC_CLIENT_TOKEN" -H "Content-Type: application/json" --data '{"status":1}' ${url}
      ;;
      *)
        echo "Opção de comando desconhecido"
      ;;
    esac
  ;;
  "yuml-script")
    case $2 in
      "schema")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema/$3/for-graphical-view/show-attributes/$4"
        echo "copy and past this script into https://yuml.me/diagram/scruffy/class/draw ..."
        curl -i -X GET -H "Authorization: Bearer $YC_CLIENT_TOKEN" ${url}
      ;;
      *)
        echo "Opção de comando desconhecido"
      ;;
    esac
  ;;
  "create-admin-account")
    case $2 in
      "schema")
        url="$YC_PROTOCOL://$YC_BAAS_ADDR/api/model-mngr/schema/$3/create-admin-account"
        curl -i -X POST -H "Authorization: Bearer $YC_CLIENT_TOKEN" ${url}
      ;;
      *)
        echo "Opção de comando desconhecido"
      ;;
    esac
  ;;
esac;
echo ""
