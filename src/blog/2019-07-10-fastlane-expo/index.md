---
slug: "fastlane-expo"
date: 2019-07-10T22:54:46
author: "Jamie"
title: "Blog Post Driven Development: Fastlane Expo"
---

## "Blog Post Driven Development"

Every now and then I have a project I want to put out into the world but there are aspects to it that I am unsure about. This blog post puts my thoughts out in a cohesive manner that I can point to in order to get feedback and provide a starting point for the project. It's basically an early PR.

## Background

I have been working on the automatic deployment of the [Chronic](http://chronic.io) mobile application and there are some aspects to it that cannot currently be easily automated. I cannot find tools or libraries that allow me to perform some of the actions needed, as explained below.

The Chronic mobile application is built using React Native with [expo](http://expo.io). Expo is great because you can build an iOS application on Expo servers and download the `.ipa` that is needed for the Apple App store very easily. Expo provides command line utilities to perform the build. Automation loves command line utilities.

In addition, I plan on using [fastlane](http://fastlane.tools) for some of the deployment needs. For example, Fastlane has a tool called [Match]() which is used to deal with the Apple certificates needed to deploy the application. Dealing with certificates with a team is a pain and Match solves this by using a centrally-located repository (private git repo) to store those certificates so everyone on the team can use them to codesign the deployed artifacts. Another great tool from Fastlane is [Gym](). Gym can be used to deploy an `.ipa` to Apple's TestFlight servers so beta tester can install the updated version. Fastlane was built for automation.

## The Problem

This all seems rosey and great but there are a few holes that need filling in order to get the deployments to work good with Expo. Fastlane works great with "normal" React Native projects but a lot of their tools and plugins require an XCode project to work. This is where I propose a Ruby gem (Fastlane and it's plugins are built in Ruby) that contains the missing plugins needed for Fastlane to work better with Expo. Right now, it is called `fastlane-expo`.

For example, there is a bult-in Fastlane plugin to increment the build number in an XCode project that can be added to a Fastlane deployment script so the build can be incremented which TestFlight will treat as a new version. Expo has it's own verioning stored in an `app.json` file that should be incremented. I cannot find a plugin that will do that right now, so that will be part of this new `fastlane-expo` project.

## The Proposal
