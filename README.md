# :mechanical_arm: Minmal Hasura Auth

![localhost_3000_(Web 1440 XD)](https://user-images.githubusercontent.com/70956582/233124261-ff308a30-e40c-4918-8c42-737de6e70d16.png)

## Features

- :zap: [Vite](https://vitejs.dev/) + [Vue](https://vuejs.org/) SFC + pnpm
- :art: [UnoCSS](https://unocss.dev/)
- :cloud: [Hasura Cloud](https://hasura.io/)
- :heavy_check_mark: Apollo Client
- :white_check_mark: GraphQL
- :lock: [Auth0](https://auth0.com/)
- :file_folder: File based routing
- :muscle: TypeScript, of course
- :wrench: [ESLint](https://eslint.org/) to style the code with [`antfu/eslint-config`](https://github.com/antfu/eslint-config)

## Development

### Hasura Cloud
1. Make sure you've [installed Hasura](https://github.com/hasura/graphql-engine/releases)
1. Add it to path or put it inside `db` directory
1. Add `.env` according to [example](https://github.com/e3stpavel/minimal-hasura-auth/blob/main/db/.env.example)
1. Launch it using `hasura console`
1. To sync the changes with the cloud use `hasura deploy --with-seeds`

### Vue application
1. Install the dependencies using `pnpm install`
2. Add `.env` variables according to this [example](https://github.com/e3stpavel/minimal-hasura-auth/blob/main/.env.example).
3. Basically you're ready to go: 
   - `pnpm dev` - dev server
   - `pnpm build` - typecheck and build
   - `pnpm preview` - preview the build locally

### GitHub Actions
Automatic on push branch `main` action is disabled, therefore you should go to the actions tab and trigger the deployment manually.

## License
MIT
