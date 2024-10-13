# General Information

## Primary Mirrors

https://github.com/grokloc/grokloc-db

https://git.sr.ht/~grokloc/grokloc-db

## Mailing List

https://lists.sr.ht/~grokloc/grokloc-db

## CI

https://github.com/grokloc/grokloc-db/actions

# Proposing Changes

This repository prefers a forge-agnostic workflow.

Please do not propose a change via a forge-specific
Pull-Request.

In order to propose a change, please send an email to

<~grokloc/grokloc-db@lists.sr.ht>

with a Subject line like:

`Proposed Change: $YOUR_CHANGE_TITLE`

where the content of the email should look like

```
Source Repository: 

$YOUR_PUBLIC_GIT_URL

Branch:

$CHANGE_PROPOSAL_BRANCH

Diff:

$(output of git diff --stat)

Discussion:

$DETAILS
  
```

The proposed changes should be applicable as a single
commit (i.e. please squash). Owners will fetch your 
branch directly using the repository and branch you
provide and apply the change if accepted.

Discussion and acceptance will be through the mailing
list.

Signed commits are preferred.

Please make sure you have run `just ci` to make sure
your changes would validate.
