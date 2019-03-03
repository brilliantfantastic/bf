import React from "react"
import styled from "styled-components"
import PropTypes from "prop-types"
import { Link } from "gatsby"

import Menu from "../Menu"

const HeaderWrapper = styled.div`
  display: flex;
  justify-content: space-between;
  margin: 16px;
`

const LogoLink = styled(Link)`
  color: ${prop => prop.theme.colors.foreground};
  font-family: ${props => props.theme.fonts.heading};
  font-size: 2rem;
  line-height: 1.2;
  text-decoration: none;
`

const Header = ({ foreColor, siteTitle }) => (
  <HeaderWrapper>
    <LogoLink to="/">
      {siteTitle}
    </LogoLink>
    <Menu foreColor={foreColor} />
  </HeaderWrapper>
)

Header.propTypes = {
  siteTitle: PropTypes.string,
}

Header.defaultProps = {
  siteTitle: ``,
}

export default Header
