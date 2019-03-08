import React from "react"
import { StaticQuery, graphql } from "gatsby"
import styled from 'styled-components'

import BlogPostList from "../components/BlogPostList"
import ContentWrapper from "../components/ContentWrapper"
import H1 from "../components/H1"
import Header from "../components/Header"
import Layout from "../components/Layout"
import SEO from "../components/SEO"

const MainH1 = styled(H1)`
  line-height: 1.2;
  padding-bottom: 1em;
`

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
                author
                slug
                title
                sub_title
              }
            }
          }
        }
      }
    `}
    render={data => (
      <Layout backgroundColor={props => props.theme.colors.skin}>
        <SEO title="Fantastical Blog" keywords={[``]} />
        <Header
          displayLogo={true}
          foreColor={props => props.theme.colors.skin}
          siteTitle={data.site.siteMetadata.title}
        />
        <ContentWrapper>
          <MainH1>Fantastical Blog</MainH1>
          <BlogPostList posts={data.allMarkdownRemark.edges} />
        </ContentWrapper>
      </Layout>
    )}
  />
)

export default BlogPage
