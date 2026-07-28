%{
  title: "Careless Spotify",
  author: "Jamie Wright",
  slug: "careless-spotify",
  summary: "Trying to launch a Spotify app? In this economy?",
  date: "2026-07-11",
  published: true,
  tags: ["mixtape", "projects"],
  cover_image: "/images/blog/introducing-mixtape/hero-image.png"
}
---

## Finding Gary

*🎶🎶🎶* \
Ain't a lot of boys named Gary these days, \
Born with a cigarette glued to their face, \
Fixing anything that a hammer can handle, \
Gary saves money 'cause Gary don't gamble \
*🎶🎶🎶*

I would of never found out about Stephen Wilson, Jr., his song about Gary, Thunder Jackson, and countless other songs from every genre of music if it weren't for Spotify.

It's the only algorithm that I guard with all my might, 'Dad, play that West Virgina song' be dammed. Not on my algorithm, sister.

## 🫶 Spotify

First off, ~🎶fuck your bitch and the click you claim🎶~ let me get this off my chest. Spotify, **please use more of your revenue and power to pay the artists** that provide you this platform. A platform that gives your CEO a salary worth more in one year than one of most successful artists of all time.

---

Since 2018, I have been using Spotify to discover new music and build my playlists. One playlist per month to hold all the music I discovered that month.

I always appreciate the platform's ability to help me discover new music.

It's a blasty to be able to go back, pick any year and any month and listen to the songs I discovered that month. So, like any nerd would do, I built a Spotify app to help automate that.

I wanted to share my new music discoveries as well as see what others have discovered. It's been so fun creating and curating these playlists but there were aspects that could make it easier. Since I wanted to discover more music on Spotify, I wanted others to curate their own playlists as well.

## Spotify could not care less

Spotify has recently made it much harder to build applications on their platform by reducing developers ability to distribute apps built for their platform. And it seems like they don't care.

It seems they now are treating developers like a nuisance instead of an integral part of their community. Spotify's priorities seem to be money, control, then the community. The artists, users, and developers come after the money.

On February 6 of this year (2026), Spotify announced that the following changes to their 'Developer Access' program:

1. Reducing the number of users allowed in 'Development Mode' from 25 to 5.
2. Developers are required to be on any paid plan to access the Spotify Web API.
3. API access to various endpoints have been removed.
4. Developers can only have one app per account in 'Development Mode'.
5. To move out of developer mode, developers must prove a monthly minimum of 250k active users. *Introduced May 15, 2025*

All of these policy changes seem, from the outside, to help protect Spotify's revenue stream, it's moat, and not the artists, nor the developers, nor Spotify's own marketing team.

Let's address them from the aspect of the Spotify developer.

### Reducing the number of users allowed in 'Development Mode'

On it's own, I give this one a pass.

However, I feel like this will result in less testing and less feedback from users on Spotify apps. This could result in an increase of poor application experiences within Spotify's ecosystem.

Going from 25 to 5 users is an 80% drop in users and that seems unnecessary. This alongside the other changes makes getting distribution more difficult.

### Developers are required to be on any paid plan

Making this a requirement for development mode apps seems ridiculous.

I understand that Spotify wants to make sure that developers are serious about their apps because 'they can afford it' but this seems like a cash grab.

There are many developers who are just starting out and may not have the funds to pay for a paid plan but they have a love for music and are curious. To that, this is stifling. It results in a smaller and less diverse developer community.

This will simply result in fewer and less creative apps in the Spotify ecosystem as well as less adoption of the apps currently on the Spotify developer platform.

A small but better improvement should make this a requirement only when the app is ready to go live. Bot accounts could not create apps.

Alternatively, restrict various live API endpoints to paid plans. This would allow developers to build and test their apps without having to pay for a paid plan until they are ready to go live.

### API access to various endpoints have been removed

Spotify removed a majority of the endpoints that could be used to scrape data from Spotify, so I can understand why Spotify would want to remove these endpoints.

This affects only new applications on the platform as Spotify rolled back their decision to remove the endpoints for existing apps that rely on these endpoints.

Speaking up can work.

### Developers can only have one app per account

This is aggregeous and unfair to the developers as well as Spotify's own platform. It simply does not make sense.

Since there is now a one-app limit that anyone (*cough* on a paid plan *cough*) can create **and** the minimum of active users required to move out of development mode is so high, this creates an impossible scenario for any new Spotify app to get distribution.

In order to sign up for my new app that is gaining traction, I, as the developer, now need to provide instructions for you, as the user, to create a Spotify app on your own account and then provide the secret key for my app to store.

This is just to get you to sign up and it is already a high bar for any user to jump over. But you, as the user, do it because my app is so popular and cool.

But now, another, even cooler app comes along that you want to sign up for.

That new app requires the same 'create-your-own-app' process. However, you already have an app on your account and cannot create another one due to the one-app limit. So, you now have to choose between the app that you fell in love with and the new up and coming app.

This is a lose-lose-lose-lose situation for everyone involved. The Spotify developer, the Spotify user, Spotify itself, and the artist on Spotify.

Additionally, how do I test my applications now if I can only have one app?

Do I have to add my ngrok test endpoint to my production app alongside the production endpoints? It doesn't seem like a great idea to pollute all of your environments of your application. Do I have to sign up for another Premium Spotify account just to have a staging environment? A QA environment?

Spotify has made Apple Music seem more attractive simply based on a better ecosystem for their users.

### A monthly minimum of 250k active users

What? How does this get done?

The 'developer program' clearly now seems like a farse. Made only for large companies with established users and courted by Spotify only to increase the user base on Spotify. Helping developers make a part of their living from their Spotify apps that directly benefit the Spotify ecosystem be dammed.

How does the developer even get to 250k active users that need to each a.) have a paid Spotify account, b.) do not already have an app tied to their account, c.) can create their own Spotify app, and d.) willing to share their Spotify app secret key with the developer? That seems like a high barrier to entry for any new app on the Spotify platform.

Spotify, how does a developer get from 5 users you specify, whom can easily sign up using just their Spotify accounts, to grow to 250k active users? What if they are at 240k active users? Are they denied as well? 240k active users of what?

## The end is near

Spotify is not serious about developers and their apps. They seem, from the outside, to only seriously care about their revenue and their moat.

Spotify used to be against the corpotate greed of the music industry and now they are just another corporate entity that is only concerned with their bottom line.

I love the Spotify platform, but their policies suck ass.

I hope they do better. There seems to be a better way for artists, both musical and nerdy, to make money from a platform that directly benefits from said artists.
