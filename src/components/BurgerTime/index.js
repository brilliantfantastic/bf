import React, { Component } from "react"
import styled from "styled-components"

const Bun = styled.div`
  cursor: pointer;
`

const Patty = styled.div`
  background-color: black;
  height: 5px;
  margin: 6px 0;
  width: 35px;
`

const Burger = ({ onClick }) => (
  <Bun onClick={onClick}>
    <Patty />
    <Patty />
    <Patty />
  </Bun>
)

const MenuWrapper = styled.div`
  align-items: center;
  display: flex;
  flex-direction: column;
`

const Menu = ({ children }) => (
  <MenuWrapper>
    {children}
  </MenuWrapper>
)

class BurgerTime extends Component {
  state = {
    closed: true,
  }

  toggleMenu = () => {
    this.setState((prevState) => {
      return { closed: !prevState.closed };
    })
  }

  render() {
    const { closed } = this.state
    const { children } = this.props;

    return (
      closed ? <Burger onClick={this.toggleMenu} /> : <Menu children={children} />
    )
  }
}

export default BurgerTime
