Esse projeto trata-se da etapa de transformação de um pipeline de dados. Os dados tratam principalmente das vendas (sales) da empresa 'Adventure Works' que foram extraídos do postgres através do meltano e carregados na plataforma de dados snowflake-gcp. O projeto utiliza a divisão clássica do [dbt](https://docs.getdbt.com/docs/build/documentation) em layers sendo staging, intermediate e marts.

# Transforming with dbt

## 1. Estabelecer conexão do dbt Cloud com o snowflake + Repositório

Identificar as credenciais do snowflake para estabelecer conexão com o snowflake e começar o desenvolvimento:

- Account
- database
- Schema
- warehouse
- User
- Password

A partir do cadastro das credenciais, é possível realizar o test da conexão nativamete pelo dbt Cloud.

## 2. Alguns comandos do dbt
- dbt build
- dbt build -m model (Para um modelo específico)
- dbt build -m +model (Para todos os modelos que estão associados a aquele modelo)
- dbt run
- dbt run -m model
- dbt run -m +model
- dbt test
- dbt test --select model


