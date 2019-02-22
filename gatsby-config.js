module.exports = {
  siteMetadata: {
    title: `brilliant fantastic`,
    description: `A genuine, transparent software company of one`,
    author: `@jwright`,
  },
  plugins: [
    `gatsby-plugin-styled-components`,
    `gatsby-plugin-react-helmet`,
    {
      resolve: `gatsby-source-filesystem`,
      options: {
        name: `images`,
        path: `${__dirname}/src/images`,
      },
    },
    `gatsby-transformer-sharp`,
    `gatsby-plugin-sharp`,
    {
      resolve: `gatsby-plugin-manifest`,
      options: {
        name: `Brilliant Fantastic`,
        short_name: `bf`,
        start_url: `/`,
        background_color: `#663399`,
        theme_color: `#663399`,
        display: `minimal-ui`,
        //icon: "src/images/icon.png"
        include_favicon: true,
      },
    },
  ],
}
