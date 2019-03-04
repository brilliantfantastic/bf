import React from "react"
import { StaticQuery, graphql } from "gatsby"

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
      }
    `}
    render={data => (
      <Layout backgroundColor={props => props.theme.colors.skin}>
        <SEO title="Blog" keywords={[``]} />
        <Header
          foreColor={props => props.theme.colors.skin}
          siteTitle={data.site.siteMetadata.title}
        />
      </Layout>
    )}
  />
)

export default BlogPage
