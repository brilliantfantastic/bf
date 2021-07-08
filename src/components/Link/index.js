import React from "react"
import { Link as GatsbyLink } from "gatsby"

import cn from "classnames"

const baseClassName = (fancy) => `
  text-black
  ${fancy ? "wavy hover:underline" : "underline hover:no-underline"}
`;

const Link = ({ activeClassName,
                children,
                className,
                external=false,
                fancy=false,
                to,
                ...rest }) => {
  if (external) {
    return (
      <a
        href={to}
        className={cn(baseClassName(fancy), className)}
        {...rest}>
        {children}
      </a>
    )
  }

  return (
    <GatsbyLink
      to={to}
      activeClassName={activeClassName}
      className={cn(baseClassName(fancy), className)}
      {...rest}
    >
      {children}
    </GatsbyLink>
  )
}

export default Link
