# :mechanical_arm: Minmal Hasura Auth

![localhost_3000_(Web 1440 XD)](https://user-images.githubusercontent.com/70956582/233124261-ff308a30-e40c-4918-8c42-737de6e70d16.png)

## Features

- [Vite](https://vitejs.dev/) + [Vue](https://vuejs.org/) SFC + [UnoCSS](https://unocss.dev/)
- [Hasura Cloud](https://hasura.io/)
- Apollo Client
- GraphQL
- [Auth0](https://auth0.com/)
- File based routing
- [ESLint](https://eslint.org/) to style the code with [`antfu/eslint-config`](https://github.com/antfu/eslint-config)

## Development

1. add `.env` according to [example](https://github.com/e3stpavel/minimal-hasura-auth/blob/main/db/.env.example) and [install Hasura]() if you want to connect to Hasura locally.
2. add `.env` to the application itself according to this [example](https://github.com/e3stpavel/minimal-hasura-auth/blob/main/.env.example).
3. _-- there also should be a lot of set up using Auth0 and Hasura but I'll omit it here --_
4. Basically you're ready to go. 
   - `pnpm dev` - dev server
   - `pnpm build` - typecheck and build
   - `pnpm preview` - preview the build locally

## License
MIT
