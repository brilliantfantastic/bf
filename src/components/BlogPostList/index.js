import React from "react"
import styled from "styled-components"

import BlogPostExcerpt from "../BlogPostExcerpt"
import BlogPostWrapper from "../BlogPostWrapper"

const BlogPostList = ({ posts }) => (
  <BlogPostWrapper>
    {
      posts.filter(post => post.node.frontmatter.title.length > 0)
      .map(({ node: post }) => (
        <BlogPostExcerpt key={post.id} post={post} />
      ))
    }
  </BlogPostWrapper>
)

export default BlogPostList
