// @ts-nocheck

require("dotenv").config()

module.exports = {
  siteMetadata: {
    title: "Gatsby Default Starter",
    description: `Kick off your next, great Gatsby project with this default starter. This barebones starter ships with the main Gatsby configuration files you might need.`,
    author: `@gatsbyjs`,
  },
  plugins: [
    {
      resolve: `gatsby-source-airtable`,
      options: {
        // apiKey: process.env.AIRTABLE_API_KEY,
        apiKey: "keyMmAL4mVBSORkGc", // read only api, so its cool that its in the repo
        concurrency: 5, // default, see using markdown and attachments for more information
        tables: [
          {
            baseId: `appfnkp3GRXiKn9HR`,
            tableName: `Shelter`,
            tableLinks: [`County`], // optional, for deep linking to records across tables.
            tableView: "Map",
          },
          {
            baseId: `appfnkp3GRXiKn9HR`,
            tableName: `News`,
            // tableLinks: [`CASE`, `SENSITIVE`, `COLUMN`, `NAMES`], // optional, for deep linking to records across tables.
          },
          {
            baseId: `appfnkp3GRXiKn9HR`,
            tableName: `County`,
            // tableLinks: [`CASE`, `SENSITIVE`, `COLUMN`, `NAMES`], // optional, for deep linking to records across tables.
          },
        ],
      },
    },
    {
      resolve: `gatsby-plugin-typegen`,
      options: {
        emitSchema: {
          "src/__generated__/gatsby-schema.graphql": true,
          "src/__generated__/gatsby-introspection.json": true,
        },
        emitPluginDocuments: {
          "src/__generated__/gatsby-plugin-documents.graphql": true,
        },
      },
    },
    "gatsby-plugin-eslint",
    `gatsby-theme-material-ui`,
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
        name: `gatsby-starter-default`,
        short_name: `starter`,
        start_url: `/`,
        background_color: `#663399`,
        theme_color: `#663399`,
        display: `minimal-ui`,
        icon: `src/images/gatsby-icon.png`, // This path is relative to the root of the site.
      },
    },
    {
      resolve: `gatsby-plugin-typescript`,
      options: {
        isTSX: false, // defaults to false
        jsxPragma: `react`, // defaults to "React"
        allExtensions: false, // defaults to false
        onlyRemoveTypeImports: true,
      },
    },
    // this (optional) plugin enables Progressive Web App + Offline functionality
    // To learn more, visit: https://gatsby.dev/offline
    // `gatsby-plugin-offline`,
  ],
}
