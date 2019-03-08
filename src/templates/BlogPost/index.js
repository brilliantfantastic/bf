import React from "react"
import { StaticQuery, graphql } from "gatsby"

import Header from "../../components/Header"
import H1 from "../../components/H1"
import Layout from "../../components/Layout"
import SEO from "../../components/SEO"

const BlogPostTemplate = ({ data }) => {
  const { markdownRemark: post } = data

  return (
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
      render={({ site }) => (
        <Layout backgroundColor={props => props.theme.colors.skin}>
          <SEO title={post.frontmatter.title} keywords={[``]} />
          <Header
            displayLogo={true}
            foreColor={props => props.theme.colors.skin}
            siteTitle={site.siteMetadata.title}
          />
          <div>
            <H1>{post.frontmatter.title}</H1>
            This is a blog post
          </div>
        </Layout>
      )}
    />
  )
}

export const query = graphql`
  query BlogPostBySlug($slug: String!) {
    markdownRemark(frontmatter: { slug: { eq: $slug } }) {
      html
      frontmatter {
        date(formatString: "MMMM DD, YYYY")
        slug
        title
      }
    }
  }
`

export default BlogPostTemplate;
