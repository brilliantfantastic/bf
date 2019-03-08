import React from "react"
import styled from "styled-components"

import BlogPostBody from "../BlogPostBody"
import BlogPostMetadata from "../BlogPostMetadata"
import H2 from "../H2"
import H3 from "../H3"
import Link from "../Link"

const BlogPostWrapper = styled.div`
  padding: 16px 0;
`

const SubTitle = styled(H3)`
  margin: 4px 0 8px;
`

const BlogPostExcerpt = ({ post }) => (
  <BlogPostWrapper>
    <H2>
      <Link to={`/blog/${post.frontmatter.slug}`}>
        {post.frontmatter.title}
      </Link>
    </H2>
    {post.frontmatter.sub_title &&
      <SubTitle>{post.frontmatter.sub_title}</SubTitle>
    }
    <BlogPostBody>
      {post.excerpt}
    </BlogPostBody>
    <BlogPostMetadata>
      carefully crafted with <span role="img" aria-label="love">🖤</span> on {post.frontmatter.date}
      <p>(this is totally a joke...the carefully crafted part)</p>
    </BlogPostMetadata>
    <Link fancy to={`/blog/${post.frontmatter.slug}`}>
      Read more &#8594;
    </Link>
  </BlogPostWrapper>
)

export default BlogPostExcerpt;
