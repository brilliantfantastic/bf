import React, { Component } from "react"
import styled from "styled-components"

const Bun = styled.div`
  cursor: pointer;
`

const Burger = ({ closed, onClick }) => (
  <Bun onClick={onClick}>
    {closed &&
      <React.Fragment>
        <Patty />
        <Patty />
        <Patty />
      </React.Fragment>
    }
    {!closed && <RotatedPatty />}
  </Bun>
)

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

const Overlay = styled.div`
  background-color: rgba(0,0,0, 0.9);
  height: 100%;
  left: 0;
  overflow-x: hidden;
  position: fixed;
  top: 0;
  width: 100%;
  z-index: 1;
`

const Patty = styled.div`
  background-color: black;
  height: 5px;
  margin: 6px 0;
  width: 35px;
`

const RotatedPatty = styled.div`
  display: inline-block;
  height: 35px;
  overflow: hidden;
  position: relative;
  width: 35px;
  z-index: 10;

  &::before, &::after {
    background-color: #fff;
    content: "";
    height: 5px;
    left: 0;
    margin-top: -1px;
    position: absolute;
    top: 50%;
    width: 100%;
  }

  &::before {
    transform: rotate(45deg);
  }

  &::after {
    transform: rotate(-45deg);
  }
`

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
      <React.Fragment>
        <Burger closed={closed} onClick={this.toggleMenu} />
        {!closed && <Menu children={children} />}
      </React.Fragment>
    )
  }
}

export default BurgerTime
