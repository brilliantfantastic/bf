import React from "react"

import BlogPostExcerpt from "../BlogPostExcerpt"

const BlogPostList = ({ posts }) => (
  <div>
    {
      posts.filter(post => post.node.frontmatter.title.length > 0)
      .map(({ node: post }) => (
        <BlogPostExcerpt key={post.id} post={post} />
      ))
    }
  </div>
)

export default BlogPostList
