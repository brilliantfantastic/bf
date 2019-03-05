import React, { Component } from "react"

import Burger from "./Burger";
import Menu from "./Menu";

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
    const { children, foreColor } = this.props;

    return (
      <React.Fragment>
        <Burger closed={closed} foreColor={foreColor} onClick={this.toggleMenu} />
        {!closed && <Menu children={children} />}
      </React.Fragment>
    )
  }
}

export default BurgerTime
