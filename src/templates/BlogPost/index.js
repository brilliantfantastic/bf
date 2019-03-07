import React from "react"
import { graphql } from "gatsby"

const BlogPostTemplate = ({ data }) => {
  const { markdownRemark: post } = data

  return (
    <div>
      <h1>{post.frontmatter.title}</h1>
      This is a blog post
    </div>
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
