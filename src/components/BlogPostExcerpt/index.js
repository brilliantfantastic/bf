import React from "react"

import H2 from "../H2"

const BlogPostExcerpt = ({ post }) => (
  <H2>{post.frontmatter.title}</H2>
)

export default BlogPostExcerpt;
