# Rails-ss

> This is a personal project meant to be self-hosted.

This is my take on a feed reader using Rails with no-bundle JS. It relies on modern web approaches such as [importmaps](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script/type/importmap) and the [Hotwire](https://hotwired.dev/) stack. It also uses the Solid stack to manage database, queues cache, and websockets, and Tailwind + DaisyUI for styling.

# Deploying

Build and run the Dockerfile. The env `RAILS_MASTER_KEY` is required, and it's recommended to bind `/rails/db/production` to a local folder for backup.
You can also add a restart policy to automatically start you container.

Example:

```
docker run \
  -p 3000:3000 \
  -e RAILS_MASTER_KEY=123 \
  -v ./yourlocalbackup/db:/rails/db/production \
  --restart unless-stopped \
  ghcr.io/caiohsramos/rails-ss:<version>
```

A simple login form is present to allow usage and can be configured with the variables `AUTH_USERNAME` and `AUTH_PASSWORD`. If no variables are providade the defaults are used (`admin`/`password`).

Example:

```
docker run \
  -p 3000:3000 \
  -e RAILS_MASTER_KEY=123 \
  -e AUTH_USERNAME=user \
  -e AUTH_PASSWORD=pass \
  -v ./yourlocalbackup/db:/rails/db/production \
  --restart unless-stopped \
  ghcr.io/caiohsramos/rails-ss:<version>
```

# Developing

> A version manager is recommended when developing Ruby applications

- Clone the repository
- Run `bin/setup` (install gems + setup database)
- Start the development server `bin/dev`

You can also use [devcontainers](https://containers.dev/)

# Screenshots

<img width="1470" alt="image" src="https://github.com/caiohsramos/rails-ss/assets/12804854/08575fad-04cc-4f1c-a9f3-a5867ba9d375">

---

<img width="1470" alt="image" src="https://github.com/caiohsramos/rails-ss/assets/12804854/7b2acc7d-b5f5-4a80-b336-34b90fdb64f0">

---

<img width="1470" alt="image" src="https://github.com/caiohsramos/rails-ss/assets/12804854/bb3f24b0-b844-452f-ad88-2d400c7760f7">

---

<img width="1470" alt="image" src="https://github.com/caiohsramos/rails-ss/assets/12804854/11927ecc-3f08-49d3-823c-14f131bd8114">

## Hotkey navigation

<img width="250" alt="image" src="https://github.com/caiohsramos/rails-ss/assets/12804854/194406a2-b8d4-4623-81a2-8927254d79b0">
