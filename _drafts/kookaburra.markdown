---
layout: default
title:  "Kookaburra 01 - The plan"
date:   2021-11-10 08:30:18 +1100
tags: ['kookaburra', 'plan', 'saas', 'django']
---

TODO:
* look up other eco village examples
* Paste examples here


If you're anything like me, you like solving problems. I found myself in an oppotunity to solve two problems at once recently, so I thought I might share my thoughts as I go, and see if Ican spot some things that slow me down.

# Living in an Eco-Village

If anyone's lived in or looked at ecovilages before, you'd know that they are focused or based on two things: working and communicating. 
All of the processes within the eco village is generally done by the inhabitants. Some good examples include []() where the process of growing food is done by the community. So too is the building of buildings and other things.

I'm generally new to eco-villages, and fortunate enough to be a part of the Illabunda eco-village that my wife's family built during the financal crisis of 2008.

I've seen pictures and stories of the original vision of the eco-village, and the exciting ideas that could take place.

What sets Illabunda apart though, is the proximity to suburbia. Infact, we're right smack in the middle of it. 

* Picture of map 

this provides unique challenges in two ways:

1. We attract suburban people who want a nice green place to live, but not a green lifestyle that comes with it. 
2. We're surrounded by suburban interests.

This posts a challenge as the work involved in maintaining the eco-village as an eco-village(and not a nother run-of-the-mill apartment place) is that the work is hard done by. 

For a majority of the jobs, currently, are done by the original visionaries who've built the place.

There's also plenty of disagreements and arguements, which no eco-village is without, but combining this with people who don't want to live a green life-style leads to cases where we have to manually jump into garbage bins to compact rubbish so that waste can be cheaply (for our poorer residences) and neatly (for everyone) contained.

I believe that part of the process of healing and getting everyone on the same page is to write down that page to begin with; such as what is mentioned in the book "7 habits of highly effective people."

I think it's a good time to recover the old website and make it more modern but also more useful to our little community.

# The missing django piece

I love using django. Ilove using python, but by far my favourite framework to use in python is django. Some libraries stick out as good to use, while others have fallen by the wayside as many libraries to. Wagtail is a great example of a great library. 

But there doesn't seem to be a decent "forum" or "communication" app for django. There is misargo - however, that is given as the whole package, not so much as something that one could plug into their existing site.

* link to misargo

I actually tried to run misargo, and came across endless issues trying to customise it to fit my own needs.

After getting a new job where I work on django-related apps on a full time basis, I've found that making good quality software is not as hard as it s made out to be. 

# Introducing KOOKABURRA

`Kookaburra` is my attempt at making a forum-like software that works for all of us, and I invite you to come and join me.

I say "forum-like" as it might not neatly fit what you remember of the ol' phpBB days, but I'm aiming it to be able to fit those wants as needed.

The main focus of kookaburra is to be... usable? hackable? adaptable?

Let's consider:

* Usable - one should be able to add to `INSTALLED_APPS` and follow minimal steps to get a forum connected to their site.
* Hackable - the forum software should be able to be overwriten much like the rest of django.
* Adaptable - changes should be able to fit most use-cases.

One thought that I'm yet to do is think of the *"Zen of Kookaburra"* much like there's a *"Zen of Wagtail"* and *"Zen of python"*

But let's not get too ahead of ourseves, because it's enough for me to make things, but I also need to make things usable for others, which is going to be the real challenge. 

Let's talk about layout and how I've envisioned the baseline of what this project is. 

# Kookaburra layout
Remember, I'll be coming from an eco-village mindset, so some of the examples might be how I would hope to use it. You can adapt to your needs. ('ll try and envision a "board games forum" as well)

* Image of main view 

## Posts

Each `Post` is the start of a discussion topic, similar to any other forum. It has an original author and can be `Locked` or `Edited` by either the author or the moderators, and `Pinned` to the top of 
the section that it is posted in. 

People can also "Follow" Posts, to get updated when it changes. They can also have `Tags` to categorise them 

## Sections

Each `Post` gets posted to a `Section` (With a catch-all null section for General Posts). The sections are their own sub-forums in a way, and provide greater grouping of posts.

Each `Section` can have its own description and optionally cover photo, metadata, etc. It can have its own `Follower`s and `Member`s list, and postings can be limited to members only in the case of an executive team or updates board.

## Posts and comments

Posts are started by an author and then commented on by others in the community. Files can be attached to posts, and any files that are contributed by comments are attached to the main post as well, to provide a single source of information ( all focusing around the `Post`). - Or, file uploads can be turned off for comments.

## Different kinds of posts

While Posts are the focuspoint of the discussions, there is room for different kind of Posts, which I'll share below. Making different post types allow us to attach different logic to the post objects if required. For instance, a `PollPost` would allow people to vote on certain options, which has a different modelling behaviour to a regular `DiscussionPost`

### Discussion post

* image of a discussion post

### Poll post

* image of a poll post

### Gallery Post

* image of a gallery

### Event Post 

* image of an event post

## Section views and filters

Along with different post types, the Sections allow for different "Views" to be created. For instance, a view for the "Maintenance Team" Section could be made to only view the `EventPosts` and thus be rendered in more of a calandar view.

Another Section, "Bushcare" could create a `View` that filters for `DiscussionPost`, `GalleryPost`, and `EventPost` with the tag `#FAQ` to make a FAQ tab on their section.

* Section view posts 

# Putting it all together

In the end I hope this software works
