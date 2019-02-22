import { Link } from "gatsby"
import PropTypes from "prop-types"
import React from "react"
import styled from "styled-components"

const LogoLink = styled(Link)`
  color: black;
  font-family: ${props => props.theme.fonts.heading};
  font-size: 2rem;
  text-decoration: none;
`

const HeaderWrapper = styled.div`
  margin: 16px;
`

const Header = ({ siteTitle }) => (
  <HeaderWrapper>
    <LogoLink to="/">
      {siteTitle}
    </LogoLink>
  </HeaderWrapper>
)

Header.propTypes = {
  siteTitle: PropTypes.string,
}

Header.defaultProps = {
  siteTitle: ``,
}

export default Header
