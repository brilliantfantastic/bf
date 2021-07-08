import React from "react"
import { graphql } from "gatsby"

import BlogPostBody from "../../components/BlogPostBody"
import BlogPostMetadata from "../../components/BlogPostMetadata"
import BlogPostWrapper from "../../components/BlogPostWrapper"
import ContentWrapper from "../../components/ContentWrapper"
import Header from "../../components/Header"
import H1 from "../../components/H1"
import H3 from "../../components/H3"
import Layout from "../../components/Layout"
import Link from "../../components/Link"
import SEO from "../../components/SEO"

const BlogPostTemplate = ({ data }) => {
  const { site, markdownRemark: post } = data

  return (
    <Layout backgroundColor={props => props.theme.colors.skin}>
      <SEO title={post.frontmatter.title} keywords={[``]} />
      <Header
        foreColor={props => props.theme.colors.skin}
        siteTitle={site.siteMetadata.title}
      />
      <ContentWrapper>
        <BlogPostWrapper>
          <H1 className="pb-8 leading-tight">{post.frontmatter.title}</H1>
          {post.frontmatter.sub_title &&
            <H3>{post.frontmatter.sub_title}</H3>
          }
          <BlogPostBody
            dangerouslySetInnerHTML={{ __html: post.html }}
          />
          <BlogPostMetadata>
            carefully crafted with <span role="img" aria-label="love">🖤</span> (lol) on {post.frontmatter.date}
          </BlogPostMetadata>
          <Link to={`/blog`}>
            &#8592; Back to all posts
          </Link>
        </BlogPostWrapper>
      </ContentWrapper>
    </Layout>
  )
}

export const query = graphql`
  query BlogPostBySlug($slug: String!) {
    markdownRemark(frontmatter: { slug: { eq: $slug } }) {
      html
      frontmatter {
        date(formatString: "MMMM DD, YYYY")
        author
        slug
        title
        sub_title
      }
    }
    site {
      siteMetadata {
        title
      }
    }
  }
`

export default BlogPostTemplate;
