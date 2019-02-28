import { Link } from "gatsby"
import PropTypes from "prop-types"
import React from "react"
import styled from "styled-components"

import Menu from "../BurgerTime"

const HeaderWrapper = styled.div`
  display: flex;
  justify-content: space-between;
  margin: 16px;
`

const LogoLink = styled(Link)`
  color: black;
  font-family: ${props => props.theme.fonts.heading};
  font-size: 2rem;
  text-decoration: none;
`

const MenuWrapper = styled.div`
  align-self: flex-end;
`

const Header = ({ siteTitle }) => (
  <HeaderWrapper>
    <LogoLink to="/">
      {siteTitle}
    </LogoLink>
    <MenuWrapper>
      <Menu />
    </MenuWrapper>
  </HeaderWrapper>
)

Header.propTypes = {
  siteTitle: PropTypes.string,
}

Header.defaultProps = {
  siteTitle: ``,
}

export default Header
