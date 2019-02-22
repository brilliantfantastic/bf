import React from "react"
import styled from "styled-components"

const FooterWrapper = styled.footer`
  flex-shrink: 0;
  font-family: ${props => props.theme.fonts.body};
  margin: 1em auto;
`

const Footer = () => (
  <FooterWrapper>
    &copy; {new Date().getFullYear()} Brilliant Fantastic
  </FooterWrapper>
)

export default Footer
