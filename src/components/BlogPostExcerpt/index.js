import React from "react"
import { Link } from "gatsby"
import styled from 'styled-components'

import H2 from "../H2"

const BlogPostAuthor = styled.div`
  padding: 8px 0;
`

const BlogPostBody = styled.div`
  padding: 16px 0;
`

const BlogPostWrapper = styled.div`
  padding: 16px 0;
`

const BlogPostExcerpt = ({ post }) => (
  <BlogPostWrapper>
    <H2>
      <Link to={`/blog/${post.frontmatter.slug}`}>
        {post.frontmatter.title}
      </Link>
    </H2>
    <BlogPostBody>
      {post.excerpt}
    </BlogPostBody>
    <BlogPostAuthor>
      carefully crafted with <span role="img" aria-label="love">🖤</span> on {post.frontmatter.date}
      <p>(this is totally a joke...the carefully crafted part)</p>
    </BlogPostAuthor>
  </BlogPostWrapper>
)

export default BlogPostExcerpt;
