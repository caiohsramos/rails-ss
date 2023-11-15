# Rails-ss
> This is a personal project meant to be self-hosted.

This is my take on a feed reader using Rails 7.1 with no-bundle JS. It relies on modern web approaches such as [importmaps](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script/type/importmap) and the [Hotwire](https://hotwired.dev/) stack. It also uses https://github.com/oldmoe/litestack to manage database and queues, and Tailwind + DaisyUI for styling.

# Deploying
Build and run the Dockerfile. The env `SECRET_KEY_BASE` is required, and it's recommended to bind `/rails/db/production` to a local folder for backup. 
You can also add a restart policy to automatically start you container.

Example:
```
docker run \
  -p 3000:3000 \
  -e SECRET_KEY_BASE=123 \
  -v ./yourlocalbackup/db:/rails/db/production \
  --restart unless-stopped \
  ghcr.io/caiohsramos/rails-ss:<version>
```

# Developing
> A version manager is recommended when developing Ruby applications

- Clone the repository
- Run `bin/setup` (install gems + setup database)
- Start the development server `bin/dev`

# Screenshots

<img width="1470" alt="image" src="https://github.com/caiohsramos/rails-ss/assets/12804854/f84dbc6e-f52c-4662-8a13-7912e1f726d9">


<img width="1470" alt="image" src="https://github.com/caiohsramos/rails-ss/assets/12804854/eefbfef0-7bd8-4937-9b06-e6fe69584c5f">

<img width="1470" alt="image" src="https://github.com/caiohsramos/rails-ss/assets/12804854/144cdc19-b266-458d-8190-7811719c051d">



## Hotkey navigation

<img width="250" alt="image" src="https://github.com/caiohsramos/rails-ss/assets/12804854/194406a2-b8d4-4623-81a2-8927254d79b0">


