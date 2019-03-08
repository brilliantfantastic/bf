import styled from "styled-components"

const ContentWrapper = styled.div`
  padding: 3em 2em 0.5em;

  ${props => props.theme.mq.mobile} {
    padding-left: 0.5em;
  }

  ${props => props.theme.mq.tablet} {
    padding-left: 1em;
  }

  ${props => props.theme.mq.desktop} {
    padding-left: 2em;
  }

  ${props => props.theme.mq.xl} {
    padding-left: 3em;
  }
`

export default ContentWrapper
