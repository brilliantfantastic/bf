import { Link } from "gatsby"
import PropTypes from "prop-types"
import React from "react"

import H1 from "../H1"

const Header = ({ text }) => (
  <div>
    <div>
      <H1 style={{ fontWeight: `300` }}>
        <Link
          to="/"
          style={{
            color: `black`,
            textDecoration: `none`,
          }}
        >
          {text}
        </Link>
      </H1>
    </div>
  </div>
)

Header.propTypes = {
  text: PropTypes.string,
}

Header.defaultProps = {
  text: ``,
}

export default Header
