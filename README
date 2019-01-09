# A Template for Rails API in Docker Container

```
cd projects
git clone https://github.com/kanndide/docker-rails-postgres-template.git app-name
cd app-name
rm -rf .git
docker-compose run app rails new . --force --database=postgresql --skip-bundle --api
# Edit Gemfile to include jbuilder gem
docker-compose build
docker-compose up
# localhost:3001
docker-compose run --rm app rails g scaffold post title body:text
docker-compose run --rm app rake db:migrate
# GET http://localhost:3001/posts.json
# POST http://localhost:3001/posts.json with JSON body
```