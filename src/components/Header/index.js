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
  color: ${prop => prop.theme.colors.foreground};
  font-family: ${props => props.theme.fonts.heading};
  font-size: 2rem;
  line-height: 1.2;
  text-decoration: none;
`

const MenuContents = styled.ul`
  color: ${props => props.theme.colors.background};
  display: flex;
  height: 100vh;
  flex-direction: column;
  list-style-type: none;
  margin: 0 auto;
  padding: 0;
  text-align: center;
`

const MenuHeading = styled.h3`
  font-family: ${props => props.theme.fonts.heading};
  font-size: 3rem;
  font-weight: 400;
  letter-spacing: 0.2em;
  line-height: 1.2;
  text-transform: uppercase;
`

const MenuHeader = ({ children }) => (
  <li>
    <MenuHeading>{children}</MenuHeading>
  </li>
)

const MenuItem = styled.li`
  font-size: 2rem;
  padding: 16px 0;
`

const MenuSection = styled.ul`
  list-style-type: none;
  margin: 0 auto;
  padding: 0;
  text-align: center;
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
      <Menu>
        <MenuContents>
          <MenuHeader>Work</MenuHeader>
          <MenuSection>
            <MenuItem>Latest</MenuItem>
            <MenuItem>Chronic</MenuItem>
            <MenuItem>Tatsu</MenuItem>
          </MenuSection>
          <MenuHeader>About</MenuHeader>
          <MenuHeader>Blog</MenuHeader>
          <MenuHeader>Reach Out</MenuHeader>
        </MenuContents>
      </Menu>
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
