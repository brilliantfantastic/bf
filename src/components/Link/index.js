import styled from "styled-components"
import { Link as GatsbyLink } from "gatsby"

const Link = styled(GatsbyLink)`
  color: ${props => props.theme.colors.foreground};
  text-decoration: ${props => props.fancy ? `underline wavy` : `underline solid`};

  &:hover {
    text-decoration: ${props => props.fancy ? `` : `none`};
    text-decoration-style: ${props => props.fancy ? `solid` : ``};
  }
`

export default Link
