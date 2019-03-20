---
slug: "launch-laziness-paging"
date: 2019-03-20T07:05:46
author: "Jamie"
title: "Launch: Paging in Laziness"
---

A few days ago, I launched the [ability to automatically page through results in Slack](https://github.com/brilliantfantastic/laziness/pull/20) using Slack's [cursor paging implementation](https://api.slack.com/docs/pagination#cursors).

This was necessary to implement now because [Tatsu](https://tatsu.io) uses Laziness and I had a customer who could not add their channel on Tatsu because it was behind a page. They actually had over 500 channels! This was simply not an issue up until now because most people do not have more than 100 active channels, which is the default paging size for retrieving channels.

I liked this implementation because it was easy to implement from the client. If you wanted to auto-page results, you simply had to a `page` named parameter and voilà, you had all the results returned to you.

```rb
client = Slack::Client.new(access_token)
client.conversations.all                        # no paging, will only return the first 100 results
client.conversations.all(page: { limit: 500 })  # paging enabled, will return all the results via multiple API calls with a limit of 500
```

This made it trivial to implement in Tatsu.

Paging was implemented on all api endpoints that support cursor paging and that Laziness wraps. This includes:

* `channels.list`
* `conversations.list`
* `conversations.members`
* `groups.list`
* `im.list`
* `users.list`

There are other options available to the `page` argument as well.

* `sleep_interval` will automatically sleep in between each request for another page in order to avoid [rate limiting](https://api.slack.com/docs/rate-limits)
* `max_retries` will automatically try again after sleeping for the number of seconds Slack requires after receiving a rate limit error

If you have any issues or questions, feel free to [submit a pull request](https://github.com/brilliantfantastic/laziness/pulls).

Happy paging.
