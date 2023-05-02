# Content Blocking Filters
*Filter lists for uBlock Origin*

## What is blocked

### Ads
- Advertisements
- Banners and links to related content

### Twitter Minimal UI
- Timeline interruptions
    - Discover New Lists
    - Who To Follow
    - Expand Your Timeline With Topics 

### Twitter Politics
- Politics, mostly from America
- Racism
- Fascism
- Environmentalism
- Anything else that's popular, depressing, and unsolvable (*e.g.* COVID-19)

*You can also install my [Twitter user style](https://github.com/Aldaviva/userstyles/raw/master/styles/twitter.user.css) to make the Twitter webapp even more minimal. These two files complement each other and I recommend installing both; one does not replace the other.*

## Installation
1. If you haven't done so already, install [**uBlock Origin**](https://github.com/gorhill/uBlock/#installation) (or another compatible ad blocker) in your web browser.
1. Click the <img src="https://github.com/gorhill/uBlock/raw/master/src/img/ublock.svg" height="16px" alt="uBlock Origin"> uBlock Origin button in your toolbar.
1. Click the ⚙️ dashboard button.
1. Go to the **Filter Lists** tab.
1. In the Custom section at the bottom, check **Import**.
1. Copy and paste the desired text file's raw URL into the textarea, one URL per line.
    - [Ads](https://raw.githubusercontent.com/Aldaviva/content-blocking-filters/master/filters/ads.txt)
    - [Twitter Minimal UI](https://raw.githubusercontent.com/Aldaviva/content-blocking-filters/master/filters/twitter-minimal-ui.txt)
    - [Twitter Politics](https://raw.githubusercontent.com/Aldaviva/content-blocking-filters/master/filters/twitter-politics.txt)
1. Click the **Apply Changes** button in the top-left corner of the page.
1. Refresh the page that you want to filter, *e.g.* Twitter.
