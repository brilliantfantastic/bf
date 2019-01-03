bf
==

The new site for Brilliant Fantastic at [http://brilliantfantastic.com](http://brilliantfantastic.com).

## DESCRIPTION

The site for Brilliant Fantastic. It's the new, new shit but for now, it's a landing site to say it's Kinship.

This is built with [Gatsby](https://www.gatsbyjs.org/).

## INSTALLATION

Clone the repo

```sh
git clone git@github.com:brilliantfantastic/bf
```

Get the dependencies

```sh
cd bf
yarn install
```

Install Gatsby

The [Gatsby CLI](https://github.com/gatsbyjs/gatsby/tree/master/packages/gatsby-cli#readme) tool is needed to run Gatsby while developing. You can install the CLI tool with the following command:

```sh
npm install --global gatsby-cli
```

Run the development server

This will start everything up and our site will be accessible from the port provided. 🎉

```sh
gatsby develop
```

## DEPLOYMENT

The application is automatically deployed when master is merged via [Netlify](https://www.netlify.com/).

The application is built and deployed via the build command on the [admin dashboard](https://app.netlify.com/sites/brilliantfantastic/settings/deploys). You can ask a bf team member if you need to view or modify these settings and they can add you as an administrator.

Each PR will also receive it's own preview url when the PR is created. This is added via the [webhooks](https://github.com/brilliantfantastic/bf/settings/hooks) and the GitHub check API.
