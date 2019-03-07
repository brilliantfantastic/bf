const path = require("path")

exports.createPages = ({ graphql, actions }) => {
  const { createPage } = actions

  return new Promise((resolve, reject) => {
    const blogPostTemplate = path.resolve("src/templates/BlogPost/index.js")
    resolve(
      graphql(`
        {
          allMarkdownRemark(
            sort: { order: DESC, fields: [frontmatter___date] }
          ) {
            edges {
              node {
                frontmatter {
                  slug
                }
              }
            }
          }
        }
      `).then(result => {
        if (result.errors) {
          reject(result.errors)
        }
        result.data.allMarkdownRemark.edges.forEach(edge => {
          createPage({
            path: `blog/${edge.node.frontmatter.slug}`,
            component: blogPostTemplate,
            context: {
              slug: edge.node.frontmatter.slug,
            },
          })
        })
        return
      })
    )
  })
}
