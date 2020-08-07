---
slug: "announcing-juvet"
date: 2020-08-07T12:00:00.000Z
author: "Jamie"
title: "Announcing Juvet"
sub-title: "Working towards a more familiar chat bot framework"
---

I have been a fan of chat bots for quite a while, going back to the [Campfire](https://basecamp.com/retired/campfire) days when I built [my first plugin](https://github.com/github/hubot-scripts/commit/dfdb2805154c8f927ac9d8cee07890a64bda0531#diff-cd0614ffeae829469ec4cc2a9fe50202). Since then I have been hooked. I have been [talking about chat bots](https://www.youtube.com/watch?v=3De5_5Twnjc), [building chat bots](https://slack.com/apps/A04A2V1QU-tatsu), and [providing tools](https://github.com/tatsuio/dialogue) for others to build chat bots.

Chat bots are important. They are important to the consumer because they are familiar (you know how to text) and they are easy to access (you already have the software). Chat bots are important to developers and entrepreneurs because they can extend you services and offerings to platforms where the customers already are.

**Developers need more familiar tooling for building chat bots.**

Today I would like to announce [Juvet](https://github.com/juvet/juvet), an MVC framework for building chat bots written in Elixir. Its aim is to make the building of chat bots as familiar as building web applications.

We have amazing tools to build web applications productively. The goal of Juvet is to borrow this same approach and help developers with building chat bots for platforms like Slack, Microsoft Teams, SMS, and more using familiar patterns.

## MVC, you say?

If you look at how chat bots work, you will see that you have a very familiar pattern.

A conversation request is received from a chat bot platform endpoint (i.e. Slack). Then you, as the developer, process that request within your code, and send back a response to that endpoint.

Sound’s familiar, right?

The model-view-controller (MVC) pattern that is used in so many of the popular web frameworks today like Rails, Django, and Laravel, can be adopted to process conversational UIs from chat bots in a similar way.

This MVC architecture and the organization of code helps developers reason about the system as a whole.

As a freelancer, I have seen a lot of hard to understand code around the handling of chat bot requests. The request handler is often tied into the same code applying business logic to process the request. A good framework will remove this intertwined dependency from the code that matters to the business. As an early developer in this space, I have built my fair share of code like this.

However, I recently built a similar MVC framework in Ruby for a chat bot client. The framework I built helped facilitate nimble iterative feature releases and quick bug fixes. I have been a much happier developer working in this familiar framework.

From this experience, I know that a system like this excels in the real world.

Juvet will have all the familiar pieces of an MVC framework that you have grown to love, like a router to route requests from a chat bot framework.

### Add router here

A controller and action in Juvet will handle the incoming requests and prepare the data for the response.

### Add controller here

A view template will be used to describe what the user will see on their chat bot platform.

### Add view here

The result is a beautifully crafted response that the user sees inside Slack.

### Add slack message here

## Why Elixir?

[Elixir](http://elixir-lang.org) is the perfect language and framework for building chat bots.

First, Elixir runs on top of the Erlang virtual machine. [Erlang](https://www.erlang.org/) was developed at Ericsson to handle communication systems. 90% of all internet traffic going through routers and switches controlled by Erlang.

Sounds perfect.

Erlang is used to build massively scalable soft real-time systems with requirements on high availability. Scalable real-time systems? High availability?

Sounds like chat bots.

Elixir can leverage the Erlang OTP library, which is a set of libraries which facilitate the scalability and fault tolerance properties of Erlang.

Elixir developers can create small OTP processes that can hold state and these sandboxed processes can pass messages to other processes with no ceremony. Each process can represent a single sandboxed chat bot. If one process goes down, only one chat bot goes down. This is not possible in frameworks built in Ruby or Node without a lot of home-spun code to protect you from bringing down all the bots on your system.

Theses OTP processes can fail and be spun up again automagically. Even new code can be deployed and these OTP processes will not be shut down, allowing you to deploy new Elixir code at any time without interrupting the bots.

Sounds perfect.

## You can support this

Juvet will be open source so that every developer and organization can take advantage of this framework to help develop for multiple chat bot platforms rapidly.

I want the development on this framework to be sustainable for me as I plan on putting a lot of energy and effort into this project alongside my day to day work.

Currently Juvet is being developed under the [Sponsorware](https://github.com/sponsorware/docs) release strategy for open source. The project is open only to GitHub sponsors until the goal of 75 sponsors is reached. At that time, Juvet will be open sourced for all.

If you are an early sponsor, you will help direct the project as you will have full access to the unreleased private repository where you can submit pull requests and open up issues. In addition, you will be able receive updates on the progress of the project, video tutorials on how to use Juvet, tips on chat bot development, and a few special surprises I have in mind.

If you care about the chat bot industry or if you are interested in building chat bots for yourself or your organization, please [consider supporting this endevor by sponsoring me on GitHub](https://github.com/sponsors/jwright). I’d love to thank [Keith](https://github.com/keiththomps) on being my very first sponsor on GitHub. 😍

My hope is that Juvet will be my little dent in the chat bot development world. I hope it helps moves more developers to build such fun little programs.
