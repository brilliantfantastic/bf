import React from "react"
import styled from "styled-components"

const FooterWrapper = styled.footer`
  flex-shrink: 0;
`

const Footer = () => (
  <FooterWrapper>
    © {new Date().getFullYear()} Brilliant Fantastic
  </FooterWrapper>
)

export default Footer
