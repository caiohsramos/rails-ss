# Rails-ss
> This is a personal project and some features are still missing

This is my take on a feed reader using Rails 7.1 with no-bundle JS. It relies on modern web approaches such as [importmaps](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script/type/importmap) and the [Hotwire](https://hotwired.dev/) stack. It also uses https://github.com/oldmoe/litestack to manage database and queues, and Tailwind + DaisyUI for styling.

# Deploying
Build and run the Dockerfile. The env `SECRET_KEY_BASE` is required. Example:
```
docker run -p 3000:3000 -e SECRET_KEY_BASE=123 ghcr.io/caiohsramos/rails-ss:<version>
```

# Developing
> A version manager is recommended when developing Ruby applications

- Clone the repository
- Run `bin/setup` (install gems + setup database)
- Start the development server `bin/dev`

# Screenshots
<img width="1470" alt="Screenshot 2023-10-30 at 19 22 50" src="https://github.com/caiohsramos/rails-ss/assets/12804854/3ddaae94-2805-4d10-9577-65a77fc1db6a">
<img width="1470" alt="Screenshot 2023-10-30 at 19 23 49" src="https://github.com/caiohsramos/rails-ss/assets/12804854/0034b54b-ee14-4e5f-8662-4eaaded351ce">
