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

<img width="1470" alt="Screenshot 2023-10-31 at 22 31 40" src="https://github.com/caiohsramos/rails-ss/assets/12804854/0a239805-b592-4e16-a8e7-d8a2d9d31dcb">

<img width="1470" alt="image" src="https://github.com/caiohsramos/rails-ss/assets/12804854/7b609e51-eabf-4416-9a94-6ff7b4ff3a48">

## Hotkey navigation

<img width="250" alt="image" src="https://github.com/caiohsramos/rails-ss/assets/12804854/194406a2-b8d4-4623-81a2-8927254d79b0">


