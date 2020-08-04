import React from "react"
import { Link as GatsbyLink } from "gatsby"

import cn from "classnames"

const Link = ({ activeClassName,
                children,
                className,
                external=false,
                fancy=false,
                to,
                ...rest }) => {
  if (external) {
    return (
      <a href={to} {...rest}>
        {children}
      </a>
    )
  }

  return (
    <GatsbyLink
      to={to}
      activeClassName={activeClassName}
      className={cn(`text-black ${fancy ? "wavy hover:underline" : "underline hover:no-underline"}`, className)}
      {...rest}
    >
      {children}
    </GatsbyLink>
  )
}

export default Link
