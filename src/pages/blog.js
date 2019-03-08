import React from "react"
import { StaticQuery, graphql } from "gatsby"

import BlogPostList from "../components/BlogPostList"
import Header from "../components/Header"
import Layout from "../components/Layout"
import SEO from "../components/SEO"

const BlogPage = () => (
  <StaticQuery
    query={graphql`
      query {
        site {
          siteMetadata {
            title
          }
        }
        allMarkdownRemark(sort: { order: DESC, fields: [frontmatter___date] }) {
          edges {
            node {
              excerpt(pruneLength: 250)
              id
              frontmatter {
                date(formatString: "MMMM DD, YYYY")
                slug
                title
              }
            }
          }
        }
      }
    `}
    render={data => (
      <Layout backgroundColor={props => props.theme.colors.skin}>
        <SEO title="Blog" keywords={[``]} />
        <Header
          displayLogo={true}
          foreColor={props => props.theme.colors.skin}
          siteTitle={data.site.siteMetadata.title}
        />
        <BlogPostList posts={data.allMarkdownRemark.edges} />
      </Layout>
    )}
  />
)

export default BlogPage
