import React from "react"
import cn from "classnames"

import Link from "../Link"

const MenuLinkItem = ({ active=false,
                        className,
                        external,
                        href,
                        text,
                        ...rest }) => (
  <Link
    external={external}
    to={href}
    className={cn(`
                  inline-flex
                  items-center
                  px-1
                  pt-1
                  border-b-2
                  ${active ? "border-bf-green" : "border-transparent"}
                  text-sm
                  font-medium
                  leading-5
                  no-underline
                  focus:outline-none
                  ${active ? "focus:border-indigo-700" : "focus:border-gray-300"}
                  transition
                  duration-150
                  ease-in-out`,
                className)}
    {...rest}
  >
    {text}
  </Link>
)

export default MenuLinkItem
