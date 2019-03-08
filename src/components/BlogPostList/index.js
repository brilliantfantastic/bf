import React from "react"
import styled from "styled-components"

import BlogPostExcerpt from "../BlogPostExcerpt"

const BlogPostListWrapper = styled.div`
  max-width: 768px;
  width: 75%;

  ${props => props.theme.mq.mobile} {
    width: 90%;
  }

  ${props => props.theme.mq.tablet} {
    width: 85%;
  }
`

const BlogPostList = ({ posts }) => (
  <BlogPostListWrapper>
    {
      posts.filter(post => post.node.frontmatter.title.length > 0)
      .map(({ node: post }) => (
        <BlogPostExcerpt key={post.id} post={post} />
      ))
    }
  </BlogPostListWrapper>
)

export default BlogPostList
