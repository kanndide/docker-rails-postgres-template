# A Template for Rails API in Docker Container

```
cd projects
git clone https://github.com/kanndide/docker-rails-postgres-template.git app-name
cd app-name
rm -rf .git
# If Windows 
rm .git -Force
docker-compose run app rails new . --force --database=postgresql --skip-bundle --api
# Edit Gemfile to include jbuilder gem and change tzdata-info platforms
mv database.yml config/database.yml
docker-compose build
docker-compose up
# localhost:3001
# Be sure to create a database with
docker-compose run app rake db:create
docker-compose run --rm app rails g scaffold post title body:text
docker-compose run --rm app rake db:migrate
# GET http://localhost:3001/posts.json
# POST http://localhost:3001/posts.json with JSON body
```

### Resolving tzdata-info gem error

After creating the Rails app, go into the Gemfile and remove the platforms for the tzdata-info gem. It should look like `gem 'tzinfo-data'`

Run `docker-compose run app bundle update`

### Testing API with Postman or other API testing tool

Send GET request to localhost:3001/posts.json   
You should receive an array `[]` in response.   
Next, send a POST request to localhost:3001/posts.json with a json body
```
{
    "post": {
        "title": "Post 1",
        "body": "Some example content."
    }
}
```
Confirm a response back for creating a post.   
Send a GET requests back to localhost:3001/posts.json and you should receive the post back in a JSON response.