import styled from "styled-components"

const BlogPostWrapper = styled.div`
  max-width: 768px;
  width: 75%;

  ${props => props.theme.mq.mobile} {
    width: 90%;
  }

  ${props => props.theme.mq.tablet} {
    width: 85%;
  }
`

export default BlogPostWrapper
