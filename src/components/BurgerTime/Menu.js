import React from "react"
import styled from "styled-components"
import { rgba } from "polished"

const Overlay = styled.div`
  background-color: ${props => rgba(props.theme.colors.foreground, 0.9)};
  height: 100%;
  left: 0;
  overflow-x: hidden;
  position: fixed;
  top: 0;
  width: 100%;
  z-index: 1;
`

const MenuWrapper = styled.div`
  align-items: center;
  display: flex;
  flex-direction: column;
`

const Menu = ({ children }) => (
  <Overlay>
    <MenuWrapper>
      {children}
    </MenuWrapper>
  </Overlay>
)

export default Menu
