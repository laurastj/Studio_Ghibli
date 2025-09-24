# Studio_Ghibli

### Configuração do banco (IMPORTANTE)

O repositório inclui `db.rb` com uma **senha genérica/placeholder**:

```ruby
password: 'senha'

➡️ Antes de executar o projeto, edite db.rb e substitua 'SUA_SENHA_AQUI' pela sua senha real do PostgreSQL local.

## Tecnologias usadas
- [Ruby]
- [PostgreSQL]
- [HTTParty]
- [pg]

## 📂 Estrutura do projeto
app.rb # Script principal: consome a API e salva no banco
db.rb # Conexão com PostgreSQL (com senha genérica para exemplo)

## 🔧 Configuração do banco
No PostgreSQL (`psql`):

```sql
CREATE DATABASE api_sg_ruby;

\c api_sg_ruby;

CREATE TABLE studio_ghibli (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    director VARCHAR(100),
    release_date VARCHAR(10)
);

## ▶️ Como executar

1. Instale as gems necessárias:

gem install pg httparty


2. Execute o script:

ruby app.rb

3. Saída esperada:

✅ Filmes do Studio Ghibli salvos no banco!
🎬 Spirited Away (2001) | Dir: Hayao Miyazaki
🎬 My Neighbor Totoro (1988) | Dir: Hayao Miyazaki
🎬 Princess Mononoke (1997) | Dir: Hayao Miyazaki
...
